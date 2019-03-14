clear   
clc

N=1000;
t = linspace (-2,2,N);
y = zeros(size(t));

for n=1:N
    if -2<t(n) && t(n)<-1
        y(n) = exp(-(t(n)+2));
    elseif -1<t(n) && t(n)<0
        y(n) = exp(-(t(n)+1));
    elseif 0<t(n) && t(n)<1
        y(n) = exp(-(t(n)));
    elseif 1<t(n) && t(n)<2
        y(n) = exp(-(t(n)-1)); 
    end
end

plot(t,y,'r');
grid on;

L = 50;
for n = 1:L
X(n) = -((1 / (1 + 2*pi*n*1i))* (exp(-1) - 1));
end
n = 0;
X02 = -((1 / (1 + 2*pi*n*1i))* (exp(-1) - 1));

T = 1;
omo = 2*pi/T;
for n = 1:L
    x2(n,:) = real(2*X(n)*exp(1i*n*omo.*t));
end

xcombined2 = X02 + sum(x2);
ycombined2 = (1i*2*pi)/(1+1i*2*pi).*xcombined2;

figure(1);
hold on;
plot(t,abs(ycombined2));