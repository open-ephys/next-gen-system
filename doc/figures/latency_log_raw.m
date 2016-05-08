
ranges=[0.5,0.501;2,7; 33,33.1; 50,90; 300,600; 800,2000; 7000,20000];
labels={'x','RTXI','Sample@30kHz', 'PCIe direct', 'PCIe OE chain', 'Ethernet', 'USB'};

clf;
semilogx(0,0);
hold on;
grid on;
for i=1:size(ranges,1)
    plot(ranges(i,:),[i i],'r','LineWidth',3);
    text(ranges(i,2).*1.2,i,labels{i});
end;
xlim([0 40000]);
ylim([0 i+1]);