FasdUAS 1.101.10   ��   ��    k             j     �� �� 0 dbpath dbPath  n       	  1    ��
�� 
strq 	 m      
 
 �   X / U s e r s / j a c k g o l d r i c k / L i b r a r y / M e s s a g e s / c h a t . d b      l     ��������  ��  ��        i    	    I     �� ��
�� .aevtoappnull  �   � ****  J             o      ���� $0 inputphonenumber inputPhoneNumber   ��  o      ���� (0 messagelimitstring messageLimitString��  ��    k           l     ��������  ��  ��        r         c         o     ���� (0 messagelimitstring messageLimitString  m    ��
�� 
long  o      ���� 0 messagelimit messageLimit     !   l   ��������  ��  ��   !  " # " Z     $ %���� $ l    &���� & G     ' ( ' =   	 ) * ) o    ���� 0 messagelimit messageLimit * m    ��
�� 
msng ( ?     + , + o    ���� 0 messagelimit messageLimit , m    ���� ��  ��   % l    - . / - r     0 1 0 m    ���� 
 1 o      ���� 0 messagelimit messageLimit . + % Number of recent messages to display    / � 2 2 J   N u m b e r   o f   r e c e n t   m e s s a g e s   t o   d i s p l a y��  ��   #  3 4 3 l   ��������  ��  ��   4  5 6 5 l   ��������  ��  ��   6  7 8 7 r    ' 9 : 9 b    % ; < ; b    # = > = b    ! ? @ ? m     A A � B B � S E L E C T   h . i d ,   m . t e x t ,   m . d a t e   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   @ n      C D C 1     ��
�� 
strq D o    ���� $0 inputphonenumber inputPhoneNumber > m   ! " E E � F F ^   A N D   i s _ f r o m _ m e   =   0   O R D E R   B Y   m . d a t e   D E S C   L I M I T   < o   # $���� 0 messagelimit messageLimit : o      ���� 0 sqlqueryrecp sqlQueryRecp 8  G H G l  ( (��������  ��  ��   H  I J I r   ( 3 K L K b   ( 1 M N M b   ( / O P O b   ( - Q R Q m   ( ) S S � T T � S E L E C T   h . i d ,   m . t e x t ,   m . d a t e   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   R n   ) , U V U 1   * ,��
�� 
strq V o   ) *���� $0 inputphonenumber inputPhoneNumber P m   - . W W � X X ^   A N D   i s _ f r o m _ m e   =   1   O R D E R   B Y   m . d a t e   D E S C   L I M I T   N o   / 0���� 0 messagelimit messageLimit L o      ���� 0 sqlquerysend sqlQuerySend J  Y Z Y l  4 4��������  ��  ��   Z  [ \ [ r   4 C ] ^ ] b   4 A _ ` _ b   4 ; a b a b   4 9 c d c m   4 5 e e � f f S E L E C T   C A S E   W H E N   m . i s _ f r o m _ m e   =   1   T H E N   ' M e '   E L S E   h . i d   E N D ,   m . t e x t   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   d n   5 8 g h g 1   6 8��
�� 
strq h o   5 6���� $0 inputphonenumber inputPhoneNumber b m   9 : i i � j j 8   O R D E R   B Y   m . d a t e   D E S C   L I M I T   ` l  ; @ k���� k ]   ; @ l m l m   ; <����  m l  < ? n���� n [   < ? o p o m   < =����  p o   = >���� 0 messagelimit messageLimit��  ��  ��  ��   ^ o      ���� 0 sqlqueryfull sqlQueryFull \  q r q l  D D��������  ��  ��   r  s t s r   D ] u v u I  D Y�� w��
�� .sysoexecTEXT���     TEXT w b   D U x y x b   D Q z { z b   D M | } | m   D G ~ ~ �    s q l i t e 3   } o   G L���� 0 dbpath dbPath { m   M P � � � � �    y n   Q T � � � 1   R T��
�� 
strq � o   Q R���� 0 sqlqueryfull sqlQueryFull��   v o      ���� 0 rawoutputfull rawOutputFull t  � � � l  ^ ^��������  ��  ��   �  � � � l  ^ ^��������  ��  ��   �  � � � r   ^ w � � � I  ^ s�� ���
�� .sysoexecTEXT���     TEXT � b   ^ o � � � b   ^ k � � � b   ^ g � � � m   ^ a � � � � �  s q l i t e 3   � o   a f���� 0 dbpath dbPath � m   g j � � � � �    � n   k n � � � 1   l n��
�� 
strq � o   k l���� 0 sqlqueryrecp sqlQueryRecp��   � o      ���� 0 rawoutputrecp rawOutputRecp �  � � � l  x x��������  ��  ��   �  � � � r   x � � � � I  x ��� ���
�� .sysoexecTEXT���     TEXT � b   x � � � � b   x � � � � b   x � � � � m   x { � � � � �  s q l i t e 3   � o   { ����� 0 dbpath dbPath � m   � � � � � � �    � n   � � � � � 1   � ���
�� 
strq � o   � ����� 0 sqlquerysend sqlQuerySend��   � o      ���� 0 rawoutputsend rawOutputSend �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � "  Extract the message content    � � � � 8   E x t r a c t   t h e   m e s s a g e   c o n t e n t �  � � � r   � � � � � o   � ���
�� 
ret  � n      � � � 1   � ���
�� 
txdl � 1   � ���
�� 
ascr �  � � � r   � � � � � n   � � � � � 2  � ���
�� 
citm � o   � ����� 0 rawoutputrecp rawOutputRecp � o      ���� $0 recpmessageslist recpMessagesList �  � � � r   � � � � � n   � � � � � 2  � ���
�� 
citm � o   � ����� 0 rawoutputsend rawOutputSend � o      ���� $0 sendmessageslist sendMessagesList �  � � � r   � � � � � n   � � � � � 2  � ���
�� 
citm � o   � ����� 0 rawoutputfull rawOutputFull � o      ���� $0 fullmessageslist fullMessagesList �  � � � l  � ���������  ��  ��   �  � � � r   � � � � � m   � � � � � � �   � o      ���� 0 recpexchange recpExchange �  � � � r   � � � � � m   � � � � � � �   � o      ����  0 senderexchange senderExchange �  � � � r   � � � � � m   � � � � � � �   � o      ���� 0 fullexchange fullExchange �  � � � r   � � � � � m   � �����  � o      ���� 0 j   �  � � � Y   � ��� � ��� � k   �	 � �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � o   � ����� 0 i   � o   � ����� $0 recpmessageslist recpMessagesList � o      ���� (0 recpcurrentmessage recpCurrentMessage �  � � � r   � � � � n   � � � � � 4   � ��� �
�� 
cobj � o   � ����� 0 i   � o   � ����� $0 sendmessageslist sendMessagesList � o      ���� (0 sendcurrentmessage sendCurrentMessage �  � � � l ��������  ��  ��   �  � � � r   � � � n   � � � 7 �� � 
�� 
cobj � o  �� 0 j    l �~�} [   o  �|�| 0 j   m  �{�{ �~  �}   � o  �z�z $0 fullmessageslist fullMessagesList � o      �y�y (0 fullcurrentmessage fullCurrentMessage �  l �x�w�v�x  �w  �v    r  )	 m  !

 �  |	 n      1  $(�u
�u 
txdl 1  !$�t
�t 
ascr  r  *5 n  *1 2 -1�s
�s 
citm o  *-�r�r (0 recpcurrentmessage recpCurrentMessage o      �q�q 0 recptextitems recpTextItems  r  6A n  6= 2 9=�p
�p 
citm o  69�o�o (0 sendcurrentmessage sendCurrentMessage o      �n�n 0 sendtextitems sendTextItems  r  BM n  BI 2 EI�m
�m 
citm o  BE�l�l (0 fullcurrentmessage fullCurrentMessage o      �k�k 0 fulltextitems fullTextItems  !  l NN�j�i�h�j  �i  �h  ! "#" Z  N~$%�g&$ ?  NW'(' l NU)�f�e) I NU�d*�c
�d .corecnte****       ***** o  NQ�b�b 0 recptextitems recpTextItems�c  �f  �e  ( m  UV�a�a % k  Zv++ ,-, l Zf./0. r  Zf121 n  Zb343 4  ]b�`5
�` 
cobj5 m  `a�_�_ 4 o  Z]�^�^ 0 recptextitems recpTextItems2 o      �]�] (0 recpmessagecontent recpMessageContent/ F @ The message content should be the 	second item between the bars   0 �66 �   T h e   m e s s a g e   c o n t e n t   s h o u l d   b e   t h e   	 s e c o n d   i t e m   b e t w e e n   t h e   b a r s- 7�\7 r  gv898 b  gr:;: b  gn<=< o  gj�[�[ 0 recpexchange recpExchange= o  jm�Z�Z (0 recpmessagecontent recpMessageContent; o  nq�Y
�Y 
ret 9 o      �X�X 0 recpexchange recpExchange�\  �g  & r  y~>?> m  yz�W
�W 
msng? o      �V�V 0 recpexchange recpExchange# @A@ l �U�T�S�U  �T  �S  A BCB Z  �DE�RFD ?  �GHG l �I�Q�PI I ��OJ�N
�O .corecnte****       ****J o  ��M�M 0 sendtextitems sendTextItems�N  �Q  �P  H m  ���L�L E k  ��KK LML l ��NOPN r  ��QRQ n  ��STS 4  ���KU
�K 
cobjU m  ���J�J T o  ���I�I 0 sendtextitems sendTextItemsR o      �H�H (0 sendmessagecontent sendMessageContentO E ? The message content should be the second item between the bars   P �VV ~   T h e   m e s s a g e   c o n t e n t   s h o u l d   b e   t h e   s e c o n d   i t e m   b e t w e e n   t h e   b a r sM W�GW r  ��XYX b  ��Z[Z b  ��\]\ o  ���F�F  0 senderexchange senderExchange] o  ���E�E (0 sendmessagecontent sendMessageContent[ o  ���D
�D 
ret Y o      �C�C  0 senderexchange senderExchange�G  �R  F r  ��^_^ m  ���B
�B 
msng_ o      �A�A  0 senderexchange senderExchangeC `a` l ���@�?�>�@  �?  �>  a bcb Z  ��de�=fd ?  ��ghg l ��i�<�;i I ���:j�9
�: .corecnte****       ****j o  ���8�8 0 fulltextitems fullTextItems�9  �<  �;  h m  ���7�7 e k  ��kk lml r  ��non n  ��pqp 4  ���6r
�6 
cobjr m  ���5�5 q o  ���4�4 0 fulltextitems fullTextItemso o      �3�3 .0 fullmessagecontentone fullMessageContentOnem sts l ��uvwu r  ��xyx n  ��z{z 4  ���2|
�2 
cobj| m  ���1�1 { o  ���0�0 0 fulltextitems fullTextItemsy o      �/�/ .0 fullmessagecontenttwo fullMessageContentTwov E ? The message content should be the second item between the bars   w �}} ~   T h e   m e s s a g e   c o n t e n t   s h o u l d   b e   t h e   s e c o n d   i t e m   b e t w e e n   t h e   b a r st ~~ r  ����� b  ����� b  ����� o  ���.�. 0 fullexchange fullExchange� o  ���-�- .0 fullmessagecontentone fullMessageContentOne� o  ���,
�, 
ret � o      �+�+ 0 fullexchange fullExchange ��*� r  ����� b  ����� b  ����� o  ���)�) 0 fullexchange fullExchange� o  ���(�( .0 fullmessagecontenttwo fullMessageContentTwo� o  ���'
�' 
ret � o      �&�& 0 fullexchange fullExchange�*  �=  f r  ����� m  ���%
�% 
msng� o      �$�$ 0 fullexchange fullExchangec ��� l ���#�"�!�#  �"  �!  � �� � r  �	��� \  ���� ]  ���� l ����� [  ���� o  ���� 0 i  � m  � �� �  �  � m  �� � m  �� � o      �� 0 j  �   �� 0 i   � m   � ���  � o   � ��� 0 messagelimit messageLimit��   � ��� L  �� o  �� 0 fullexchange fullExchange�    ��� l     ����  �  �  � ��� l     ����  � "  Display the entire exchange   � ��� 8   D i s p l a y   t h e   e n t i r e   e x c h a n g e� ��� l     ����  � "  display dialog recpExchange   � ��� 8   d i s p l a y   d i a l o g   r e c p E x c h a n g e� ��� l     ����  � $  display dialog senderExchange   � ��� <   d i s p l a y   d i a l o g   s e n d e r E x c h a n g e� ��� l     ����  � "  display dialog fullExchange   � ��� 8   d i s p l a y   d i a l o g   f u l l E x c h a n g e� ��� l     ����  �  �  � ��
� l     �	���	  �  �  �
       "�������������������������������� �����  �  ������������������������������������������������������������������ 0 dbpath dbPath
�� .aevtoappnull  �   � ****�� 0 messagelimit messageLimit�� 0 sqlqueryrecp sqlQueryRecp�� 0 sqlquerysend sqlQuerySend�� 0 sqlqueryfull sqlQueryFull�� 0 rawoutputfull rawOutputFull�� 0 rawoutputrecp rawOutputRecp�� 0 rawoutputsend rawOutputSend�� $0 recpmessageslist recpMessagesList�� $0 sendmessageslist sendMessagesList�� $0 fullmessageslist fullMessagesList�� 0 recpexchange recpExchange��  0 senderexchange senderExchange�� 0 fullexchange fullExchange�� 0 j  �� (0 recpcurrentmessage recpCurrentMessage�� (0 sendcurrentmessage sendCurrentMessage�� (0 fullcurrentmessage fullCurrentMessage�� 0 recptextitems recpTextItems�� 0 sendtextitems sendTextItems�� 0 fulltextitems fullTextItems�� (0 recpmessagecontent recpMessageContent�� (0 sendmessagecontent sendMessageContent�� .0 fullmessagecontentone fullMessageContentOne�� .0 fullmessagecontenttwo fullMessageContentTwo��  ��  ��  ��  ��  ��  � ��� \ ' / U s e r s / j a c k g o l d r i c k / L i b r a r y / M e s s a g e s / c h a t . d b '� �� ��������
�� .aevtoappnull  �   � ****�� ����� �  ������ $0 inputphonenumber inputPhoneNumber�� (0 messagelimitstring messageLimitString��  � �������� $0 inputphonenumber inputPhoneNumber�� (0 messagelimitstring messageLimitString�� 0 i  � 5������������ A�� E�� S W�� e i�� ~ ����� � ��� � ����������������� ��� ��� �������������
����������������
�� 
long�� 0 messagelimit messageLimit
�� 
msng�� 
�� 
bool�� 

�� 
strq�� 0 sqlqueryrecp sqlQueryRecp�� 0 sqlquerysend sqlQuerySend�� 0 sqlqueryfull sqlQueryFull
�� .sysoexecTEXT���     TEXT�� 0 rawoutputfull rawOutputFull�� 0 rawoutputrecp rawOutputRecp�� 0 rawoutputsend rawOutputSend
�� 
ret 
�� 
ascr
�� 
txdl
�� 
citm�� $0 recpmessageslist recpMessagesList�� $0 sendmessageslist sendMessagesList�� $0 fullmessageslist fullMessagesList�� 0 recpexchange recpExchange��  0 senderexchange senderExchange�� 0 fullexchange fullExchange�� 0 j  
�� 
cobj�� (0 recpcurrentmessage recpCurrentMessage�� (0 sendcurrentmessage sendCurrentMessage�� (0 fullcurrentmessage fullCurrentMessage�� 0 recptextitems recpTextItems�� 0 sendtextitems sendTextItems�� 0 fulltextitems fullTextItems
�� .corecnte****       ****�� (0 recpmessagecontent recpMessageContent�� (0 sendmessagecontent sendMessageContent�� .0 fullmessagecontentone fullMessageContentOne�� .0 fullmessagecontenttwo fullMessageContentTwo����&E�O�� 
 ���& �E�Y hO��,%�%�%E�O��,%�%�%E�O���,%�%lk� %E�Oa b   %a %��,%j E` Oa b   %a %��,%j E` Oa b   %a %��,%j E` O_ _ a ,FO_ a -E` O_ a -E` O_ a -E`  Oa !E` "Oa #E` $Oa %E` &OkE` 'O-k�kh _ a (�/E` )O_ a (�/E` *O_  [a (\[Z_ '\Z_ 'k2E` +Oa ,_ a ,FO_ )a -E` -O_ *a -E` .O_ +a -E` /O_ -j 0k !_ -a (l/E` 1O_ "_ 1%_ %E` "Y �E` "O_ .j 0k !_ .a (l/E` 2O_ $_ 2%_ %E` $Y �E` $O_ /j 0k >_ /a (k/E` 3O_ /a (l/E` 4O_ &_ 3%_ %E` &O_ &_ 4%_ %E` &Y �E` &O�kl kE` '[OY��O_ &� 
� ���D S E L E C T   h . i d ,   m . t e x t ,   m . d a t e   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   ' + 1 7 2 0 2 0 2 9 6 0 4 '   A N D   i s _ f r o m _ m e   =   0   O R D E R   B Y   m . d a t e   D E S C   L I M I T   1 0� ���D S E L E C T   h . i d ,   m . t e x t ,   m . d a t e   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   ' + 1 7 2 0 2 0 2 9 6 0 4 '   A N D   i s _ f r o m _ m e   =   1   O R D E R   B Y   m . d a t e   D E S C   L I M I T   1 0� ���j S E L E C T   C A S E   W H E N   m . i s _ f r o m _ m e   =   1   T H E N   ' M e '   E L S E   h . i d   E N D ,   m . t e x t   F R O M   m e s s a g e   m   I N N E R   J O I N   h a n d l e   h   O N   h . R O W I D = m . h a n d l e _ i d   W H E R E   h . i d   =   ' + 1 7 2 0 2 0 2 9 6 0 4 '   O R D E R   B Y   m . d a t e   D E S C   L I M I T   2 2� ��� M e | I   g o t   i t  �>�y  M e |��  M e | I   a m   h a v i n g   w a y   t o o   m u c h   f u n   w i t h   t h i s   t o o l   i   m a d e .     S e n t   w i t h   r u s t   ; )  + 1 7 2 0 2 0 2 9 6 0 4 | L o v e d    C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )   M e | C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )  + 1 7 2 0 2 0 2 9 6 0 4 | L i k e   n o t   a t   a l l   r e a l l y  + 1 7 2 0 2 0 2 9 6 0 4 | I  m   b a r l e y   m o v i n g  + 1 7 2 0 2 0 2 9 6 0 4 | Y a y  M e | I t s   w o r k i n g  M e | O k g    M e | H e l l o   f r o m   R u s t !  + 1 7 2 0 2 0 2 9 6 0 4 | I  m   h u n g r y    M e | A r e   y o u   i n   t h e r a p y  + 1 7 2 0 2 0 2 9 6 0 4 | O k   t h a n k s    M e | I f   u   w a n t   t o   c o m e   c u d d l e   w i t h   c a t s   a n d   e a t   c a n d y   t o n i g h t   u   c a n  + 1 7 2 0 2 0 2 9 6 0 4 | O k a y  M e | L e t  s   g o   t o   O l i v e   G a r d e n   t o m o r r o w  M e | O k    + 1 7 2 0 2 0 2 9 6 0 4 | M a y b e  M e | D o   y o u   w a n t   t o   w a t c h   a d v e n t u r e   t i m e   l a t e r ?  M e | B a b y   g i r l   i s   s t i l l   e a t i n g    + 1 7 2 0 2 0 2 9 6 0 4 | I   a m   h e r e� ���� + 1 7 2 0 2 0 2 9 6 0 4 | L o v e d    C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )  | 7 4 2 3 3 1 6 7 3 0 7 3 4 7 2 0 0 0  + 1 7 2 0 2 0 2 9 6 0 4 | L i k e   n o t   a t   a l l   r e a l l y | 7 4 2 3 2 0 0 8 5 8 2 5 4 6 2 5 2 8  + 1 7 2 0 2 0 2 9 6 0 4 | I  m   b a r l e y   m o v i n g | 7 4 2 3 2 0 0 7 8 4 2 8 4 7 6 8 0 0  + 1 7 2 0 2 0 2 9 6 0 4 | Y a y | 7 4 2 3 1 2 0 7 2 1 2 8 6 9 8 6 2 4  + 1 7 2 0 2 0 2 9 6 0 4 | I  m   h u n g r y   | 7 4 2 2 7 1 3 1 5 6 2 6 0 0 1 4 0 8  + 1 7 2 0 2 0 2 9 6 0 4 | O k   t h a n k s   | 7 4 2 1 8 1 4 1 3 9 5 8 4 3 5 9 6 8  + 1 7 2 0 2 0 2 9 6 0 4 | O k a y | 7 4 2 1 8 1 2 3 8 3 4 4 0 6 5 4 0 8  + 1 7 2 0 2 0 2 9 6 0 4 | M a y b e | 7 4 2 1 6 3 4 3 4 8 4 3 9 7 6 9 6 0  + 1 7 2 0 2 0 2 9 6 0 4 | I   a m   h e r e | 7 4 2 1 5 4 5 5 5 2 3 8 4 3 7 3 7 6  + 1 7 2 0 2 0 2 9 6 0 4 | I   h a v e   t h e   c a r   I   t h i n k | 7 4 2 1 5 2 6 4 2 1 6 7 0 0 0 3 2 0� ���� + 1 7 2 0 2 0 2 9 6 0 4 | I   g o t   i t  �>�y | 7 4 2 3 4 2 4 4 4 7 0 7 7 6 2 4 3 2  + 1 7 2 0 2 0 2 9 6 0 4 |�� | 7 4 2 3 4 2 4 3 8 5 5 1 7 8 8 2 8 8  + 1 7 2 0 2 0 2 9 6 0 4 | I   a m   h a v i n g   w a y   t o o   m u c h   f u n   w i t h   t h i s   t o o l   i   m a d e .     S e n t   w i t h   r u s t   ; ) | 7 4 2 3 3 1 6 8 8 3 8 5 9 9 9 8 7 2  + 1 7 2 0 2 0 2 9 6 0 4 | C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; ) | 7 4 2 3 3 1 5 4 4 3 1 6 9 9 9 9 3 6  + 1 7 2 0 2 0 2 9 6 0 4 | I t s   w o r k i n g | 7 4 2 2 8 6 2 3 1 5 3 2 9 9 9 9 3 6  + 1 7 2 0 2 0 2 9 6 0 4 | O k g   | 7 4 2 2 7 1 3 3 1 3 1 5 8 7 9 5 5 2  + 1 7 2 0 2 0 2 9 6 0 4 | H e l l o   f r o m   R u s t ! | 7 4 2 2 7 1 3 2 0 1 7 8 0 0 0 0 0 0  + 1 7 2 0 2 0 2 9 6 0 4 | A r e   y o u   i n   t h e r a p y | 7 4 2 2 4 8 5 6 4 3 6 3 3 5 8 4 6 4  + 1 7 2 0 2 0 2 9 6 0 4 | I f   u   w a n t   t o   c o m e   c u d d l e   w i t h   c a t s   a n d   e a t   c a n d y   t o n i g h t   u   c a n | 7 4 2 1 8 1 2 7 2 4 2 8 5 7 6 7 6 8  + 1 7 2 0 2 0 2 9 6 0 4 | L e t  s   g o   t o   O l i v e   G a r d e n   t o m o r r o w | 7 4 2 1 8 0 2 6 6 4 5 6 1 8 8 6 7 2� ����� 
�  ����������������������� ��� � + 1 7 2 0 2 0 2 9 6 0 4 | L o v e d    C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )  | 7 4 2 3 3 1 6 7 3 0 7 3 4 7 2 0 0 0� ��� l + 1 7 2 0 2 0 2 9 6 0 4 | L i k e   n o t   a t   a l l   r e a l l y | 7 4 2 3 2 0 0 8 5 8 2 5 4 6 2 5 2 8� ��� b + 1 7 2 0 2 0 2 9 6 0 4 | I  m   b a r l e y   m o v i n g | 7 4 2 3 2 0 0 7 8 4 2 8 4 7 6 8 0 0� ��� F + 1 7 2 0 2 0 2 9 6 0 4 | Y a y | 7 4 2 3 1 2 0 7 2 1 2 8 6 9 8 6 2 4� ��� V + 1 7 2 0 2 0 2 9 6 0 4 | I  m   h u n g r y   | 7 4 2 2 7 1 3 1 5 6 2 6 0 0 1 4 0 8� ��� T + 1 7 2 0 2 0 2 9 6 0 4 | O k   t h a n k s   | 7 4 2 1 8 1 4 1 3 9 5 8 4 3 5 9 6 8� ��� H + 1 7 2 0 2 0 2 9 6 0 4 | O k a y | 7 4 2 1 8 1 2 3 8 3 4 4 0 6 5 4 0 8� ��� J + 1 7 2 0 2 0 2 9 6 0 4 | M a y b e | 7 4 2 1 6 3 4 3 4 8 4 3 9 7 6 9 6 0� ��� R + 1 7 2 0 2 0 2 9 6 0 4 | I   a m   h e r e | 7 4 2 1 5 4 5 5 5 2 3 8 4 3 7 3 7 6� ��� l + 1 7 2 0 2 0 2 9 6 0 4 | I   h a v e   t h e   c a r   I   t h i n k | 7 4 2 1 5 2 6 4 2 1 6 7 0 0 0 3 2 0��  ��  ��  ��  ��  ��  � ����� 
�  ����������������������� ��� V + 1 7 2 0 2 0 2 9 6 0 4 | I   g o t   i t  �>�y | 7 4 2 3 4 2 4 4 4 7 0 7 7 6 2 4 3 2� ��� B + 1 7 2 0 2 0 2 9 6 0 4 |�� | 7 4 2 3 4 2 4 3 8 5 5 1 7 8 8 2 8 8� ��� � + 1 7 2 0 2 0 2 9 6 0 4 | I   a m   h a v i n g   w a y   t o o   m u c h   f u n   w i t h   t h i s   t o o l   i   m a d e .     S e n t   w i t h   r u s t   ; ) | 7 4 2 3 3 1 6 8 8 3 8 5 9 9 9 8 7 2� ��� � + 1 7 2 0 2 0 2 9 6 0 4 | C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; ) | 7 4 2 3 3 1 5 4 4 3 1 6 9 9 9 9 3 6� ��� V + 1 7 2 0 2 0 2 9 6 0 4 | I t s   w o r k i n g | 7 4 2 2 8 6 2 3 1 5 3 2 9 9 9 9 3 6� ��� H + 1 7 2 0 2 0 2 9 6 0 4 | O k g   | 7 4 2 2 7 1 3 3 1 3 1 5 8 7 9 5 5 2� ��� ` + 1 7 2 0 2 0 2 9 6 0 4 | H e l l o   f r o m   R u s t ! | 7 4 2 2 7 1 3 2 0 1 7 8 0 0 0 0 0 0� ��� d + 1 7 2 0 2 0 2 9 6 0 4 | A r e   y o u   i n   t h e r a p y | 7 4 2 2 4 8 5 6 4 3 6 3 3 5 8 4 6 4� ��� � + 1 7 2 0 2 0 2 9 6 0 4 | I f   u   w a n t   t o   c o m e   c u d d l e   w i t h   c a t s   a n d   e a t   c a n d y   t o n i g h t   u   c a n | 7 4 2 1 8 1 2 7 2 4 2 8 5 7 6 7 6 8� �   � + 1 7 2 0 2 0 2 9 6 0 4 | L e t  s   g o   t o   O l i v e   G a r d e n   t o m o r r o w | 7 4 2 1 8 0 2 6 6 4 5 6 1 8 8 6 7 2��  ��  ��  ��  ��  ��  � ����    	
���������������������� �  M e | I   g o t   i t  �>�y �  M e |�� � � M e | I   a m   h a v i n g   w a y   t o o   m u c h   f u n   w i t h   t h i s   t o o l   i   m a d e .     S e n t   w i t h   r u s t   ; ) � � + 1 7 2 0 2 0 2 9 6 0 4 | L o v e d    C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )  � ` M e | C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; ) � F + 1 7 2 0 2 0 2 9 6 0 4 | L i k e   n o t   a t   a l l   r e a l l y � < + 1 7 2 0 2 0 2 9 6 0 4 | I  m   b a r l e y   m o v i n g	 �   + 1 7 2 0 2 0 2 9 6 0 4 | Y a y
 �  M e | I t s   w o r k i n g �  M e | O k g   �   & M e | H e l l o   f r o m   R u s t ! �!! 0 + 1 7 2 0 2 0 2 9 6 0 4 | I  m   h u n g r y   �"" * M e | A r e   y o u   i n   t h e r a p y �## . + 1 7 2 0 2 0 2 9 6 0 4 | O k   t h a n k s   �$$ � M e | I f   u   w a n t   t o   c o m e   c u d d l e   w i t h   c a t s   a n d   e a t   c a n d y   t o n i g h t   u   c a n �%% " + 1 7 2 0 2 0 2 9 6 0 4 | O k a y �&& H M e | L e t  s   g o   t o   O l i v e   G a r d e n   t o m o r r o w �''  M e | O k  � �(( $ + 1 7 2 0 2 0 2 9 6 0 4 | M a y b e� �)) Z M e | D o   y o u   w a n t   t o   w a t c h   a d v e n t u r e   t i m e   l a t e r ? �** : M e | B a b y   g i r l   i s   s t i l l   e a t i n g   �++ , + 1 7 2 0 2 0 2 9 6 0 4 | I   a m   h e r e��  ��  ��  ��  ��  ��  ��  ��  ��  ��  � �,,L L o v e d    C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )   L i k e   n o t   a t   a l l   r e a l l y  I  m   b a r l e y   m o v i n g  Y a y  I  m   h u n g r y    O k   t h a n k s    O k a y  M a y b e  I   a m   h e r e  I   h a v e   t h e   c a r   I   t h i n k � �--2 I   g o t   i t  �>�y ��  I   a m   h a v i n g   w a y   t o o   m u c h   f u n   w i t h   t h i s   t o o l   i   m a d e .     S e n t   w i t h   r u s t   ; )  C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )  I t s   w o r k i n g  O k g    H e l l o   f r o m   R u s t !  A r e   y o u   i n   t h e r a p y  I f   u   w a n t   t o   c o m e   c u d d l e   w i t h   c a t s   a n d   e a t   c a n d y   t o n i g h t   u   c a n  L e t  s   g o   t o   O l i v e   G a r d e n   t o m o r r o w � �..� M e | I   g o t   i t  �>�y  M e |��  M e | I   a m   h a v i n g   w a y   t o o   m u c h   f u n   w i t h   t h i s   t o o l   i   m a d e .     S e n t   w i t h   r u s t   ; )  + 1 7 2 0 2 0 2 9 6 0 4 | L o v e d    C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )   M e | C a n   I   c a l l   u   a f t e r   a l l e r g y ?   S e n t   w i t h   r u s t   ; )  + 1 7 2 0 2 0 2 9 6 0 4 | L i k e   n o t   a t   a l l   r e a l l y  + 1 7 2 0 2 0 2 9 6 0 4 | I  m   b a r l e y   m o v i n g  + 1 7 2 0 2 0 2 9 6 0 4 | Y a y  M e | I t s   w o r k i n g  M e | O k g    M e | H e l l o   f r o m   R u s t !  + 1 7 2 0 2 0 2 9 6 0 4 | I  m   h u n g r y    M e | A r e   y o u   i n   t h e r a p y  + 1 7 2 0 2 0 2 9 6 0 4 | O k   t h a n k s    M e | I f   u   w a n t   t o   c o m e   c u d d l e   w i t h   c a t s   a n d   e a t   c a n d y   t o n i g h t   u   c a n  + 1 7 2 0 2 0 2 9 6 0 4 | O k a y  M e | L e t  s   g o   t o   O l i v e   G a r d e n   t o m o r r o w  M e | O k    + 1 7 2 0 2 0 2 9 6 0 4 | M a y b e  M e | D o   y o u   w a n t   t o   w a t c h   a d v e n t u r e   t i m e   l a t e r ? � � ��/�� /  ��� ��0�� 0  1�2��������������������������1 �33  + 1 7 2 0 2 0 2 9 6 0 4� �44 , I   h a v e   t h e   c a r   I   t h i n k2 �55 $ 7 4 2 1 5 2 6 4 2 1 6 7 0 0 0 3 2 0��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  � ��6�� 6  7�8��������������~�}�|�{�z�y7 �99  + 1 7 2 0 2 0 2 9 6 0 4� �:: B L e t  s   g o   t o   O l i v e   G a r d e n   t o m o r r o w8 �;; $ 7 4 2 1 8 0 2 6 6 4 5 6 1 8 8 6 7 2��  ��  ��  ��  ��  ��  �  �~  �}  �|  �{  �z  �y  � �x<�x <  ���  �  �  �   ��  ��   ascr  ��ޭ