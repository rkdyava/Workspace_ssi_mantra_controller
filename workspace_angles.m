%%
clear all;
close all;
figure
hold on
% for Th_1=(0:0.5:2*pi)
%for Th_2=(0:0.5:pi)
       
Th_1=[180]*pi/180;
Th_2=[80]*pi/180;
Th_3=[0]*pi/180;
Th_4=[180]*pi/180;
Th_5=[80]*pi/180;
Th_6=[0]*pi/180;
Th_7=[40]*pi/180;

%%
% Th_1=[0:0.1:180]*pi/180;
% Th_2=[0:0.1:180]*pi/180;
% Th_3=[0:0.1:180]*pi/180;
% Th_4=[0:0.1:180]*pi/180;
% Th_5=[0:0.1:180]*pi/180;
% Th_6=[0:0.1:180]*pi/180;
% Th_7=[0:0.1:180]*pi/180;
%%
L_1=5;
L_2=2;
L_3=10;
L_4=10;
L_5=10;
L_6=10;
L_7=10;
L(1)=Link([0 L_1 0 pi/2]);
L(2)=Link([0 0 L_2 0]);
L(3)=Link([0 L_3 0.1 -pi/2]);
L(4)=Link([0 0 L_4 pi/2]);
L(5)=Link([0 L_5 0.1 pi/2]);
L(6)=Link([0 0 L_6 0]);
L(7)=Link([0 L_7 0 pi/2]);
%%
LL(1)=Link([0 L_1 0 pi/2]);
LL(2)=Link([0 0 L_2 0]);
LL(3)=Link([0 L_3 0.1 pi/2]);
LL(4)=Link([0 L_4 0.1 pi/2]);
LL(5)=Link([0 0 L_5 pi/2]);
LL(6)=Link([0 L_6 0.1 0]);
LL(7)=Link([0 0 0 pi/2]);
%%
T_base= [-1 0 0 -30; ...
         0 1 0 1 ;...
         0 0 -1 1.5; ...
         0 0 0 1];
     T_base2= [-1 0 0 30; ...
         0 1 0 20 ;...
         0 0 -1 1.5; ...
         0 0 0 1];
 
Robot_1=SerialLink(L,'base',T_base)
% Robot_1.base=T;
Robot_2=SerialLink(LL,'base',T_base2)

Robot_1.name='Robot_GUI';
%%
Robot_1.plot([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7]);
Robot_2.plot([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7]);
hold on;

% pause(0.0001)




T1=Robot_1.fkine([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7])
T2=Robot_2.fkine([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7])
P=T1(:);
hold on;
P_x=(floor(T1(1,4)))
P_y=(floor(T1(2,4)))
P_z=(floor(T1(3,4)))
plot3(P_x,P_y,P_z,'bo','linewidth',1)

P_x2=(floor(T2(1,4)))
P_y2=(floor(T2(2,4)))
P_z2=(floor(T2(3,4)))
plot3(P_x2,P_y2,P_z2,'ro','linewidth',1)

  rpy2 = tr2rpy(T2)  
         
% end
% end
 %% 
%  
%  for Th_1=(0:0.5:2*pi)
% %     for Th_2=(0:0.5:pi)
%        
% %     Th_1=[180]*pi/180;
% Th_2=[80]*pi/180;
% Th_3=[0]*pi/180;
% Th_4=[180]*pi/180;
% Th_5=[80]*pi/180;
% Th_6=[0]*pi/180;
% Th_7=[40]*pi/180;
% 
% %%
% % Th_1=[0:0.1:180]*pi/180;
% % Th_2=[0:0.1:180]*pi/180;
% % Th_3=[0:0.1:180]*pi/180;
% % Th_4=[0:0.1:180]*pi/180;
% % Th_5=[0:0.1:180]*pi/180;
% % Th_6=[0:0.1:180]*pi/180;
% % Th_7=[0:0.1:180]*pi/180;
% %%
% L_1=20;
% L_2=10;
% L_3=10;
% L_4=10;
% L_5=10;
% L_6=10;
% L_7=10;
% L(1)=Link([0 L_1 0 pi/2]);
% L(2)=Link([0 L_2 0 0]);
% L(3)=Link([0 L_3 0.1 pi/2]);
% L(4)=Link([0 L_4 0.1 pi/2]);
% L(5)=Link([0 L_5 0.1 pi/2]);
% L(6)=Link([0 L_6 0.1 0]);
% L(7)=Link([0 L_7 0 pi/2]);
% %%
% LL(1)=Link([0 L_1 0 pi/2]);
% LL(2)=Link([0 0 L_2 0]);
% LL(3)=Link([0 L_3 0.1 pi/2]);
% LL(4)=Link([0 L_4 0.1 pi/2]);
% LL(5)=Link([0 0 0.1 pi/2]);
% LL(6)=Link([0 L_6 0.1 0]);
% LL(7)=Link([0 0 0 pi/2]);
% %%
% 
% Robot_2=SerialLink(L);
% % Robot_2=SerialLink(LL)
% 
% Robot.name='Robot_GUI';
% %%
% Robot_2.plot([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7]);
% % Robot_2.plot([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7]);
% hold on;
% 
% % pause(0.0001)
% 
% 
% 
% 
% T2=Robot_1.fkine([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7])
% % T2=Robot_2.fkine([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7])
% 
% P_x2=(floor(T2(1,4)))
% P_y2=(floor(T2(2,4)))
% P_z2=(floor(T2(3,4)))
% plot3(P_x2,P_y2,P_z2,'ro','linewidth',1)
% hold on;
% 
%   rpy2 = tr2rpy(T2)  
%          
% % end
% end

