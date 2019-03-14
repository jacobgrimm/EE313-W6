clear   
clc

N=1000;
t = linspace ((-3*pi)/2,(3*pi)/2,N);
y = zeros(size(t));

for n = 1:N
    if (-pi)/4 < t(n) && t(n)  < (pi)/4
        y(n) = (4/pi)*t(n);
    elseif (-5*pi)/4 < t(n) && t(n) < (-3*pi)/4
        y(n) = (4/pi)*(t(n) + (pi));
    elseif (3*pi)/4 < t(n) && t(n) < (5*pi)/4
        y(n) = (4/pi)*(t(n) - (pi));
    end
end

plot(t,y,'r');
grid on;

K = 10;
for n = 1:K
X(n) = (j/(n*pi))*(cos((n*pi)/2)-(2/(n*pi))*sin((n*pi)/2));
end
n = 0;
X0 = (j/(n*pi))*(cos((n*pi)/2)-(2/(n*pi))*sin((n*pi)/2));

T = pi;
omo = 2*pi/T;
for n = 1:K
    x(n,:) = real(2*X(n)*exp(1i*n*omo.*t));
end


xcombined = sum(x);


figure(1);
hold on;
plot (t,xcombined,'b');

figure(2);
n = 0:10;
a = [X0,X];
stem(n,abs(a));

figure (3);
stem(n,180/pi*angle(a));
grid on;