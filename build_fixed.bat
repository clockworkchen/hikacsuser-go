��@ e c h o   o f f  
  
 R E M   O(ue c h o }T�N���Q-N�e 
 e c h o   [ �Oo`]   ыwm�^ZƉ蕁y�|�~S D K \ňz�^ 
  
 R E M   ��nG o �s�X�Sϑ 
 s e t   G O O S = w i n d o w s  
 s e t   C G O _ E N A B L E D = 1  
  
 R E M   ��nC G O ���chVh�_ 
 s e t   C G O _ L D F L A G S = - L D : / w o r k s p a c e / h i k a c s u s e r - g o / l i b / w i n 6 4   - l H C N e t S D K   - l H C C o r e   - l P l a y C t r l  
 s e t   C G O _ C F L A G S = - I D : / w o r k s p a c e / h i k a c s u s e r - g o / l i b / w i n 6 4  
  
 R E M   �Y�gNX[(Wb i n �vU_�R�^�[ 
 i f   n o t   e x i s t   b i n   m k d i r   b i n  
  
 R E M   ыS D K �^ 
 c d   i n t e r n a l \ s d k  
 g o   b u i l d   - o   . . \ . . \ b i n \ s d k . a   - b u i l d m o d e = a r c h i v e  
 i f   % E R R O R L E V E L %   N E Q   0   (  
         e c h o   [ ��]   S D K ы1Y%� 
         e x i t   / b   % E R R O R L E V E L %  
 )  
 c d   . . \ . . \ b i n  
  
 R E M   Y6R�R`�^�TD��n�e�N 
 x c o p y   / Y   . . \ l i b \ w i n 6 4 \ * . d l l   . \  
 x c o p y   / Y   . . \ l i b \ w i n 6 4 \ H C N e t S D K C o m \ * . d l l   . \ H C N e t S D K C o m \  
  
 R E M   Y6Rv^�f�eM�n�e�N��y(u�z�S f\ 
 e c h o   ^ < ? x m l   v e r s i o n = " 1 . 0 "   e n c o d i n g = " G B 2 3 1 2 " ? ^ >   >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o   ^ < S d k L o c a l ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o           ^ < S d k L o g ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o                   ^ < l o g L e v e l ^ > 3 ^ < / l o g L e v e l ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o                   ^ < l o g D i r e c t o r y ^ > . / s d k l o g / ^ < / l o g D i r e c t o r y ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o                   ^ < a u t o D e l e t e ^ > t r u e ^ < / a u t o D e l e t e ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o           ^ < / S d k L o g ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o           ^ < ! - -   �y(u�z�S f\  - - ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o           ^ < N e t ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o                   ^ < T r a n s U s e ^ > f a l s e ^ < / T r a n s U s e ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o           ^ < / N e t ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
 e c h o   ^ < / S d k L o c a l ^ >   > >   H C N e t S D K _ L o g _ S w i t c h . x m l  
  
 R E M   ы;Nz�^ 
 c d   . . \ c m d \ a c s d e m o  
 g o   b u i l d   - o   . . \ . . \ b i n \ a c s d e m o . e x e  
 i f   % E R R O R L E V E L %   N E Q   0   (  
         e c h o   [ ��]   ;Nz�^ы1Y%� 
         e x i t   / b   % E R R O R L E V E L %  
 )  
 c d   . . \ . . \ b i n  
  
 R E M   R�^D��n�vU_ 
 i f   n o t   e x i s t   r e s o u r c e s   m k d i r   r e s o u r c e s  
 i f   n o t   e x i s t   r e s o u r c e s \ p i c   m k d i r   r e s o u r c e s \ p i c  
 x c o p y   / Y   . . \ r e s o u r c e s \ p i c \ * . j p g   r e s o u r c e s \ p i c \  
  
 e c h o   [ �Oo`]   ы�[b�z�^�]�OX[0Rb i n �vU_ 
  
 R E M   ��/f&TЏL�z�^ 
 s e t   / p   r u n = [ �c:y]   /f&TЏL�z�^( y / n ) ?  
 i f   / i   " % r u n % " = = " y "   (  
         a c s d e m o . e x e  
 ) 