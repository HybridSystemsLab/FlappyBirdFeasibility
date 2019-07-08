function plotTraj(data)

        
        global obstacles
 
       

        %plot safe recable sets
        figure(9) % velocity
        draw_obstacles(obstacles);
        hold on
        grid on
        plot(data(:,1),data(:,2))
        plot(data(end,1),data(end,2),'b*')
        plot(data(1,1),data(1,2),'b*');
    


  
        
        
    end
    