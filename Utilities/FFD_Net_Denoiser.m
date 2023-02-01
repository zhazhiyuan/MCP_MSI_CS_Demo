function  [im_denoised]       =  FFD_Net_Denoiser (input, Opts)

randn ('seed',0);

input                         =                single(input)/255;


input                         =                  reshape(input, Opts.h, Opts.w*Opts. b);


inputNoiseSigma               =                      Opts.Thr;

format compact;
global sigmas;


load(fullfile('models','FFDNet_gray.mat'));

net               =                     vl_simplenn_tidy(net);

    

 %   noise = imageNoiseSigma/255.*randn(size(label));
 %   input = single(label + noise);
    
    
sigmas = inputNoiseSigma/255; 
    
 %res    = vl_ffdnet_matlab(net, input); % use this if you did  not install matconvnet; very slow
 
 %res    = vl_simplenn(net,input,[],[],'conserveMemory',true,'mode','test'); % matconvnet default
 
res     =   vl_ffdnet_concise(net, input);    % concise version of vl_simplenn for testing FFDNet
    
output   =  res(end).x;
    
    
    

    
    im_denoised   =  double(output*255);
    
    
    im_denoised   = reshape(im_denoised, Opts.h* Opts.w, Opts. b);

 


end

