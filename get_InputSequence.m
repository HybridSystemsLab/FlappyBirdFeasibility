%%
%--------------------------------------------------------------------------
%										get_InputSequence.m
%--------------------------------------------------------------------------
%**************************************************************************
% @ Author                   : 		Yegeta Zeleke                                            	        
% @file_name				 : 		get_InputSequence.m														  
% @ Date                     : 	    11/02/18                                                     
% @ Discription				 :      This function returns all valid input 
%                                   sequence for a given time horizon. 
%                                   Validinputs in respect to avoiding 
%                                   obstacle for flappy bird

% @ Usage					 :      get_InputSequence(pick_obstacle_setup,...
%                                            horizon, initial_condition)
%                                   1<= pick_obstacle_setup < 13  //check chooseObstacle()
%                                   2<horizon  // bigger horizon result ...
%                                        in heavy computation...22 max recommended
%                                   initial_condition is 5x1 ...
%                                        row vector for [x,y,vy,q,tau]^T	
%																				  
%@Revision					 :  	12/17/18                                                                                      
%***************************************************************************

function input_range=get_InputSequence(pick,horizon,x0)


    %define global variable that will be used in other modules

    global fx fy obstacles  pipe_width ref  Pipe_type TSPAN JSPAN rule options terminate g fyy V0

    %Tstar is the amount of time we allow input will be applied to system
    global Tstar

    Tstar = 0.13;
    
    %Width of each pipe...obstacle
    pipe_width = 0.7;

    %birds constant speed in the x direction
    fx =1.9;
    %birds constant speed in the y direction
    fy =1.2;

    fyy = 0;

    %gravity
    g = -12;

    terminate =0;
    
    %reference signal....may be not used on reachability and feasibility
    ref =2;

    %obstacle configurations
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

    
    %pick =8;
    %close all
    %for i =pick:11
    %    figure()
    %   obstacles=chooseObstacle(pick);
    %   draw_obstacles(obstacles);
    %end

    obstacles=chooseObstacle(pick);
    grid on;

    



    % simulation horizon
    TSPAN=[0 3];
    JSPAN = [0 horizon];

    % rule for jumps
    % rule = 1 -> priority for jumps
    % rule = 2 -> priority for flows
    rule = 1;

    options = odeset('RelTol',1e-6,'MaxStep',.5);
    
    
    
    %% set the the initial condition for both and upper at start point (x0) first
    x0_upper =x0;
    x0_lower =x0;

        
        
    validInput_upper=  FindUpperBound(x0_upper,horizon,1);
%   xf_upper = PlotBackwardReach(x0_upper,validInput_upper);
%   x0_upper = [xf_upper';0;1];

    validInput_lower=  FindLowerBound(x0_lower,horizon,1);
%   xf_lower = PlotBackwardReach(x0_lower,validInput_lower);
%   x0_lower = [xf_lower';0;0];
    
    


   
    input_range = [validInput_lower; validInput_upper];
    
    

    



end
 


