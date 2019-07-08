%%
%----------------------------------------------------------------------------------
%                                       FindUpperBound.m
%----------------------------------------------------------------------------------
%***********************************************************************************
% @ Author                   :      Yegeta Zeleke                                                       
% @file_name                 :      FindUpperBound.m                                                       
% @ Date                     :      11/02/18                                                     
% @ Discription              :      Given an initial condition, this
%                                       function return the upper bound of input
%                                        

% @ Usage                    :      FindLowerBound(x0,horizon,step)
%                                   x0 is a row vector
%                                   2<horizon  // bigger horizon result ... 
%                                   1<=step<horizon  //use smaller step for good resolution
%                                                                                 
%@Revision                   :      12/17/18                                                                                      
%************************************************************************************

function bounds=FindUpperBound(x0,horizon,step)

       

        
        %generate all input sequences possible
        input_sequence = dec2bin(2^horizon-1:-1:0)-'0';
        
        %start by assuming all sequences result in  collision
        valid_input= Inf*(ones(1,size(input_sequence,2)));
        
        bounds =[];
        
        
        ii =1;
        %search for the first solution and break...start from top
        while ii< size(input_sequence,1)

            %get the ii^th sequnces of inputs
            u= input_sequence(ii,:);

            %see if the sequence of inpupt is collision free 
            valid_input = check_collision(x0,u);
            
            %if input is collision free we found the first valid solutin...the upper bound
            check = sum(valid_input==Inf);
            if check==0 %check if we find the first safe input
                bounds = [bounds;valid_input];
                break;

            end
            ii=ii+step;
        end
       
      
 end
    