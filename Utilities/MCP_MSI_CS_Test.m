function [filename, rate, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test  (filename, rate)

randn ('seed',0);


fn                                     =                      [filename, '.mat'];

load (fn);

ori_im                                 =                       im2double(NRD)*255; 


[h, w, b]                              =                      size(ori_im);

ori_im                                 =                      reshape(ori_im, h * w, b);

%%%DCT_Initalization Parameters%%%%
par                                    =                     DCT_CS_parameters(rate);


%%%HPnP Parameters%%%%

Opts                                   =                     MCP_MSI_CS_parameters(rate);

Opts. h                                =                     h;

Opts. w                                =                     w;

Opts. b                                =                     b;

[A, At, P]                             =                     Compressive_sensing(ori_im, rate, 2, 1);

par.y                                  =                     A(ori_im(:));

par.ori_im                             =                     ori_im;   % For computing PSNR only

disp( sprintf('The sensing rate: %f\n', length(P)/(prod(size(ori_im)))) );

time0                                  =                      clock;

[Rec_im]                               =                    MCP_MSI_CS_Reconstruction( par, Opts, A, At ); 



Time_s                                 =                (etime(clock,time0));


Rec_im                                 =                reshape(Rec_im, h, w, b);

ori_im                                 =                reshape(ori_im, h, w, b);

[PSNR_Final, SSIM_Final, FSIM_Final, ERGAS_Final, SAM_Final]    =      MSIQA(ori_im, Rec_im);


[PSNR_all]                             =                          evaluate1(ori_im,Rec_im);


kk =b;



 if  rate== 0.01
     
     
     for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));      
 
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.01_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     
   xlswrite(Final_CS_2,PSNR_all)

elseif  rate== 0.02
     
     
     for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));      
 
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.02_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     
   xlswrite(Final_CS_2,PSNR_all)
% 
% 
 elseif rate== 0.05
% 
     for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));     
 
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.05_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     xlswrite(Final_CS_2,PSNR_all)   
     
     
     
 elseif rate== 0.1
%     
     for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));     
 
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.1_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     xlswrite(Final_CS_2,PSNR_all)   
     
     
     
% 
 elseif rate== 0.15
%     
     for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));       
 
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.15_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     xlswrite(Final_CS_2,PSNR_all)   
     
     
     
     
     
 elseif rate== 0.2
%     
     for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));       
 
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.2_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     xlswrite(Final_CS_2,PSNR_all)   
     
     
     
     
 elseif rate== 0.3
%     
     for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));      
 
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.3_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     xlswrite(Final_CS_2,PSNR_all)   
     
 elseif rate== 0.4
%     
     for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));   
       
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.4_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     xlswrite(Final_CS_2,PSNR_all)   
     
     
     
     
 else
%     
    for j = 1:kk
         
       psnr_e =  csnr (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       ssim_e =  cal_ssim (double(Rec_im(:,:,j)), double (ori_im(:,:,j)),0,0);
       
       fsim_e =  FeatureSIM (double(Rec_im(:,:,j)), double (ori_im(:,:,j)));      
 
       Final_denoisng= strcat(filename,'_MCP_CS_','_ratio_',num2str(rate),'_i_',num2str(j),'_PSNR_',num2str(psnr_e),'_FSIM_',num2str(fsim_e),'_SSIM_',num2str(ssim_e),'.png');
 
       imwrite(uint8((Rec_im(:,:,j))),strcat('./0.5_Result/',Final_denoisng));
       
     end
     
     Final_CS_2= strcat(filename,'_MCP_CS','_ratio_',num2str(rate),'.xls');
     
     xlswrite(Final_CS_2,PSNR_all)   
     
% 
 end


end

