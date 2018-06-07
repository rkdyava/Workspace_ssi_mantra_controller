%%
clear all;
close all;
figure
hold on
Ts=0.3;
 P_1_XYZ=[];
 Th_11=((10)*pi/180:Ts:(160)*pi/180);
 Th_22=((10)*pi/180:Ts:(160)*pi/180);
 Th_33=((10)*pi/180:Ts:(160)*pi/180) ;
for i=1:length(Th_11)
    Th_1=Th_11(i);
    for j=1:length(Th_22)        
            Th_2=Th_22(j);
        for k=1:length(Th_33)
         Th_3=Th_33(k);
   
%%
L_1=0.171338*10;
L_2=0.294*10;
L_3=0.4574*10;
L_4=0.0045;
L_5=0.03;
L_6=0;

L(1)=Link([0 L_1 0.001 pi/2]);
L(2)=Link([0  0 L_2 0]);
L(3)=Link([0 0 L_3 -pi/2]);

%%

T_base= [1 0 0 0; ...
         0 1 0 0 ;...
         0 0 1 1.5; ...
         0 0 0 1];
     T_base2= [1 0 0 -0.350833*10; ...
         0 1 0 0 ;...
         0 0 1 1.5; ...
         0 0 0 1];
 
Robot_1=SerialLink(L,'base',T_base)
Robot_2=SerialLink(L,'base',T_base2)

Robot_1.name='Robot_right';
Robot_2.name='Robot_left';
%%
Robot_1.plot([Th_1 Th_2 Th_3]);
Robot_2.plot([Th_1 Th_2 Th_3]);

T1=Robot_1.fkine([Th_1 Th_2 Th_3])
T2=Robot_2.fkine([Th_1 Th_2 Th_3 ])
hold on;
P_x=(floor(T1(1,4)))
P_y=(floor(T1(2,4)))
P_z=(floor(T1(3,4)))
view(3)
plot3(P_x,P_y,P_z,'bo','linewidth',1)
hold on;

P_x2=(floor(T2(1,4)))
P_y2=(floor(T2(2,4)))
P_z2=(floor(T2(3,4)))
plot3(P_x2,P_y2,P_z2,'ro','linewidth',1)
% 
%   rpy2 = tr2rpy(T2)  
  P_1_X(i,j,k)=[P_x]; 
  P_1_Y(i,j,k)=[P_y];
  P_1_Z(i,j,k)=[P_z];
  
  P_2_X(i,j,k)=[P_x2]; 
  P_2_Y(i,j,k)=[P_y2];
  P_2_Z(i,j,k)=[P_z2];

  
  
  box on ; grid on;hold on;
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
axis equal
 
        end
    end
end

%%
drawCube([-1 -4 Cube_z 5 0 0 0], 'FaceColor', 'g');alpha(0.2);
box on ; grid on;hold on;
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
axis equal




