clear   
clc

N=1000;
t = linspace (-3,3,N);
y = zeros(size(t));

for n=1:N
    if -1<t(n) && t(n)<1
        y(n) = exp(-t(n));
    elseif 1<t(n) && t(n)<3
        y(n) = exp(-(t(n)-2));
    elseif -3<t(n) && t(n)<-1
        y(n) = exp(-(t(n)+2));
    end
end

plot(t,y,'r');
grid on;

K = 10;
for n = 1:K
X(n) = ((-1)^n / (2*(1 + pi*n*1i)))* (exp(1) - (exp(-1)));
end
n = 0;
X0 = ((-1)^n / (2*(1 + pi*n*1i)))* (exp(1) - (exp(-1)));

T = 2;
omo = 2*pi/T;
for n = 1:K
    x(n,:) = real(2*X(n)*exp(1i*n*omo*t));
end


xcombined = X0 + sum(x);

L = 50;
for n = 1:L
X(n) = ((-1)^n / (2*(1 + pi*n*1i)))* (exp(1) - (exp(-1)));
end
n = 0;
X02 = ((-1)^n / (2*(1 + pi*n*1i)))* (exp(1) - (exp(-1)));

T = 2;
omo = 2*pi/T;
for n = 1:L
    x2(n,:) = real(2*X(n)*exp(1i*n*omo*t));
end

xcombined2 = X02 + sum(x2);

figure(1);
hold on;
plot (t,xcombined,'b');
plot (t,xcombined2,'g');

figure(2);
n = 0:50;
a = [X0,X];
stem(n,abs(a));

figure (3);
stem(n,180/pi*angle(a));
grid on;