function [A, At, P]   =  Radial_Line_Sensing( im, L )
rand('seed',0);
[h w ch]            =    size(im);

if 1
    aperture=(pi/180)*180;    % aperture encompassing all scanning angles (aperture<pi is limited angle)
    direction=(pi/180)*0;     % direction of the scanning beam (middle axis)
else
    aperture=(pi/180)*90;     % aperture encompassing all scanning angles (aperture<pi is limited angle)
    direction=(pi/180)*45;    % direction of the scanning beam (middle axis)    
end
S       =    LineMaskLimitedAngle(L,h,aperture,direction);
P       =    find(S);
A       =    @(z) A_fhp(z, P, h, w);
At      =    @(z) At_fhp(z, P, h, w);
end