function [pos_arrivo ] = prendi_posizione_limite( input_args )

IP='192.168.1.2';
PORT=9559;
MOTION=ALMotionProxy(IP, PORT);
name1='LElbowRoll';
name2='LElbowYaw';
name3='LShoulderPitch';
name4='LShoulderRoll';
NAMES_ARRAY=[name1, name2, name3, name4];
NAMES={name1, name2, name3, name4};
pos_arrivo=cell2mat(MOTION.getPosition('LArm', int8(0), false));
%MOTION.setPosition('LArm', int8(0),[0.131421282887459;0.240707725286484;0.00689680129289627;0.309584617614746;0.464737355709076;0.589462935924530],0.2,int8(63))


%   Per creare il dataset di posizioni iniziali
% pos_iniziali(:,1)=[-0.0113; 0.1568 ;-0.1087 ; -0.2255  ;  1.3024 ; 1.3246 ] ;  
% pos_iniziali(:,2)=[ -0.0208   ;  0.2008;   -0.0902 ;  0.0330 ;1.095  ;1.5311] ;  
% pos_iniziali(:,3)=[  -0.0632;  0.1582  ;  -0.0999  ;  0.1795;  1.1855; 2.1714  ];  
% pos_iniziali(:,4)=[0.0120  ;  0.1666  ; -0.1043; -0.1321 ;    1.2652 ;  0.8747 ] ;  
% pos_iniziali(:,5)=[-0.0281; 0.2274   ; -0.0705   ; 0.9169   ; 1.0477    ; 1.6101] ;  
% pos_iniziali(:,6)=[ -0.0337; 0.1558; -0.1056 ;0.6484  ;1.3727  ; 1.7167 ] ;  
% pos_iniziali(:,7)=[-0.0549 ;0.1742; -0.0955; 0.5578;1.2090; 1.9670] ;  
% pos_iniziali(:,8)=[-0.0680  ;0.1961  ;-0.0822  ;0.2417  ;1.0268 ; 2.0129 ] ;  
% pos_iniziali(:,9)=[ -0.0035 ; 0.2007 ;-0.0923;-0.5486  ;1.0425  ;1.4419   ] ;  
% pos_iniziali(:,10)=[  -0.0443  ;0.1444 ; -0.1045; 0.6222; 1.4285; 1.8002 ] ;  
% pos_iniziali(:,11)=[  0.0059; 0.1792; -0.0935; -0.5423; 1.1175; 0.8392] ;
% 
% 
% for i=1:size(pos_iniziali,2)
% MOTION.setPosition('LArm', int8(0),pos_iniziali(:,i),0.8,int8(63))
% pause(1)
% stato(i,1:4)=cell2mat(MOTION.getAngles(NAMES, false));
% end
% 
% 
% for i=size(pos_iniziali,2):100
% n=randi(11);
% n1=randi(11);
% pos=pos_iniziali(:,n)+(pos_iniziali(:,n)-pos_iniziali(:,n1))*rand;
% MOTION.setPosition('LArm', int8(0),pos,0.8,int8(63))
% pause(1)
% stato(i,1:4)=cell2mat(MOTION.getAngles(NAMES, false));
% 
% end
% save('ICA.mat','stato')

end

