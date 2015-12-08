x = [zeros(1,10) ones(1,7) zeros(1,10)];
y = fft(x);
figure;
subplot(2,1,1);
stem(x);
subplot(2,1,2);
plot(abs(y))

% Zero padding - finer scale in Fourier transform

y2 = fft(x,64);
y3 = fft(x,128);
figure;
subplot(3,1,1);
plot(abs(y));
subplot(3,1,2);
plot(abs(y2));
subplot(3,1,3);
plot(abs(y3));