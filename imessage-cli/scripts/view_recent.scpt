FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     ��������  ��  ��     	 
 	 l     ��  ��    : 4 Replace dbID with your address book's serial number     �   h   R e p l a c e   d b I D   w i t h   y o u r   a d d r e s s   b o o k ' s   s e r i a l   n u m b e r 
     l     ��  ��    B < (look in ~/Library/Application Support/AddressBook/Sources)     �   x   ( l o o k   i n   ~ / L i b r a r y / A p p l i c a t i o n   S u p p o r t / A d d r e s s B o o k / S o u r c e s )      j     �� �� 0 dbid dbID  m        �   H B 5 F E 8 2 C 6 - F D D 7 - 4 A 9 7 - A 9 E 5 - 3 6 7 D 6 D 9 A E 7 D A      j    �� �� 0 db    K       ��  �� 0 messages Messages  m       �   X / U s e r s / j a c k g o l d r i c k / L i b r a r y / M e s s a g e s / c h a t . d b  ��  ���� 0 	addresses 	Addresses   b     ! " ! b    	 # $ # m     % % � & & � / U s e r s / j a c k g o l d r i c k / L i b r a r y / A p p l i c a t i o n   S u p p o r t / A d d r e s s B o o k / S o u r c e s / $ o    ���� 0 dbid dbID " m   	 
 ' ' � ( ( . / A d d r e s s B o o k - v 2 2 . a b c d d b��     ) * ) l     ��������  ��  ��   *  + , + i     - . - I     �� /��
�� .aevtoappnull  �   � **** / J       0 0  1�� 1 o      ���� $0 inputphonenumber inputPhoneNumber��  ��   . k     ; 2 2  3 4 3 l     ��������  ��  ��   4  5 6 5 r      7 8 7 n      9 : 9 1    ��
�� 
strq : m      ; ; � < < X / U s e r s / j a c k g o l d r i c k / L i b r a r y / M e s s a g e s / c h a t . d b 8 o      ���� 0 dbpath dbPath 6  = > = l   ��������  ��  ��   >  ? @ ? r     A B A b     C D C b     E F E m     G G � H H � S E L E C T   h . i d ,   m . t e x t ,   m . d a t e   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   F n    
 I J I 1    
��
�� 
strq J o    ���� $0 inputphonenumber inputPhoneNumber D m     K K � L L `   A N D   i s _ f r o m _ m e   =   0   O R D E R   B Y   m . d a t e   D E S C   L I M I T   1 B o      ���� 0 sqlquery sqlQuery @  M N M l   ��������  ��  ��   N  O P O r     Q R Q I   �� S��
�� .sysoexecTEXT���     TEXT S b     T U T b     V W V b     X Y X m     Z Z � [ [  s q l i t e 3   Y o    ���� 0 dbpath dbPath W m     \ \ � ] ]    U n     ^ _ ^ 1    ��
�� 
strq _ o    ���� 0 sqlquery sqlQuery��   R o      ���� 0 	rawoutput 	rawOutput P  ` a ` l     ��������  ��  ��   a  b c b l     �� d e��   d "  Extract the message content    e � f f 8   E x t r a c t   t h e   m e s s a g e   c o n t e n t c  g h g r     % i j i m     ! k k � l l  | j n      m n m 1   " $��
�� 
txdl n 1   ! "��
�� 
ascr h  o p o r   & + q r q n   & ) s t s 2  ' )��
�� 
citm t o   & '���� 0 	rawoutput 	rawOutput r o      ���� 0 	textitems 	textItems p  u v u l  , 4 w x y w r   , 4 z { z n   , 0 | } | 4   - 0�� ~
�� 
cobj ~ m   . /����  } o   , -���� 0 	textitems 	textItems { o      ����  0 messagecontent messageContent x E ? The message content should be the second item between the bars    y �   ~   T h e   m e s s a g e   c o n t e n t   s h o u l d   b e   t h e   s e c o n d   i t e m   b e t w e e n   t h e   b a r s v  � � � l  5 5��������  ��  ��   �  � � � l  5 5�� � ���   � "  Display the message content    � � � � 8   D i s p l a y   t h e   m e s s a g e   c o n t e n t �  � � � l  5 5�� � ���   � $  display dialog messageContent    � � � � <   d i s p l a y   d i a l o g   m e s s a g e C o n t e n t �  � � � l  5 5��������  ��  ��   �  � � � L   5 9 � � o   5 8����  0 messagecontent messageContent �  ��� � l  : :��������  ��  ��  ��   ,  ��� � l     ��������  ��  ��  ��       �� �  � � � � � � �����������   � �������������������������� 0 dbid dbID�� 0 db  
�� .aevtoappnull  �   � ****�� 0 dbpath dbPath�� 0 sqlquery sqlQuery�� 0 	rawoutput 	rawOutput�� 0 	textitems 	textItems��  0 messagecontent messageContent��  ��  ��  ��   � ��  ��� 0 messages Messages � �� ����� 0 	addresses 	Addresses � � � � � / U s e r s / j a c k g o l d r i c k / L i b r a r y / A p p l i c a t i o n   S u p p o r t / A d d r e s s B o o k / S o u r c e s / B 5 F E 8 2 C 6 - F D D 7 - 4 A 9 7 - A 9 E 5 - 3 6 7 D 6 D 9 A E 7 D A / A d d r e s s B o o k - v 2 2 . a b c d d b��   � �� .���� � ���
�� .aevtoappnull  �   � ****�� �� ���  �  ���� $0 inputphonenumber inputPhoneNumber��   � ���� $0 inputphonenumber inputPhoneNumber �  ;���� G K�� Z \���� k������������
�� 
strq�� 0 dbpath dbPath�� 0 sqlquery sqlQuery
�� .sysoexecTEXT���     TEXT�� 0 	rawoutput 	rawOutput
�� 
ascr
�� 
txdl
�� 
citm�� 0 	textitems 	textItems
�� 
cobj��  0 messagecontent messageContent�� <��,E�O��,%�%E�O��%�%��,%j E�O���,FO��-E�O��l/E` O_ OP � � � � \ ' / U s e r s / j a c k g o l d r i c k / L i b r a r y / M e s s a g e s / c h a t . d b ' � � � �B S E L E C T   h . i d ,   m . t e x t ,   m . d a t e   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   ' + 1 7 1 3 4 9 4 4 1 5 8 '   A N D   i s _ f r o m _ m e   =   0   O R D E R   B Y   m . d a t e   D E S C   L I M I T   1 � � � � � + 1 7 1 3 4 9 4 4 1 5 8 | I   w i s h   I   c o u l d   b u t   I   h a v e   l o t s   o f   p a c k i n g   t o   d o   : ( | 7 4 2 3 5 6 9 9 2 2 1 6 2 8 8 5 1 2 � �� ���  �   � � ��������������������������� � � � �  + 1 7 1 3 4 9 4 4 1 5 8 � � � � d I   w i s h   I   c o u l d   b u t   I   h a v e   l o t s   o f   p a c k i n g   t o   d o   : ( � � � � $ 7 4 2 3 5 6 9 9 2 2 1 6 2 8 8 5 1 2��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ascr  ��ޭ