%%
% Plot Cell SOC
figure()
subplot(2,2,1)
for i = 1:N
    plot(out.soc.time,out.soc.signals.values(:,i),'linewidth',2);
    hold on;
end
xlabel('Time (s)'); 
ylabel('Cell SOC (%)');
grid on;
xlim([0 tend])
legend('Cell 1','Cell 2','Cell 3','Cell 4','Cell 5','Cell 6')
settings;

%%
% Plot isoc currents
subplot(2,2,2)
for i = 1:N
    plot(out.soc.time,out.isoc.signals.values(:,i),'linewidth',2);
    hold on;
end
xlabel('Time (s)'); 
ylabel('i_{soc} (A)');
grid on;
xlim([0 tend])
settings;

%%
% Plot io currents
subplot(2,2,3)
for i = 1:N
    plot(out.soc.time,out.ivl.signals.values(:,i),'linewidth',2);
    hold on;
end
xlabel('Time (s)'); 
ylabel('i_{vl} (A)');
grid on;
xlim([0 tend])
settings;

%%
% Plot Vcells
subplot(2,2,4)
plot(out.Vcell.time,out.Vcell.signals.values,'linewidth',2);
xlabel('Time (s)'); 
ylabel('Cell voltage (V)');
grid on;
xlim([0 tend])
settings;


%%
% Plot Bus voltage
figure()
plot(out.soc.time,out.Vbus.signals.values,'linewidth',3);
xlabel('Time (s)'); 
ylabel('Bus voltage (V)');
% ylim([0 17])
grid on;
xlim([0 tend])
settings;

function settings 
    set(findobj(gca,'Type','Line'),'LineWidth',2);
    set(gca,'XMinorTick','On');
    set(gca,'YMinorTick','On');
    set(get(gca,'XLabel'),'FontSize',12,'FontName','Times','FontWeight','normal');
    set(get(gca,'YLabel'),'FontSize',12,'FontName','Times','FontWeight','normal');
    set(get(gca,'Title'),'FontSize',12,'FontName','Times','FontWeight','normal');
    set(gcf,'color','w');
    set(gcf,'DefaultAxesLineWidth',1);
    set(gcf,'DefaultLineLineWidth',2);
    set(gca,'LineWidth',1);
    set(gca,'FontSize',12,'FontName','Times','FontWeight','normal');
    movegui('center');
    set(gcf,'color','w');
end
