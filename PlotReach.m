%%
%--------------------------------------------------------------------------
%                                       PlotBackwardReach.m
%--------------------------------------------------------------------------
%**************************************************************************
% @ Author                   :      Yegeta Zeleke                                                       
% @file_name                 :      PlotBackwardReach.m                                                       
% @ Date                     :      11/02/18                                                     
% @ Discription              :      Given an input sequence, this
%                                       function plots solution for the
%                                       backward reachable solution,
%                                        and return the final state
%                                        

% @ Usage                    :      PlotReach(x0,input)
%                                   x0 is a row vector
%                                   input denote a sequence of valid input
%                                                                                 
%@Revision                   :      12/17/18                                                                                      
%***************************************************************************
function endpoints= PlotBackwardReach(x0,validInput)

        
        global obstacles TSPAN JSPAN rule options u index
        
 
        endpoints=[];
        
       
            
        %First check if valid input is really valid.
        if(sum(validInput==Inf)<=0) % if valid_input contain INF

            %assign valid inputs to 'u' ---global variable
            u = validInput;

            %reset index to 1 since its used in HyeQ
            index = 1;

            x0(4) = u(1);

            %compute the initial velocity from the look up table
            x0(3) =findV0(u,1); 

            [t j x]= HyEQsolver( @f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);

             %plot safe recable sets
             figure(9) % velocity
             draw_obstacles(obstacles);
             hold on
             grid on
             plot(x(:,1),x(:,2))
             endpoints= [endpoints;x(end,1) x(end,2) x(end,3)];


        end
        
        
    end
    