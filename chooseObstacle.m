function obstacleReturn = chooseObstacle(k)

         global   pipe_width   Pipe_type 
  
         
            gap =1.8;

                    

                 obstacles =            [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2)
                                         1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2)
                                         1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2)
                                         1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2)
                                         1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2)
                                         11              0            pipe_width Pipe_type(2,1);
                                         11      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)];
                                     
                                     
                obstacles(:,:,2) =      [1              0            pipe_width Pipe_type(1,1);
                                        1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                        3              0            pipe_width Pipe_type(3,1);
                                        3      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                        5              0            pipe_width Pipe_type(2,1);
                                        5      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)
                                        7              0            pipe_width Pipe_type(1,1);
                                        7      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                        9              0            pipe_width Pipe_type(3,1);
                                        9      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                        11              0            pipe_width Pipe_type(2,1);
                                        11      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)]; 
                                     

                obstacles(:,:,3) =      [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(3,1);
                                         3      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         5              0            pipe_width Pipe_type(2,1);
                                         5      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)
                                         7              0            pipe_width Pipe_type(2,1);
                                         7      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         9              0            pipe_width Pipe_type(3,1);
                                         9      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         11              0            pipe_width Pipe_type(2,1);
                                         11      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)]; 
                         

                obstacles(:,:,4) =      [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(3,1);
                                         3      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         5              0            pipe_width Pipe_type(2,1);
                                         5      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)
                                         7              0            pipe_width Pipe_type(1,1);
                                         7      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         9              0            pipe_width Pipe_type(3,1);
                                         9      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         11              0            pipe_width Pipe_type(2,1);
                                         11      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)]; 
            
                obstacles(:,:,5) =      [1              0            pipe_width Pipe_type(2,1);
                                         1      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         3              0            pipe_width Pipe_type(2,1);
                                         3      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         5              0            pipe_width Pipe_type(2,1);
                                         5      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)
                                         7              0            pipe_width Pipe_type(2,1);
                                         7      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         9              0            pipe_width Pipe_type(2,1);
                                         9      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)
                                         11              0            pipe_width Pipe_type(2,1);
                                         11      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)]; 
                                     
                         %impossible route
                obstacles(:,:,6) =      [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(3,1);
                                         3      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         5              0            pipe_width Pipe_type(2,1);
                                         5      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)
                                         7              0            pipe_width 4 ;
                                         7      4+gap-0.5   pipe_width 0.5;
                                         9              0            pipe_width Pipe_type(3,1);
                                         9      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2)
                                         11              0            pipe_width Pipe_type(2,1);
                                         11      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)]; 
                                     
                                                   %impossible route
                obstacles(:,:,7) =      [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(3,1);
                                         3      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         5              0            pipe_width Pipe_type(2,1);
                                         5      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)
                                         7              0            pipe_width Pipe_type(3,2);
                                         7     Pipe_type(3,1)+gap    pipe_width Pipe_type(3,1);
                                         9              0            pipe_width Pipe_type(3,1);
                                         9      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2)
                                         11              0            pipe_width Pipe_type(2,1);
                                         11      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2)]; 
                                     
               obstacles(:,:,8) =      [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(3,1);
                                         3      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         5              0            pipe_width Pipe_type(2,1)+0.2;
                                         5      Pipe_type(2,1)+gap-0.2   pipe_width Pipe_type(2,2)+0.2
                                         7              0            pipe_width Pipe_type(2,1);
                                         7      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         9              0            0 0;
                                         9              0            0 0;
                                         11             0            0 0;
                                         11             0            0 0];  
                                     
                obstacles(:,:,9) =      [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(3,1);
                                         3      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         5              0            pipe_width Pipe_type(2,1)+0.4;
                                         5      Pipe_type(2,1)+gap-0.4   pipe_width Pipe_type(2,2)+0.4
                                         7              0            pipe_width Pipe_type(2,1);
                                         7      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         9              0            0 0;
                                         9              0            0 0;
                                         11             0            0 0;
                                         11             0            0 0]; 
                 obstacles(:,:,10) =      [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(3,1);
                                         3      Pipe_type(3,1)+gap   pipe_width Pipe_type(3,2);
                                         5              0            pipe_width Pipe_type(2,1)+0.6;
                                         5      Pipe_type(2,1)+gap-0.6   pipe_width Pipe_type(2,2)+0.6
                                         7              0            pipe_width Pipe_type(2,1);
                                         7      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         9              0            0 0;
                                         9              0            0 0;
                                         11             0            0 0;
                                         11             0            0 0]; 
                                     
                   obstacles(:,:,11) =   [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(2,1)+0.6;
                                         3      Pipe_type(2,1)+gap-0.6   pipe_width Pipe_type(2,2)+0.6;
                                         5              0            pipe_width Pipe_type(2,1)+0.6;
                                         5      Pipe_type(2,1)+gap-0.6   pipe_width Pipe_type(2,2)+0.6
                                         7              0            pipe_width Pipe_type(2,1);
                                         7      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         9              0            0 0;
                                         9              0            0 0;
                                         11             0            0 0;
                                         11             0            0 0];
                    
                                
                  obstacles(:,:,12) =   [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(2,1)+0.6;
                                         3      Pipe_type(2,1)+gap-0.9   pipe_width Pipe_type(2,2)+0.9;
                                         5              0            pipe_width Pipe_type(2,1)+0.6;
                                         5      Pipe_type(2,1)+gap-0.6   pipe_width Pipe_type(2,2)+0.6
                                         7              0            pipe_width Pipe_type(2,1);
                                         7      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         9              0            0 0;
                                         9              0            0 0;
                                         11             0            0 0;
                                         11             0            0 0]; 
                                     
                  obstacles(:,:,13) =   [1              0            pipe_width Pipe_type(1,1);
                                         1      Pipe_type(1,1)+gap   pipe_width Pipe_type(1,2);
                                         3              0            pipe_width Pipe_type(2,1)+0.6;
                                         3      Pipe_type(2,1)+gap-1   pipe_width Pipe_type(2,2)+1;
                                         5              0            pipe_width Pipe_type(2,1)+0.6;
                                         5      Pipe_type(2,1)+gap-0.6   pipe_width Pipe_type(2,2)+0.6
                                         7              0            pipe_width Pipe_type(2,1);
                                         7      Pipe_type(2,1)+gap   pipe_width Pipe_type(2,2);
                                         9              0            0 0;
                                         9              0            0 0;
                                         11             0            0 0;
                                         11             0            0 0];                    
                                     
                
                  obstacleReturn=  obstacles(:,:,k);         
                                     
            end