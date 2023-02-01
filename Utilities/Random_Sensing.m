function [A, At, P]   =  Random_Sensing( im, rate, model )
rand('seed',0);
[h w ch]     =    size(im);

if model==1
    N            =    h*w;
    K            =    round( N*rate );
    P            =    randperm(N)';
    q            =    randperm(N/2-1)+1;
    OMEGA        =    q(1:ceil(K))';
    A            =    @(z) A_f(z, OMEGA, P);
    At           =    @(z) At_f(z, N, OMEGA, P);
    P            =    OMEGA;
else    
    if rate==0.2
        factor   =    4.427;
    elseif rate==0.25
        factor   =    4;
    else
        factor   =    sqrt(1/rate)*2;
    end
    picks        =    RandMask_rect( double(h/factor), double(w/factor), h, w);
    A            =    @(z) A_fhp(z, picks, h, w);
    At           =    @(z) At_fhp(z, picks, h, w);
    P            =    picks;
end
end