%% Experiment 2: DFT and Convolution
% Name : Saurabh Kumar
% USN : 1MS18EE051
%% DFT using Matrix Method
xn = input("Enter the DTS");
N = length(xn);
n = 0:N-1;
k = 0:N-1;
nk = n' * k;
wk = exp(-2*pi*nk*i/N);
Xk = wk * xn'
%% IDFT using Matrix Method
ixn = (1/N)*(conj(wk)*Xk)
%% DFT using Analytical Method
clc;
clear;
close all;
xn = input("Enter the DTS");
N = length(xn);
for k=0:N-1
    xk = 0;
    for n=0:N-1
        xk = xk + xn(n+1)*exp(-2*pi*n*k*i/N);
    end
    Xk(k+1,1) = xk;
end
disp("Angle Matrix:");
angle(Xk)
%% DFT using inbuilt FFT Function
Xkfft = fft(xn)
%% Homework Question: Find DFT of your DOB
clc;
clear;
close all;
xn = input("Enter your DOB");
N = length(xn);
for k=0:N-1
    xk = 0;
    for n=0:N-1
        xk = xk + xn(n+1)*exp(-2*pi*n*k*i/N);
    end
    Xk(k+1,1) = xk;
end
magnitude = abs(Xk)
phase = angle(Xk);
phase = (180/pi)*phase
subplot(2,1,1);
plot(phase)
title("Phase Plot");
subplot(2,1,2);
plot(magnitude)
title("Magnitude Plot")
%% Linear and Circular Convolution using subroutine
% Using subroutine
xn = [1 2 3 4 5];
hn = [1 -1 1];
yn1 = conv(xn,hn)
yn2 = cconv(xn,hn,max(length(xn),length(hn)))
% Finding linear convolution using circular convoultion subroutine
% For this we have to change length of the output to length(xn) + length(hn)-1
yn3 = cconv(xn,hn,length(xn)+length(hn)-1)
%% Linear convolution using observation
xn = input("Enter DTS");
hn = input("Enter filter");
N = length(xn)+length(hn)-1;
xn = [xn zeros(1,N-length(xn))];
hn = [hn zeros(1,N-length(hn))];
h = hn(end:-1:1);
for i=1:N
    y(1,i) = h(end-i+1:end)*xn(1:i)';
end
disp("Convoltuion by pattern");
y
disp("=============================")
disp("Checking")
conv(xn,hn)
%% Linear Convolution using definition
xn = input("Enter the DTS");
hn = input("Enter filter");
N = length(xn)+length(hn)-1;
xn = [xn zeros(1,N-length(xn))];
hn = [hn zeros(1,N-length(hn))];
for n=1:N
    sum = 0
    for m = 1:n
        sum = sum + xn(m)*hn(n-m+1);
    end
    y(1,n) = sum;
end
disp("Convoltuion by definition");
y
disp("=============================")
disp("Checking")
conv(xn,hn)
%% Circular convolution using Stockham method - DFT-IDFT method
clc
clear
xn = input("Enter the DTS");
hn = input("Enter filter");
%N = max(length(xn),length(hn));
N = input("Enter value of N");
% If we increase the N value upto
xn = [xn zeros(1,N-length(xn))];
hn = [hn zeros(1,length(hn))];
n = 0:N-1;
k = 0:N-1;
nk = n'*k;
wn = exp(-2*i*pi*nk/N);
Xk = wn * xn';
Hk = wn * hn';
Yk = Xk.*Hk;
yn = (1/N)*(conj(wn)*Yk);
yn
%% Circular Convolution using Matrix method
xn = input("Enter DTS");
hn = input("Enter filter");
N = max(length(xn),length(hn));
xn = [xn zeros(1,N-length(xn))];
hn = [hn zeros(1,N-length(hn))];
temp = xn;
xn(1,:) = temp;
for i=1:N-1
    temp = [temp(end) temp(1:end-1)];
    xn(i+1,:) = temp;  
end
yn = xn'*hn'
%% Circular Convolution using Tabular Column
xn = input("Enter DTS");
hn = input("Enter filter");
N = max(length(xn),length(hn));
xn = [xn zeros(1,N-length(xn))];
hn = [hn zeros(1,N-length(hn))];
h = [hn(1) hn(end:-1:2)];
for i=1:N
    y(1,i) = xn*h';
    h = [h(end) h(1:end-1)];
end
y


    