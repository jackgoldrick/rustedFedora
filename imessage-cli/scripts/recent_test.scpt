FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     ��������  ��  ��     	 
 	 l     ��  ��    : 4 Replace dbID with your address book's serial number     �   h   R e p l a c e   d b I D   w i t h   y o u r   a d d r e s s   b o o k ' s   s e r i a l   n u m b e r 
     l     ��  ��    B < (look in ~/Library/Application Support/AddressBook/Sources)     �   x   ( l o o k   i n   ~ / L i b r a r y / A p p l i c a t i o n   S u p p o r t / A d d r e s s B o o k / S o u r c e s )      j     �� �� 0 dbid dbID  m        �   H B 5 F E 8 2 C 6 - F D D 7 - 4 A 9 7 - A 9 E 5 - 3 6 7 D 6 D 9 A E 7 D A      j    �� �� 0 db    K       ��  �� 0 messages Messages  m       �   X / U s e r s / j a c k g o l d r i c k / L i b r a r y / M e s s a g e s / c h a t . d b  ��  ���� 0 	addresses 	Addresses   b     ! " ! b    	 # $ # m     % % � & & � / U s e r s / j a c k g o l d r i c k / L i b r a r y / A p p l i c a t i o n   S u p p o r t / A d d r e s s B o o k / S o u r c e s / $ o    ���� 0 dbid dbID " m   	 
 ' ' � ( ( . / A d d r e s s B o o k - v 2 2 . a b c d d b��     ) * ) l     ��������  ��  ��   *  + , + l     -���� - r      . / . m      0 0 � 1 1  + 1 4 1 5 4 1 9 7 6 5 9 / o      ���� $0 inputphonenumber inputPhoneNumber��  ��   ,  2 3 2 l   	 4���� 4 r    	 5 6 5 n     7 8 7 1    ��
�� 
strq 8 m     9 9 � : : X / U s e r s / j a c k g o l d r i c k / L i b r a r y / M e s s a g e s / c h a t . d b 6 o      ���� 0 dbpath dbPath��  ��   3  ; < ; l     ��������  ��  ��   <  = > = l  
  ?���� ? r   
  @ A @ b   
  B C B b   
  D E D m   
  F F � G G � S E L E C T   h . i d ,   m . t e x t ,   m . d a t e   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   E n     H I H 1    ��
�� 
strq I o    ���� $0 inputphonenumber inputPhoneNumber C m     J J � K K `   A N D   i s _ f r o m _ m e   =   0   O R D E R   B Y   m . d a t e   D E S C   L I M I T   1 A o      ���� 0 sqlquery sqlQuery��  ��   >  L M L l     ��������  ��  ��   M  N O N l   # P���� P r    # Q R Q I   !�� S��
�� .sysoexecTEXT���     TEXT S b     T U T b     V W V b     X Y X m     Z Z � [ [  s q l i t e 3   Y o    ���� 0 dbpath dbPath W m     \ \ � ] ]    U n     ^ _ ^ 1    ��
�� 
strq _ o    ���� 0 sqlquery sqlQuery��   R o      ���� 0 	rawoutput 	rawOutput��  ��   O  ` a ` l     ��������  ��  ��   a  b c b l     �� d e��   d "  Extract the message content    e � f f 8   E x t r a c t   t h e   m e s s a g e   c o n t e n t c  g h g l  $ ) i���� i r   $ ) j k j m   $ % l l � m m  | k n      n o n 1   & (��
�� 
txdl o 1   % &��
�� 
ascr��  ��   h  p q p l  * 1 r���� r r   * 1 s t s n   * - u v u 2  + -��
�� 
citm v o   * +���� 0 	rawoutput 	rawOutput t o      ���� 0 	textitems 	textItems��  ��   q  w x w l  2 > y z { y r   2 > | } | n   2 : ~  ~ 4   5 :�� �
�� 
cobj � m   8 9����   o   2 5���� 0 	textitems 	textItems } o      ����  0 messagecontent messageContent z E ? The message content should be the second item between the bars    { � � � ~   T h e   m e s s a g e   c o n t e n t   s h o u l d   b e   t h e   s e c o n d   i t e m   b e t w e e n   t h e   b a r s x  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � "  Display the message content    � � � � 8   D i s p l a y   t h e   m e s s a g e   c o n t e n t �  � � � l     �� � ���   � $  display dialog messageContent    � � � � <   d i s p l a y   d i a l o g   m e s s a g e C o n t e n t �  � � � l     ��������  ��  ��   �  � � � l  ? C ����� � L   ? C � � o   ? B����  0 messagecontent messageContent��  ��   �  � � � l     ��������  ��  ��   �  ��� � l     ��������  ��  ��  ��       �� �  � ���   � �������� 0 dbid dbID�� 0 db  
�� .aevtoappnull  �   � **** � ��  ��� 0 messages Messages � �� ����� 0 	addresses 	Addresses � � � � � / U s e r s / j a c k g o l d r i c k / L i b r a r y / A p p l i c a t i o n   S u p p o r t / A d d r e s s B o o k / S o u r c e s / B 5 F E 8 2 C 6 - F D D 7 - 4 A 9 7 - A 9 E 5 - 3 6 7 D 6 D 9 A E 7 D A / A d d r e s s B o o k - v 2 2 . a b c d d b��   � �� ����� � ���
�� .aevtoappnull  �   � **** � k     C � �  + � �  2 � �  = � �  N � �  g � �  p � �  w � �  �����  ��  ��   �   �  0�� 9���� F J�� Z \���� l�������������� $0 inputphonenumber inputPhoneNumber
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
cobj��  0 messagecontent messageContent�� D�E�O��,E�O���,%�%E�O��%�%��,%j 
E�O���,FO��-E` O_ a l/E` O_ ascr  ��ޭ