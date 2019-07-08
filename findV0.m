function initSpeed = findV0(u,index)
    global V0 
    
 
    for i = index:length(u)
        if(u(i)==1)
            break;
        end
       
    end
    
    %error handling
    if i-index ==0
        initSpeed =0;
    else
         initSpeed= -V0(i-index+1);
    end
    
end