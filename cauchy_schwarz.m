
% Use inner products for detection 

N = 120;
n = 0:N-1;


x0 = [zeros(10,1) ; ones(100,1) ;zeros(10,1)];
x0 = x0/norm(x0);

x1 = [zeros(10,1) ; ones(50,1); -ones(50,1) ;zeros(10,1)];
x1 = x1/norm(x1);


subplot(311);
stem(n,x0,'b','Marker','none','LineWidth',1);
title('Signal x0 - used to transmit a digital 0','fontsize',18);

subplot(312);
stem(n,x1,'r','Marker','none','LineWidth',1);
title('Signal x1 - used to transmit a digital 1','fontsize',18);


% It helps that the two signals are orthogonal to each other

% Signal being received after application of some noise

y = x0 + 0.2*randn(size(x1));

subplot(313);
stem(n,y,'k','Marker','none','LineWidth',1);
title('Received signal - Was it a 1 or a 0?','fontsize',18);


innerproduct0 = abs(y'*x0)
innerproduct1 = abs(y'*x1)

if innerproduct1 > innerproduct0
	display('The signal was a 1')
else
	display('The signal was a 0')
end