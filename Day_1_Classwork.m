%Name: Saurabh Kumar
%USN: 1MS18EE051
%Experiment 1: Generating and Operation on Signals
%Step Function
clc;
clear;
close all;
t = -8:0.001:8;
u = t>=0;
plot(t,u);
hold all;
%% Discrete Step Function
clc;
clear;
close all;
t = -8:0.1:8;
u=t>=0;
stem(t,u);
%% Square Pulse from t = 1 to 3
clc;
clear;
close all;
t = -8:0.001:8;
u = t>=1 & t<=3;
plot(t,u);
%% Elementary Ramp Function Generation
clc;
clear;
close all;
t = -8:0.001:8;
u = t>=0;
r = t.*u;
plot(t,r);
%% Operation on Ramp Function
% x(t) = t*u(t-2)
clc;
clear;
close all;
t = -8:0.001:8;
u1 = t>=2; % This is equivalent to u(t-2)
x1 = t.*u1; % This is t*u(t-2)
plot(t,x1);
grid on;
hold on;
%% Operation on Ramp Function
% x(t) = (t-1)*u(t-2)
t = -8:0.001:8;
u1 = t>=2; % This is equivalent to u(t-2)
x2 = (t-1).*u1; % This is t*u(t-2)
plot(t,x2);
grid on;
%% Impulse Function
clc;
clear;
close all;
t = -8:0.001:8;
del = t==0;
plot(t,del);
%% Time Shifting in Impulse Function
% Impulse function shifted by 2 units
clc;
clear;
close all;
t = -8:0.001:8;
del = t==2;
plot(t,del);
%% Exponential Function
clc;
clear;
close all;
t = -8:0.001:8;
e1 = exp(3*t);
e2 = exp(-3*t);
plot(t,e1);
hold on;
plot(t,e2);
%% Elementary Exponential Function
clc;
clear;
close all;
t = -8:0.001:8;
u = t>=0;
e1 = exp(3*t).*u;
e2 = exp(-3*t).*u;
plot(t,e1);
figure;
plot(t,e2);
%% Sinusodal Function
clc;
clear;
close all;
f = 1;
t = -8:0.001:8;
s = sin(2*pi*f*t);
c = cos(2*pi*f*t);
plot(t,s);
hold on;
plot(t,c);
%% Elementary Sinusodal Function
clc;
clear;
close all;
f = 1;
t = -8:0.001:8;
u = t>=0;
s = sin(2*pi*f*t).*u;
c = cos(2*pi*f*t).*u;
subplot(2,1,1);
plot(t,s);
subplot(2,1,2);
plot(t,c);
%% Complex Sinusoidal Function
clc;
clear;
t=-1:0.0001:15;
f = 1;
u=t>=0;
cs= exp(2*t).*sin(2*pi*f*t);
cc = exp(-2*t).*cos(2*pi*f*t);
subplot(1,2,1);
plot(t,cs);
subplot(1,2,2);
plot(t,cc);
%% The Challenge Question
% y = (t+1)u(t+1)-(t+2)u(t)+(t-1)u(t-2)-(t-3)u(t-3)-u(t-4)
clc;
clear;
close all;
t=-8:0.001:8;
u1 = t>=-1;
u2 = t>=0;
u3 = t>=2;
u4 = t>=3;
u5 = t>=4;
y = (t+1).*u1-(t+2).*u2+(t-1).*u3-(t-3).*u4-u5;
plot(t,y);
%% The Challenge Question - 1
clc;
clear;
close all;
t = -8:0.001:8;
u1 = t>=1
u2 = t>=3
y = (-t+2).*u1+(t-4).*u2;
plot(t,y);
%% The Challenge Question - 2
clc;
clear;
close all;
t = -8:0.001:8;
u1 = t>=2;
u2= t>=3;
u3 = t>=4
y = 2*u1-u2-u3;
plot(t,y);
%% The Challenge Question - 3
% Triangluar Function Generation
clc;
clear;
close all;
t = -8:0.001:8;
y = t.*(unit_step(t,0)-unit_step(t,-1))+(-t+2).*(unit_step(t,-1)-unit_step(t,-2));
plot(t,y);

