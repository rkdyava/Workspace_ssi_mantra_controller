% Inserting D-H convention parameters

L_1=0.171338*10;
L_2=0.294*10;
L_3=0.4574*10;
L_4=0.0045;
L_5=0.03;
L_6=0;

figure;
hold on
a1 = 0.001;         alpha1 = pi/2;     d1 = L_1;
a2 = L_2;        alpha2 = 0;         d2 = 0;
a3 =L_3;       alpha3 = -pi/2;         d3 = 0.0;
a4 = 0.0045; alpha4 = -pi/2; d4= 0.011;
a5 = 0.03; alpha5 = -pi/2; d5 = 0.140;
a6 = 0; alpha6 = pi/2; d6 =0.011;
%%
% Inserting joint limits for Arms
A2R=pi/180;
t1_min=10*A2R; t1_max=160*A2R;
t2_min = 10*A2R; t2_max = 160*A2R;
t3_min = 10*A2R; t3_max = 160*A2R;
% t4_min = 10*A2R; t4_max = 3.14;
% t5_min = -4.8; t5_max = 1.3;
% t6_min = -1.6; t6_max = 1.6;
% t7_min = -2.2; t7_max = 2.2;
%%
% Monte Carlo method
% sampling size
N = 2000;
t1 = t1_min + (t1_max-t1_min)*rand(N,1);
t2 = t2_min + (t2_max-t2_min)*rand(N,1);
t3 = t3_min + (t3_max-t3_min)*rand(N,1);
% t4 = t4_min + (t4_max-t4_min)*rand(N,1);
% t5 = t5_min + (t5_max-t5_min)*rand(N,1);
% t6 = t6_min + (t6_max-t6_min)*rand(N,1);
% t7 = t7_min + (t7_max-t7_min)*rand(N,1);
%%

T_base= [1 0 0 0; ...
         0 1 0 0 ;...
         0 0 1 1.5; ...
         0 0 0 1];
     T_base2= [1 0 0 -0.350833*10; ...
         0 1 0 0 ;...
         0 0 1 1.5; ...
         0 0 0 1];
  Robot_right=[T_base(1,4) T_base(2,4) T_base(3,4)];
  Robot_left=[T_base2(1,4) T_base2(2,4) T_base2(3,4)];

plot3(Robot_right(1),Robot_right(2),Robot_right(3),'ko','linewidth',10)
plot3(Robot_left(1),Robot_left(2),Robot_left(3),'ko','linewidth',10)
for i = 1:N
A1 = TransMat(a1,alpha1,d1,t1(i));
A2 = TransMat(a2,alpha2,d2,t2(i));
A3 = TransMat(a3,alpha3,d3,t3(i));
% A4 = TransMat(a4,alpha4,d4,t4(i));
% A5 = TransMat(a5,alpha5,d5,t5(i));
% A6 = TransMat(a6,alpha6,d6,t6(i));
% A7 = TransMat(a7,alpha7,d7,t7(i));
T = A1*A2*A3;%*A4*A5;
X=T(1,4);
Y=T(2,4);
Z=T(3,4);
plot3(X,Y,Z,'.')
hold on;
end
view(3);
title('Isometric view');
xlabel('x (m)');
ylabel('y (m)');
box on; grid on
zlabel('z (m) ');

drawCube([-1 -3 Cube_z 4 0 0 0], 'FaceColor', 'g');alpha(0.2);
box on ; grid on;hold on;
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')
axis equal