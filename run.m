%%
%--------------------------------------------------------------------------
%										run.m
%--------------------------------------------------------------------------
%**************************************************************************
% @ Author                   : 		Yegeta Zeleke                                            	        
% @file_name				 : 		 run.m														  
% @ Date                     : 	   11/02/18                                                     
% @ Discription				 :      Motion Planning for flappy bird
% @ Usage					 :      run()    																						  
%@Revision					 :  	11/5/18                                                                                      
%***************************************************************************

function run(pick,horizon)


    %global variables
    close all;clc;
    %clc
    global fx fy obstacles  pipe_width ref  Pipe_type TSPAN JSPAN rule options terminate g fyy V0
    global Tstar

    Tstar = 0.13;
    
    
    pipe_width = 0.7;
    fx =1.9;
    fy =1.2;
    fyy = 0;
    g = -12;
    terminate =0;
    
    ref =2;

    Pipe_type =[2   2;
                1.5 2.5;
                1   3];
            
            
     %%look up table
     V0 =   [1.2000;
            -0.3600;
            -1.9200;
            -3.4800;
            -5.0400;
            -6.6000;
            -8.1600;
            -9.7200;
            -11.2800;
            -12.8400;
            -14.4000;
            -15.9600;
            -17.5200;
            -19.0800;
            -20.6400;
            -22.2000;
            -23.7600;
            -25.3200;
            -26.8800;
            -31.1000]';

 

    obstacles=chooseObstacle(pick);
    draw_obstacles(obstacles);
    grid on;
    %axis([0 10 0 5])
    %obstacles = [2 1.1;4 2.0];
  %%  
    % Initial conditions 
    x1_0 = [10 9 7 6 5];%0.34;
    x2_0 = [2 2 2.5 1];
    x3_0 = zeros(1,4);;
    x4_0 = zeros(1,4);
    x5_0= zeros(1,4); %timer
    


    % simulation horizon
    TSPAN=[0 3];
    JSPAN = [0 horizon];

    % rule for jumps
    % rule = 1 -> priority for jumps
    % rule = 2 -> priority for flows
    rule = 1;

    options = odeset('RelTol',1e-6,'MaxStep',.5);
    
    %j_tf=1;
   
    k=2;
    x0= [x1_0(k);x2_0(k);x3_0(k);x4_0(k);x5_0(k)];

    Nx =14;%prediction horizon
    Nu =Nx; %control horizon
    
    total_jumps = 0;
    
    
    simTime =horizon*1;
    
    validInput=[];
    %validInput= reachableSet(x0,simTime);
    %validInput=  reachableSetBounds(x0,simTime);
    
    %%
    x0_upper =x0;
    x0_lower =x0;
    ii=0;
    while ii<simTime
        ii=ii+horizon;
        
        validInput_upper=  FindUpperBound(x0_upper,horizon,1);
        xf_upper = PlotReach(x0_upper,validInput_upper);
        x0_upper = [xf_upper'; x0(3);0;1];
        
        validInput_lower=  FindLowerBound(x0_lower,horizon,1);
        xf_lower = PlotReach(x0_lower,validInput_lower);
        x0_lower = [xf_lower'; x0(3);0;0];
        
        if isempty(validInput_upper) && ~isempty(validInput_lower) %if upper bound return empty
            x0_upper = [xf_lower'; x0(3);0;0];
        elseif ~isempty(validInput_upper) && isempty(validInput_lower) %if upper bound return empty
            x0_lower = [xf_upper'; x0(3);0;1];
        elseif isempty(validInput_upper) && isempty(validInput_lower)
            break
        else;
        end
    end
    
    
    

    



end
 


