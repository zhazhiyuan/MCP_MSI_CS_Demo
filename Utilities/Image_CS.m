function  [Rec_im, PSNR, SSIM]    =  Image_CS( ori_im, s_model, rate, L)
randn('state',0);
rand('state',0);

par               =    Set_parameters(rate, L, s_model);
par.s_model       =    s_model;

[A, At, P]        =    Compressive_sensing(ori_im, rate, L, s_model);
par.picks         =    P;
par.y             =    A(ori_im(:));
par.ori_im        =    ori_im;   % For computing PSNR only
disp( sprintf('The sensing rate: %f\n', length(P)/(prod(size(ori_im)))) );

[Rec_im PSNR SSIM]      =   HyNLRMR_CS_Reconstruction( par, A, At ); 

end






