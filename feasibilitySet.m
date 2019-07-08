%%
%--------------------------------------------------------------------------
%                                       feasibilitySet.m
%--------------------------------------------------------------------------
%**************************************************************************
% @ Author                   :      Yegeta Zeleke                                                       
% @file_name                 :      feasibilitySet.m                                                       
% @ Date                     :      11/02/18                                                     
% @ Discription              :      This function returns all valid input 
%                                   sequence for a given time horizon. 
%                                   Validinputs in respect to avoiding 
%                                   obstacle for flappy bird

% @ Usage                    :      feasibilitySet(goal,obstacle_setup,horizon,..
                                            points,x0)
%                                            horizon, initial_condition)
%                                   goal is the horizontal stop point  //check chooseObstacle()
%                                   1<= pick_obstacle_setup < 13  //check chooseObstacle()
%                                   2<horizon  // bigger horizon result ...
%                                        in heavy computation...22 max recommended
%                                   initial_condition is 5x1 ...
%                                        row vector for [x,y,vy,q,tau]^T    
%                                                                                 
%@Revision                   :      12/17/18                                                                                      
%***************************************************************************   

%feasibilitySet('goal',2,'obstacle_setup',6,'horizon',5,'points',3,'',k)
function feasibilitySet(goal_,goal,pick_,pick,horizon_,horizon,Ts_,Ts,k_,k)
    
    clc;close all;
    x1_0 = [10 7.5 6.8 11.5];%0.34;
    x2_0 = [2 2.5 2 3];
    x3_0 = zeros(1,4);
    x4_0 = zeros(1,4);
    x5_0= zeros(1,4); %timer
    
  
    
    
    


  
    
    %j_tf=1;
   
   % k=2;
    x0= [x1_0(k);x2_0(k);x3_0(k);x4_0(k);x5_0(k)];
    
    Ts= ceil(2^5/Ts);
    feasibility(goal,x0,pick,horizon,Ts);
    
    
    function found = feasibility(goal,x0,pick,horizon,Ts)
        global u
        input_sequence = dec2bin(2^horizon-1:-1:0)-'0';
        
         if x0(1)<goal %collided
             %disp('no solution for this point');
             found=1;
            return;
        end
    
        %get the input range for obstacle set 3 and horizon 5 and x0
        %get_InputSequence(obstacle_setup,horizon,x0)
        input_range=get_InputSequence(pick,horizon,x0);
        
        if isempty(input_range) %collided
             %disp('no solution for this point');
            found=0;
            return;
        end
        
        valid_start =  bi2de(input_range(1,:),'left-msb')+1;
        valid_end =  bi2de(input_range(2,:),'left-msb')+1;
        
        ii = valid_start;
        while ii<=valid_end
            idx = size(input_sequence,1)-ii+1;
            
            if idx <1 ||idx > size(input_sequence,1)
                found=0;
                return;
            end
            
            [x0_,data] = getTerminalPoints(x0,input_sequence(idx,:));
            
            if isempty(x0_) %collided
                 disp('no solution for above input');
                 found=0;
                 return  
            end
            found = feasibility(goal,x0_,pick,horizon,Ts);
            
            if found~=0
                plotTraj(data);
            end
            ii = ii+Ts;
        end
        return;
        
        
    end
end