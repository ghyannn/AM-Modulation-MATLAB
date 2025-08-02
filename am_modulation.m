
 fs=1000;   
fc = 5000;            
fm = 100;            
t = 0:1/fs:0.05;    



Am = 1;
m = Am * cos(2*pi*fm*t);    



Ac = 2;                     

s = (Ac + m) .* cos(2*pi*fc*t);


envelope = abs(s);


cutoff = 2*fm/fs;            
[b, a] = butter(6, cutoff); 

m_rec = filter(b, a, envelope) - Ac;  

figure;

subplot(4,1,1);
plot(t, m, 'b');
title('Original Message m(t)');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,2);
plot(t, s, 'b');
title('AM Signal: (Ac + m(t)) cos(2πfct)');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,3);
plot(t, envelope, 'b');
title('Envelope of AM Signal');
xlabel('Time (s)'); ylabel('Amplitude');

subplot(4,1,4);
plot(t, m, 'b', t, m_rec, 'r--');
legend('Original m(t)', 'Demodulated m_{rec}(t)');
title('Comparison: Original vs Demodulated');
xlabel('Time (s)'); ylabel('Amplitude');

ax = gca;              

disableDefaultInteractivity(ax); 
saveas(gcf, 'my_clean_plot.png');
publish('am_modulation.m','pdf');

