function [rec_im, k, Err_or]       =                 MCP_MSI_CS_Reconstruction( par, Opts, A, At )


y                                    =                         par.y; % 27900*1

rec_im0                              =                         DCT_CIR( y, par, A, At );



rec_im                               =                         rec_im0; % 90000*31 % Initalization;

AtY                                  =                         At(y); % 2790000*1

[h, w]                               =                        size( rec_im );


% parameters
mu                                   =                         Opts. mu;
alpha                                =                         Opts. alpha;
beta                                 =                         Opts. beta;
%

J                                    =                         zeros( size(rec_im) );   %J : multiplier for D

G                                    =                         zeros( size(rec_im) );   %G : multiplier for WNNM

 HPNP_Results                         =                             cell (1, Opts. Iters);   


for k                                =                         1 : Opts. Iters
    
    
    f                                =                         rec_im;   % 90000*31
    

        
   % Deep Prior
   
      D                             =                  FFD_Net_Denoiser ((f + J/alpha), Opts); % 90000*31
      
   % Low-Rank    
   
      [rim, wei]                    =                  LR_WNNM(f, Opts);  
      
   % Z subproblem
      
      rim                           =                 (mu*rim+beta*f + G)./(mu*wei+beta); % rim is 90000*31
      
  % X subproblem    
     
      b                             =                 AtY + beta * rim(:) + alpha* D(:) - J(:) - G(:);
            
      [X, ~]                       =                 pcg( @(x) Afun(x, At, A, alpha, beta), b, 0.5E-6, 400, [], [], f(:));  
      
%      [X,~]                         =              pcg( @(x) Afun(x, At, A, beta, D(:), alpha), b, 0.5E-6, 400, [], [], f(:));
       
      f                             =                 reshape(X, h, w);  

 
     J                              =                 J + 1.05*alpha*(f - D);% 1.1  
     
      
     G                              =                 G + 1.05*beta*(f - rim);% 1.1       
    
     rec_im                         =                  f;
     
     
  if isfield(par,'ori_im')
    PSNR(k)     =   csnr( rec_im, par.ori_im, 0, 0 );
    SSIM      =  cal_ssim( rec_im, par.ori_im, 0, 0 );
  end

    fprintf( 'Iter = %d, PSNR = %2.2f\n', k, PSNR(k));  
    
    HPNP_Results{k}            =                        rec_im;
    
    
    if k>30
        
        
           Err_or_k      =  norm(abs(HPNP_Results{k}) - abs(HPNP_Results{k-1}),'fro')/norm(abs(HPNP_Results{k-1}), 'fro');
    
    if (HPNP_Results{k} - HPNP_Results{k-2} <=0) || (Err_or_k < Opts. Err_or)
        break;
    end
    end

    
end


end

