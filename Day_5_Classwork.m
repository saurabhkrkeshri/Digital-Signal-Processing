%% Overlap Add Method
x = [1 2 3 3 2 1 -1 -2 -3 5 6 -1 2 0 2 1];
h = [3 2 1 1]
N = 7;
M = length(h);
L = N-M+1;
r = rem(length(x),L);
if (r~=0)
    x = [x zeros(1,L-r)]
end
h = [h zeros(1,L-1)];
for i=1:length(x)/L
    xn(i,:) = [x(1+(i-1)*L:i*L) zeros(1,(M-1))]
end
%x1 = [x(1:L) zeros(1,M-1)]
x%2 = [x(1+L:2*L) zeros(1,M-1)]
%x3 = [x(1+2*L:3*L) zeros(1,M-1)]
%x4 = [x(1+3*L:4*L) zeros(1,M-1)]
%Finding Convolution
n = 0:N-1;
k = 0:N-1;
nk = n'*k;
wn = exp(-2*j*pi*nk/N);
Hk = wn*h';
Xk = wn * xn';
Yk = Xk .* Hk;
yn = ((1/N)*(conj(wn)*Yk))';
for i = 1:length(x)/L
    t = [zeros(1,(i-1)*L) yn(i,:) zeros(1,length(x)+M-1-N-(i-1)*L)];
    y(i,:) = t;
end
sum(y,1);

%% Overlap Save Method
x = [1 1 0 3 1 8 0 5 0 1 1 2 2 3];
h = [1 -1 1]
h = [1 -1 1];
N = 6;
M = length(h);
L = N-M+1;
r = rem(length(x),L);
if(r~=0)
    x = [x zeros(1,L-r)];
end
h = [h zeros(1,L-1)];
xn(1,:) = [zeros(1,M-1) x(1:L)]
for i = 2: length(x)/L;
    temp = xn(i-1,:);
    xn(i,:) = [temp(end-M+2:end) x(1+(i-1)*L:i*L)];
end
xn 
for i=1:N
    temp = xn(i,:);
    temp_y(1,:) = temp;
    for j=2:N
       temp = [temp(end) temp(1:end-1)];
       temp_y(j,:) = temp;
    end
end
y(:,i) = temp_y'*h';
xn
%y'

%x1 = [zeros(1,M-1) x(1:L)]
%x2 = [x1(end-M+2:end) x(1+L:2*L)]
%x3 = [x2(end-M+2:end) x(1+2*L:3*L)]
%x4 = [x3(end-M+2:end) x(1+3*L:4*L)]
%% %% Overlap Save Method
x = [3 -1 0 1 3 2 0 1 2 1];
P = length(x);
h = [1 1 1];
N = 8;
M = length(h);
L = N-M+1;
r = rem(length(x),L);
if(r~=0)
    x = [x zeros(1,L-r)];
end
h = [h zeros(1,L-1)];
xn(1,:) = [zeros(1,M-1) x(1:L)];
for i = 2: length(x)/L;
    temp = xn(i-1,:);
    xn(i,:) = [temp(end-M+2:end) x(1+(i-1)*L:i*L)];
end
xn
% Finding Convolution
n = 0:N-1;
k = 0:N-1;
nk = n'*k;
wn = exp(-2*j*pi*nk/N);
Hk = wn*h';
Xk = wn * xn';
Yk = Hk .* Xk;
yn = ((1/N)*(conj(wn)*Yk))';
y = 0;
for i=1:length(x)/L
    temp = yn(i,:);
    y = [y temp(M:end)];
end
y = y(:)';
y = y(2:end)

%x1 = [zeros(1,M-1) x(1:L)]
%x2 = [x1(end-M+2:end) x(1+L:2*L)]
%x3 = [x2(end-M+2:end) x(1+2*L:3*L)]
%x4 = [x3(end-M+2:end) x(1+3*L:4*L)]


