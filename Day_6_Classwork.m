%% FIR Filter
fs = input("Enter stop band frequency: ");
fp = input("Enter pass band frequency: ");
Fs = input("Enter sampling frequency: ");
rs = input("Enter stop band ripple: ");
lfs = length(fs);
lfp = length(fp);
if (lfs==1)
    wp = 2*pi*fp/Fs;
    ws = 2*pi*fs/Fs;
else
    wp(1) = 2*pi*fp(1)/Fs;
    ws(1) = 2*pi*fs(1)/Fs;
    wp(2) = 2*pi*fp(2)/Fs;
    ws(2) = 2*pi*fs(2)/Fs;
end
As = -20*log(rs);
tw = abs(wp(1)-ws(1));
if (As<=22)
    disp("Rectangular Window");
    N = ceil(((4*pi)/tw)-1);
    if (rem(N,2) == 0)
        N = N+1;
    end
    wn = @(n)(1);
elseif (As>22 & As <44)
    disp("Hanning Window");
    N = ceil(8*pi/tw);
    if (rem(N,2) == 0)
        N = N+1;
    end
    wn = @(n)(1-cos(2*pi*n/(N-1)));
elseif (As>=44)
    disp("Hamming Window");
    N = ceil(8*pi/tw);
    if(rem(N,2)==0)
        N =N+1;
    end
    wn = @(n)(0.54-0.46*cos(2*pi*n/(N-1)));
end
tao = (N-1)/2;
hd = @(w,n)((1/(2*pi))*(exp(-i*w*tao)*exp(i*w*n)));
% Selecting the Filter and Calculating FIR coefficent
if (lfs == 1)
    if(ws(1)>wp(1))
        disp("Low Pass Filter");
        wc = (wp+ws)/2;
        syms w n z
        for n=1:N-1
            hnd = int(hd(w,n),'w',-wc,wc);
            hd1 = double(hdn);
            hn(n+1) = hd1 * wn(n);
        end
        hn
        m = 0:N-1;
        stem(m,hn)
    else
        disp("High Pass Filter");
        wc = (wp+ws)/2;
        syms w n z;
        for n=1:N-1
            hnd = int(hd(w,n),'w',-pi,-wc)+int(hd(w,n),'w',wc,pi);
            hd1 = double(hnd);
            hn(n+1) = hd1*wn(n);
        end
        hn
        m = 1:N-1;
        stem(m,hn)
    end
elseif(lfs == 2)
    if (wp(1) > ws(1))
       disp("Band Pass Filter");
       wc1 = (wp(1)+ws(1))/2;
       wc2 = (wp(2)+ws(2))/2;
       syms w n z
       for n=1:N-1
           hnd = int(hd(w,n),'w',-wc1,-wc2)+int(hd(w,n),'w',wc2,wc1);
           hd1 = double(hnd);
           hn(n+1) = hd1*wn(n);
       end
       hn
       m = 1:N-1;
       stem(m,hn)
    else
        disp("Band Stop Filter");
        wc1 = (wp(1)+ws(1))/2;
        wc2 = (wp(2)+ws(2))/2;
        syms w n z
        for n=1:N-1
            hnd = int(hd(w,n),'w',-pi,-wc1)+int(hd(w,n),'w',-wc2,wc2)+int(hd(w,n),'w',wc1,pi);
           hd1 = double(hnd);
           hn(n+1) = hd1*wn(n);
       end
       hn
       m = 1:N-1;
       stem(m,hn)
    end
end



