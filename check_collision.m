function valid_input=check_collision(x0,input)

        
        global obstacles TSPAN JSPAN rule options  u index
        
        
        %start by assuming all sequences are with collision
        valid_input = Inf*ones(1,length(u));
        
        

            
        %set values for global variables to be used in g,f,d,c or hybrid
        %data
        
        u = input;
        index = 1;
        
        %set first input   
        x0(4) = u(1);
        

        [t j x]= HyEQsolver( @f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);
        
        
        %if barrier_function(obstacles,[x(:,1) x(:,2)] ) % if current input result in collision
       %     return;
       % else
            valid_input = u;

           % plot if input is valid
%             figure(8) % velocity
%             draw_obstacles(obstacles);
%             hold on
%             grid on
%             plot(x(:,1),x(:,2))
            
       % end
        
        
    end
    