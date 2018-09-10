clc
clear all
close all


M = 60; alpha = (M-1)/2; l = 0:M-1; wl = (2*pi/M)*l;
Hrs = [ones(1,7),0.5925,0.1099,zeros(1,43),0.1099,0.5925,ones(1,6)];
Hdr = [1,1,0,0]; wdl = [0,0.2,0.3,1];
k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;
angH = [-alpha*(2*pi)/M*k1, alpha*(2*pi)/M*(M-k2)];
H = Hrs.*exp(j*angH); h = real(ifft(H,M));
[db,mag,pha,grd,w] = freqz_m(h,1); [Hr,ww,a,L] = Hr_Type2(h);
figure('Name','Ejercicio 7.16','NumberTitle','off')
%1
subplot(2,2,1);plot(wl(1:39)/pi,Hrs(1:39),'o',wdl,Hdr);
axis([0,1,-0.1,1.1]); title('Frequency Samples: M=60,T1=0.59, T2=0.109')
xlabel('frequency in pi units'); ylabel('Hr(k)');grid minor 
%2
subplot(2,2,2); stem(l,h); axis([-1,M,-0.1,0.3])
title('Impulse Response'); xlabel('n'); ylabel('h(n)');
%3
subplot(2,2,3); plot(ww/pi,Hr,wl(1:39)/pi,Hrs(1:39),'o');
axis([0,1,-0.2,1.2]); title('Amplitude Response')
xlabel('frequency in pi units'); ylabel('Hr(w)');grid minor
%4
subplot(2,2,4);plot(w/pi,db); axis([0,1,-99,5]); grid on
title('Magnitude Response'); xlabel('frequency in pi units');
ylabel('Decibels');grid minor