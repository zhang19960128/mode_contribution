function [organiccontri,cagecontri,clcontri]=seperate(organictick,cagetick,cl,mode)
    atom=length(mode);
    organiccontri=0.0;
    cagecontri=0.0;
    clcontri=0.0;
    for i=1:atom
        if(sum(i==organictick)==1)
            organiccontri=organiccontri+norm(mode(i,1:end))^2;
        else
            cagecontri=cagecontri+norm(mode(i,1:end))^2;
        end
        if(sum(i==cl)==1)
            clcontri=clcontri+norm(mode(i,1:end))^2;
        end
    end
    shouldbeone=cagecontri+organiccontri;
end