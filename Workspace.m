%%
close all;
figure
hold on
for Th_1=(0:0.5:pi)
    for Th_2=(0:0.5:pi)
         for Th_3=(0:0.5:pi)
              for Th_4=(0:0.5:pi)
                   for Th_5=(0:0.5:pi)
                        for Th_6=(0:0.5:pi)
%     Th_1=[180]*pi/180;
% Th_2=[80]*pi/180;
% Th_3=[0]*pi/180;
% Th_4=[180]*pi/180;
% Th_5=[80]*pi/180;
% Th_6=[0]*pi/180;
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
L_1=20;
L_2=10;
L_3=10;
L_4=10;
L_5=10;
L_6=10;
L_7=10;
L(1)=Link([0 L_1 0 pi/2]);
L(2)=Link([0 L_2 0 0]);
L(3)=Link([0 L_3 0.1 pi/2]);
L(4)=Link([0 L_4 0.1 pi/2]);
L(5)=Link([0 L_5 0.1 pi/2]);
L(6)=Link([0 L_6 0.1 0]);
L(7)=Link([0 L_7 0 pi/2]);
%%
LL(1)=Link([0 L_1 0 pi/2]);
LL(2)=Link([0 0 L_2 0]);
LL(3)=Link([0 L_3 0.1 pi/2]);
LL(4)=Link([0 L_4 0.1 pi/2]);
LL(5)=Link([0 0 0.1 pi/2]);
LL(6)=Link([0 L_6 0.1 0]);
LL(7)=Link([0 0 0 pi/2]);
%%

Robot_1=SerialLink(L);
% Robot_2=SerialLink(LL)

Robot.name='Robot_GUI';
%%
Robot_1.plot([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7]);
% Robot_2.plot([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7]);
hold on;

% pause(0.0001)




T=Robot_1.fkine([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7])
% T2=Robot_2.fkine([Th_1 Th_2 Th_3 Th_4 Th_5 Th_6 Th_7])

P_x=(floor(T(1,4)))
P_y=(floor(T(2,4)))
P_z=(floor(T(3,4)))
plot3(P_x,P_y,P_z,'bo','linewidth',1)
hold on;

                        end
                   end
              end
         end
         
end
end
       