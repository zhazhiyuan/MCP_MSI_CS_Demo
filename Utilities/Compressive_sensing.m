function [A, At, P]   =  Compressive_sensing(im, rate, L, model)
if model==1 || model==2
    [A, At, P]    =  Random_Sensing(im, rate, model);
elseif model==3
    [A, At, P]    =  Radial_Line_Sensing(im, L);
end
end