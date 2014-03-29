function phic = turningAngle(xc, yc)
    %using x and y coordinates, use trig to find angle to turn to return
    %home
    
    
    
    if xc >= 0 && yc >= 0
        display('Q4')
        xc
        yc
        atan(abs(xc)/abs(yc))
        phic = atan(abs(xc)/abs(yc)) + pi
    elseif xc>= 0 && yc <0
        display('Q3')
        xc
        yc
        atan(abs(yc)/abs(xc))
        phic = atan(abs(yc)/abs(xc)) + (3*pi)/2
    elseif xc < 0 && yc < 0
        display('Q2')
        xc
        yc
        atan(abs(xc)/abs(yc))
        phic = atan(abs(xc)/abs(yc))
    else
        display('Q1')
        xc
        yc
        atan(abs(yc)/abs(xc))
        phic = atan(abs(yc)/abs(xc)) + (pi)/2
    end
end



