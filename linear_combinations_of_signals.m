
%--- LINEAR COMBINATION IN SOUND


fs = 44100; % cd quality sampling rate
N = 145000; % number of samples
M= 4

% signal 0: "Alas, Poor Yorick!"
load hamlet.mat
hamlet = 2*alas(1:N);
subplot(611)
stem(hamlet(1:10000),'b','Marker','none','LineWidth',2)
title('Hamlet','fontsize',18)
sound(hamlet,fs); % sound accepts a signal = vector and a sampling rate (samples per second)

% sine wave
n = 0:N-1;
sinewave = 0.99*cos(2*pi/200 * n)';
subplot(612)
stem(sinewave(1:10000),'b','Marker','none','LineWidth',2)
title('Sinewave','fontsize',18)
sound(sinewave,fs);

% chirp
chirp = 0.3*cos(2*pi/3000000 * n.^2)';
subplot(613)
stem(chirp(1:10000),'b','Marker','none','LineWidth',2)
title('Chirp','fontsize',18)
sound(chirp,fs)

% white gaussian noise
noise = 0.1*randn(N,1);
subplot(614)
stem(noise(1:10000),'b','Marker','none','LineWidth',2)
title('Noise','fontsize',18)
sound(noise,fs);

% check that all the vectors are the same length and orientation
size(hamlet)
size(sinewave)
size(chirp)
size(noise)

% build "X" matrix
X = [hamlet, sinewave, chirp, noise];
size(X)

% specify an "a" vector, multiply by "X", and listen to the result "y"
a = [1; 
    0; 
    0; 
    0]

y = X*a;
sound(y,fs);

% specify an "a" vector, multiply by "X", and listen to the result "y"
a = [0; 
    1; 
    0; 
    0]
y = X*a;
sound(y,fs);


% specify an "a" vector, multiply by "X", and listen to the result "y"
a = [0; 
    0; 
    1; 
    0]
y = X*a;
sound(y,fs);

% specify an "a" vector, multiply by "X", and listen to the result "y"
a = [0; 
    0; 
    0; 
    1]
y = X*a;
sound(y,fs);

% specify an "a" vector, multiply by "X", and listen to the result "y"
a = [0.5; 
    0.5; 
    0.25; 
    0.1]
y = X*a;
sound(y,fs);

subplot(615)
stem(y(1:10000),'r','Marker','none','LineWidth',2)
title('Linear Combination 1','fontsize',18)

% specify an "a" vector, multiply by "X", and listen to the result "y"
a = [0.25; 
    0.5; 
    0.5; 
    0.1]
y = X*a;
sound(y,fs);
subplot(616)
stem(y(1:10000),'r','Marker','none','LineWidth',2)
title('Linear Combination 2','fontsize',18)

