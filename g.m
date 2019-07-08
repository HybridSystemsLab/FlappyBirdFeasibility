function xplus = g(x)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Matlab M-file               Author: Torstein Ingebrigtsen Bø
    %
    % Project: Simulation of a hybrid system (bouncing ball)
    %
    % Description: Jump map
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    global fy index u Tstar obstacles
    % state
    x1 = x(1);
    x2 = x(2);
    t = 0; %reset timer
    
    
    
    
     if(barrier_function(obstacles,[x(1) x(2)] ))
         u(index) = Inf;
         t=Tstar;
     end
     
   
     
     q_plus = u(index);
     
     if  q_plus==1
         x3= fy;
    
     else
         x3 =findV0(u,index);      
     end
     
     if(index<length(u))
        index = index+1;
     else
         t=Tstar; %for now if we use all inputs make it jumps forever
     end
    
     

    xplus = [x1 ;x2;x3;q_plus;t];
end