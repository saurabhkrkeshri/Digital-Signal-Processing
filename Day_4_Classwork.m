%% Circular Convolution using Definition
xn = input("Enter DTS");
hn = input("Enter filter");
%N = max(length(xn),length(hn));
N = input("Enter the N value");
xn = [xn zeros(1,N-length(xn))];
hn = [hn zeros(1,N-length(hn))];
for n=1:N
    y=0;
    for m = 1:N
        if((n-m)<=0)
            y = y+xn(m)*hn(N+n-m);
        elseif((n-m)>0)
                y = y+xn(m)*hn(n-m);
        end
        yn(1,n) = y;
    end
end
yn(2:end)
%% Overlap Save Method
x = [1 1 0 3 1 8 0 5 0 1 1 2 2 3];
h = [1 -1 1]
N = 6;
M = length(h);
L = N-M+1;
r = rem(length(x),L);
if (r~=0)
    x = [x zeros(1,L-r)]
end
for i=1:length(x)/L
    xn(i,:) = [x(1+(i-1)*L:i*L) zeros(1,(M-1))]
end
%x1 = [x(1:L) zeros(1,M-1)]
x%2 = [x(1+L:2*L) zeros(1,M-1)]
%x3 = [x(1+2*L:3*L) zeros(1,M-1)]
%x4 = [x(1+3*L:4*L) zeros(1,M-1)]
%% Overlap Add Method
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
xn(1,:) = [zeros(1,M-1) x(1:L)]
for i = 2: length(x)/L;
    temp = xn(i-1,:);
    xn(i,:) = [temp(end-M+2:end) x(1+(i-1)*L:i*L)];
end
xn

%x1 = [zeros(1,M-1) x(1:L)]
%x2 = [x1(end-M+2:end) x(1+L:2*L)]
%x3 = [x2(end-M+2:end) x(1+2*L:3*L)]
%x4 = [x3(end-M+2:end) x(1+3*L:4*L)]

