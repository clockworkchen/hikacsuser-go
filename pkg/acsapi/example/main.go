// Package main 提供使用acsapi包的示例
package main

import (
	"fmt"
	"github.com/clockworkchen/hikacsuser-go/pkg/acsapi"
	"time"
)

// 报警事件回调函数
func alarmCallback(alarmType int, alarmInfo interface{}) error {
	// 打印报警类型和信息
	fmt.Printf("收到报警事件: 类型=%d, 信息=%v\n", alarmType, alarmInfo)
	return nil
}

func main() {
	// 创建门禁系统客户端
	client, err := acsapi.NewACSClient("./sdklog")
	if err != nil {
		fmt.Printf("创建客户端失败: %v\n", err)
		return
	}

	// 登录设备
	loginInfo, deviceInfo, err := client.Login("192.168.1.5", 8000, "admin", "zswlzswl2025")
	if err != nil {
		fmt.Printf("登录设备失败: %v\n", err)
		return
	}

	// 打印登录信息和设备信息
	fmt.Printf("登录信息: IP=%s, 端口=%d, 用户名=%s\n",
		loginInfo.DeviceIP, loginInfo.DevicePort, loginInfo.Username)
	fmt.Printf("设备信息: 序列号=%s, 设备类型=%d, 通道数=%d\n",
		deviceInfo.SerialNumber, deviceInfo.DeviceType, deviceInfo.ChannelNum)

	// 确保在程序结束时注销设备并清理资源
	defer func() {
		client.Logout()
		client.Cleanup()
	}()

	fmt.Println("设备登录成功")

	// 示例1: 获取门禁状态
	fmt.Println("\n[示例1] 获取门禁状态")
	err = client.GetACSStatus()
	if err != nil {
		fmt.Printf("获取门禁状态失败: %v\n", err)
	}

	// 示例2: 添加单个用户
	fmt.Println("\n[示例2] 添加单个用户")
	err = client.AddUser("12345")
	if err != nil {
		fmt.Printf("添加用户失败: %v\n", err)
	}

	// 示例3: 批量添加用户
	fmt.Println("\n[示例3] 批量添加用户")
	errors := client.AddUsers([]string{"23456", "34567"})
	if len(errors) > 0 {
		for _, err := range errors {
			fmt.Printf("批量添加用户错误: %v\n", err)
		}
	}

	// 示例4: 添加卡片
	fmt.Println("\n[示例4] 添加卡片")
	err = client.AddCard("12345", "12345")
	if err != nil {
		fmt.Printf("添加卡片失败: %v\n", err)
	}

	// 示例5: 批量添加卡片
	fmt.Println("\n[示例5] 批量添加卡片")
	errors = client.AddCards(
		[]string{"23456", "34567"},
		[]string{"23456", "34567"},
	)
	if len(errors) > 0 {
		for _, err := range errors {
			fmt.Printf("批量添加卡片错误: %v\n", err)
		}
	}

	// 示例6: 查询用户信息
	fmt.Println("\n[示例6] 查询用户信息")
	err = client.SearchUser()
	if err != nil {
		fmt.Printf("查询用户信息失败: %v\n", err)
	}

	// 示例9: 设置布控
	fmt.Println("\n[示例9] 设置布控")
	// 设置布控，传入回调函数和强制替换参数
	alarmHandle, err := client.SetupAlarm(alarmCallback, true, true)
	if err != nil {
		fmt.Printf("设置布控失败: %v\n", err)
	} else {
		fmt.Printf("设置布控成功，句柄: %d\n", alarmHandle)

		// 获取布控状态
		isSetup, handle := client.GetAlarmStatus()
		fmt.Printf("布控状态: 是否已布控=%v, 句柄=%d\n", isSetup, handle)

		// 等待一段时间，以便接收报警事件
		fmt.Println("等待10秒钟接收报警事件...")
		time.Sleep(10000 * time.Second)

		// 关闭布控
		fmt.Println("关闭布控...")
		err = client.CloseAlarm()
		if err != nil {
			fmt.Printf("关闭布控失败: %v\n", err)
		} else {
			fmt.Println("关闭布控成功")
		}
	}

	// 等待一段时间，确保操作完成
	time.Sleep(time.Second)

	// 示例7: 删除单个用户
	fmt.Println("\n[示例7] 删除单个用户")
	err = client.DeleteUser("12345")
	if err != nil {
		fmt.Printf("删除用户失败: %v\n", err)
	}

	// 示例8: 批量删除用户
	fmt.Println("\n[示例8] 批量删除用户")
	errors = client.DeleteUsers([]string{"23456", "34567"})
	if len(errors) > 0 {
		for _, err := range errors {
			fmt.Printf("批量删除用户错误: %v\n", err)
		}
	}

	fmt.Println("\n所有示例执行完成")
}
