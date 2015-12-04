function [h] = plotLines( ForceN, SPDisplacementmm, kneeName, testname)
%[h] = plotLines( ForceN, SPDisplacementmm )
%   This function plots the lines on the same X axis for Force and
%   Diplacement for the force and string pot data, and plots on right
%   hand and left hand Y axes. 
%   Returns a handle to the figure of the plot.

    %plot all your figures here
    a = length(ForceN);
    %plot last third (???)
    F3N=ForceN(ceil(((2*a)/3)-25):end-10);
    SP3=SPDisplacementmm(ceil(((2*a)/3)-25):end-10);
    a3=length(F3N);
    time3a = (0:(1/50):((a3-1)/50));
    h = figure;
    [ax3,p13,p23] = plotyy(time3a,F3N,time3a,SP3, 'plot','plot');
    hold;
    ylabel(ax3(1),'Force (N)')
    ylabel(ax3(2),'Displacement (mm)')
    xlabel(ax3(2), 'Time')
    legend('Force(N)','Displacement (mm)')
    title(strcat(kneeName,' ',testname))
    set(p13,'color','red')
    set(p23,'color','blue')
    set(ax3(1),'ycolor','red') 
    set(ax3(2),'ycolor','blue')
    

end

