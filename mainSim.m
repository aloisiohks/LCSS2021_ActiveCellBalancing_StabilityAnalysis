clear all
close all
clc

addpath('./functions');

load('FORD53model.mat');  % Load battery model struct for a 25Ah NMC cell (ECM)

% Number of cells in series  (If you want to change the number of cells, simulink file also needs to be changed)
N = 6;         

% String current in this case is constant for the entire simulation
% I don't know yet how to use a varying current, if you do, let me know. It
% would be great to be able to simulate Istring as an UDDS discharge
% profile as in line 20 below.
Istring = -10;   % String current-> Positive for charging and Negative for discharging


% load('FORD53_DYN_40_P25')
% Istring = DYNData.script1.current(1940:3340);
% dT = DYNData.script1.time(2)-DYNData.script1.time(1);

tend = 1000;   % Simulation duration

Zload = 200;   % Low voltage bus load
SOC0 = 0.8;    % Initial SOC


% Voltage regulagion based on the OCV approximation 
% Vbus_ref = (m_ocp*zk + b_ocp)*n_t
m_ocp = 0.6763;     % slope
b_ocp = 3.3665;     % y-intercept of the line    
n_t = 4;            % transformer ratio

% SOC regulation and PID coefficients for each cell
% Obs: Note that according to the stability proof, the gain Gs must be negative for achieving stability.
% The gain here is positive but is negative in reality due to the current
% conversion in the simulink battery model 
SOC_PID1 =  [200 0 0];  % [Kp Ki Kd]
SOC_PID2 =  [200 0 0];
SOC_PID3 =  [200 0 0];
SOC_PID4 =  [200 0 0];
SOC_PID5 =  [200 0 0];
SOC_PID6 =  [200 0 0];

% % Voltage bus regulation and PID coefficients for each cell
Vbus_PID1 = [.1 10e-2 0];  % [Kp Ki Kd]
Vbus_PID2 = [.1 10e-2 0];
Vbus_PID3 = [.1 10e-2 0];
Vbus_PID4 = [.1 10e-2 0];
Vbus_PID5 = [.1 10e-2 0];
Vbus_PID6 = [.1 10e-2 0];




CellParam = Init_CellModel(25,model);
% SOC0_vector = SOC0*ones(N,1) + 0.1*(rand(N,1)-0.5); 
SOC0_vector = [0.7663 0.7619 0.7998 0.8460 0.7840 0.8085]; % S1
%  SOC0_vector = [0.8323;0.8194;0.7817;0.8450;0.7534;0.7938]; % S2
% SOC0_vector = SOC0*ones(N,1); % S3
Q_vector = (CellParam.Q*ones(N,1) + 0.1*(rand(N,1)-0.5))*3600;
% d = 100; % Load disturbance
d = 0.1;  % Gain disturbance
sim('Simulink_Sim');
% sim('Simulink_Sim_loadDisturbance');
% sim('Simulink_Sim')

out = ans;
plotFigures;

