function doi(a, b, c)
if (a==0)
    if (b==0)
        if (c==0)
            disp('infinitate de solutii')
        else
            disp('nicio solutie')
        end
    else
        disp('ecuatie de gradul intai')
        x=-c/b
    end
else
    if(b^2- 4*a*c<0)
        disp('nicio solutie reala')
    end
    if(b^2-4*a*c==0)
        disp('solutie dubla')
        x=-b/2*a
    end
    if(b^2-4*a*c >0)
        if(b^2-4*a*c> 10^3)
            x=-2*c/(b+sqrt(b^2-4*a*c))
            y=(-b-sqrt(b^2-4*a*c))/2*a
        end
        else
        x=(-b+sqrt(b^2-4*a*c))/2*a
        y=(-b-sqrt(b^2-4*a*c))/2*a
        
    end
end
end