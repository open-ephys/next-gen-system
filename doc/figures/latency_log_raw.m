%prep histograms (make manually and calibrate to iamges)

I=imread('./latencies/usb.png');
clf; hold on;
bins{1}  =[0:20];
hists{1} =[0 0 0 0 0 3 5 8 9 10 9 8 9 10 8 7 8 7 1 1 0 ]
hists{1}=hists{1}./max(hists{1}); % ms

imagesc(flipud(I));
plot((bins{1}*18)+90,120+(hists{1}*300),'r');
hists{1}=hists{1}./sum(hists{1});

%% rtxi
I=imread('./latencies/rtxi.png');
clf; hold on;
bins{3}  =linspace(0,7.6,32); % us
hists{3} =[0 0 1 1 10 23 24 23 23 21 19 15 14 13 13 11 10 9 8 6 4 3 3 2 2 2 3 2 0 1 1 0]
hists{3}=hists{3}*.05; % ms

imagesc(flipud(I));
plot((bins{3}*110)+99,60+(hists{3}*300),'r');
hists{3}=hists{3}./sum(hists{3});
%% pcie
I=imread('./latencies/pcie_direct.png');
clf; hold on;
bins{2}  =linspace(0,200,35); % us
hists{2} =[0 0 0 0 0 0 0 0 0 5 5.5 6 6 6 5 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
hists{2}=hists{2}*.05; % ms

imagesc(flipud(I));
plot((bins{2}*.375)+1,01+(hists{2}*300),'r');
hists{2}=hists{2}./sum(hists{2});

%% usb
ranges=[0.5,0.501;1,7; 33,33.1; 50,90; 300,600; 800,2000; 5000,20000];
labels={'x'      ,'RTXI','Sample@30kHz', 'PCIe direct', 'PCIe OE chain', 'Ethernet', 'USB'};

clf;
semilogx(0,0);
hold on;
grid on;
for i=1:size(ranges,1)
    plot(ranges(i,:),[i i],'r','LineWidth',3);
    text(ranges(i,2).*1.2,i,labels{i});
end;

plot(bins{1}*1000,7+hists{1}*5,'r'); % usb histogram
plot(bins{2},4+hists{2}*5,'r'); % pcie histogram
plot(bins{3},2+hists{3}*5,'r'); % RTXI histogram

xlim([0 40000]); % us
ylim([0 i+1]);