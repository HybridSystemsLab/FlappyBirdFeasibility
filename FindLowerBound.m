%%
%----------------------------------------------------------------------------------
%                                       FindLowerBound.m
%----------------------------------------------------------------------------------
%***********************************************************************************
% @ Author                   :      Yegeta Zeleke                                                       
% @file_name                 :      FindLowerBound.m                                                       
% @ Date                     :      11/02/18                                                     
% @ Discription              :      Given an initial condition, this
%                                       function return the lower bound of input
%                                        

% @ Usage                    :      FindLowerBound(x0,horizon,step)
%                                   x0 is a row vector
%                                   2<horizon  // bigger horizon result ... 
%                                   1<=step<horizon  //use smaller step for good resolution
%                                                                                 
%@Revision                   :      12/17/18                                                                                      
%************************************************************************************
function bounds=FindLowerBound(x0,horizon,step)

       

        
        input_sequence = dec2bin(2^horizon-1:-1:0)-'0';
        
        %start by assuming all sequences are with collision
        valid_input= Inf*(ones(1,size(input_sequence,2)));
        
        bounds =[];
      
        
        %search for the first solution and break...start from bottom
        ii =size(input_sequence,1);
        while ii> 0
           u= input_sequence(ii,:);
           x0(3) =findV0(u,1); 
           valid_input = check_collision(x0,u);
            
            %if input is collision free we found the first valid solutin, the lower bound
            check = sum(valid_input==Inf);
            if check==0 %check if we find the first safe input
                bounds = [bounds;valid_input];
                break;            
            end
            ii=ii-step;
        end
       
        
 end
    