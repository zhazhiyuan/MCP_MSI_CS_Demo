
%====================================================================
% Compressive Image Recovery Using DCT 
%--------------------------------------------------------------------
function  Rec_im0    =   DCT_CIR( y, par, A, At )
ori_im      =    par.ori_im;
[h w]       =    size(ori_im);
im          =    At( y );
im          =    reshape(im,[h w]);

lamada      =    1.5;  % 1.8, 1.2-1.7
b           =    par.win*par.win;
D           =    dctmtx(b);

for k   =  1:1
    f      =   im;
    for  iter = 1 : 300   
        
        if (mod(iter, 50) == 0)
            if isfield(par,'ori_im')
                PSNR     =   csnr( f, par.ori_im, 0, 0 );                
                fprintf( 'DCT Compressive Image Recovery, Iter %d : PSNR = %f\n', iter, PSNR );
            end
        end
        
        for ii = 1 : 3
            fb        =   A( f(:) );
            f         =   f + lamada.*reshape(At( y-fb ), h, w);
        end        
        f          =   DCT_thresholding( f, par, D );
    end
    im     =  f;
end
Rec_im0   =  im;
end