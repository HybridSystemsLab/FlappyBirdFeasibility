function inside = D(x) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Torstein Ingebrigtsen Bø
%
% Description: Jump set
% Return 0 if outside of D, and 1 if inside D
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    global Tstar obstacles
    
    epsilon = 0.02;
    x1= x(1);
    x2 = x(2);
    q = x(4);
    t = x(5);
    
  
    if(t>=Tstar)||(barrier_function(obstacles,[x(1) x(2)] ))
        inside =1;
    else
        inside =0;
    end
    

end