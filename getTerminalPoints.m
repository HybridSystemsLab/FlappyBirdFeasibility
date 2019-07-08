%%
%--------------------------------------------------------------------------
%                                       getTerminalPoints.m
%--------------------------------------------------------------------------
%**************************************************************************
% @ Author                   :      Yegeta Zeleke                                                       
% @file_name                 :      getTerminalPoints.m                                                       
% @ Date                     :      10/02/18                                                     
% @ Discription              :      This function returns trajectory 
%                                   points given initial condtion and input
%                                   sequences.

% @ Usage                    :      getTerminalPoints(x0, input)
%                                         
%                                   x0 is the initial condition which is a 5x1 
%                                        row vector for [x,y,vy,q,tau]^T 
%                                   input: is sequence of inputs to be applied 
%                                           to obtain system trajectory
%                                                                                 
%@Revision                   :      12/17/18                                                                                      
%***************************************************************************
function [endpoints,data]= getTerminalPoints(x0,validInput)

        
        global obstacles TSPAN JSPAN rule options u index
        
 
        endpoints=[];
        
       
            
         %Find inputs without Inf( collision)
        %validInput(ii,:);
        if(sum(validInput==Inf)<=0) % if valid_input contain INF



            u = validInput;
            index = 1;

            x0(4) = u(1);
            x0(3) =findV0(u,1); 
            [t j x]= HyEQsolver( @f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);

             %plot safe recable sets
             figure(8) % velocity
             draw_obstacles(obstacles);
             hold on
             grid on
             plot(x(:,1),x(:,2))
             plot(x(end,1),x(end,2),'b*')
             plot(x0(1),x0(2),'b*');
              endpoints= x(end,:);


        end
        data = x;
        
        
    end
    