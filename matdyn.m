dataall=importdata("eigve.txt");
freq=importdata("freq.txt");
eigvector=dataall(1:end,1:end);
atom=94;
mass=zeros(1,atom);
cagetick=[];
organictick=[];
br=[];
for i=1:2
    mass(i)=207.200;%pb
    cagetick=[cagetick,i];
end
for i=3:10
    mass(i)=126.904;%I
    cagetick=[cagetick,i];
end
for i=11:14
    mass(i)=14.007;%N
    organictick=[organictick,i];
end
for i=15:62
    mass(i)=1.008;%H
    organictick=[organictick,i];
end
for i=63:94
    mass(i)=12.011;%c
    organictick=[organictick,i];
end
cage=[];
organic=[];
brall=[];
for mu=1:atom*3
    a_mu=renorm(eigvector(atom*(mu-1)+1:atom*(mu-1)+atom,1:2:end),mass);
    [org,cag,brcontri]=seperate(organictick,cagetick,br,a_mu);
    cage=[cage,cag];
    organic=[organic,org];
    brall=[brall,brcontri];
end
le=100;
all=[cage(4:le)' organic(4:le)'];
freqplot=freq(4:le);
axis([0 500 0 1]);
bar(freqplot,all,'stack','EdgeColor','none','BarWidth',30);
legend('cage(PbI)','organic');
xlabel("freq(cm^-1)");
ylabel("contribution")