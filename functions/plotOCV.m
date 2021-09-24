clc;
clear all;
close all;

load('FORD54model')
addpath('functions');

z = 0:0.001:1;
OCV = OCVfromSOCtemp(z,25,model);

OCVlin = 0.6763*z + 3.3665;

figure()
plot(100*z,OCV);
hold on;
plot(100*z,OCVlin);
grid on;
xlabel('SOC (%)'); ylabel('Voltage (V)')
legend('Measured','Linear approximation')
paperStripFormat;

