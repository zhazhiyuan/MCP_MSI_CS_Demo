clc
clear
m_20=0; 
m_30=0;    
m_40=0;  
m_10=0;  
m_50=0; 
m_60=0; 
m_70=0; 
m_80=0; 
m_90=0; 


All_data_Results_2_90 = cell(1,200);

All_data_Results_2_80 = cell(1,200);
All_data_Results_2_20 = cell(1,200);
All_data_Results_2_30 = cell(1,200);
All_data_Results_2_40 = cell(1,200);
All_data_Results_2_10 = cell(1,200);
All_data_Results_2_50 = cell(1,200);
All_data_Results_2_60 = cell(1,200);
All_data_Results_2_70 = cell(1,200);

for i = 1
ImageNum =i;

switch ImageNum
    
          case 1
                filename = 'real_and_fake_apples_ms_256';

end

for j  =  6

randn ('seed',0);

filename




Ratio_Num            =  [0.01, 0.02, 0.05, 0.10, 0.15, 0.2, 0.3, 0.4];


ratio                =  Ratio_Num (j)


if  ratio <=0.01
    
[filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test (filename, ratio); 
 
 m_90= m_90+1;
 
 s=strcat('A',num2str(m_90));
 
 All_data_Results_2_90{m_90}= {filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s};
 
 xlswrite('MCP_MSI_CS_CAVE_ratio_0.01.xls', All_data_Results_2_90{m_90},'sheet1',s);
 
 save MCP_MSI_CS_CAVE_ratio_001 All_data_Results_2_90
 
 
elseif  ratio <=0.02
    
    
[filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test (filename, ratio);  
 
 m_10= m_10+1;
 
 s=strcat('A',num2str(m_10));
 
 All_data_Results_2_10{m_10}= {filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s};
 
 xlswrite('MCP_MSI_CS_CAVE_ratio_0.02.xls', All_data_Results_2_10{m_10},'sheet1',s);
 
 save MCP_MSI_CS_CAVE_ratio_002 All_data_Results_2_10
 

 
elseif  ratio <=0.05
    
     
[filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test (filename, ratio);  
 
 m_20= m_20+1;
 
 s=strcat('A',num2str(m_20));
 
 All_data_Results_2_20{m_20}= {filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s};
 
 xlswrite('MCP_MSI_CS_CAVE_ratio_0.05.xls', All_data_Results_2_20{m_20},'sheet1',s);
 
save MCP_MSI_CS_CAVE_ratio_005 All_data_Results_2_20
 
 elseif  ratio <= 0.10
     
[filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test (filename, ratio);  
 
m_30= m_30+1;
 
 s=strcat('A',num2str(m_30));
 
 All_data_Results_2_30{m_30}= {filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s};
 
 xlswrite('MCP_MSI_CS_CAVE_ratio_0.10.xls', All_data_Results_2_30{m_30},'sheet1',s);
 
save MCP_MSI_CS_CAVE_ratio_010 All_data_Results_2_30
 
 elseif  ratio <=0.15
     
[filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test (filename, ratio);  
 
m_40= m_40+1;
 
 s=strcat('A',num2str(m_40));
 
 All_data_Results_2_40{m_40}= {filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s};
 
 xlswrite('MCP_MSI_CS_CAVE_ratio_0.15.xls', All_data_Results_2_40{m_40},'sheet1',s);
 
save MCP_MSI_CS_CAVE_ratio_015 All_data_Results_2_40

  elseif  ratio <=0.2
      
      
[filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test (filename, ratio);  
 
m_50= m_50+1;
 
 s=strcat('A',num2str(m_50));
 
 All_data_Results_2_50{m_50}=  {filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s};
 
xlswrite('MCP_MSI_CS_CAVE_ratio_0.2.xls', All_data_Results_2_50{m_50},'sheet1',s);
 
save MCP_MSI_CS_CAVE_ratio_02 All_data_Results_2_50
 
  elseif  ratio <=0.3
      
[filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test (filename, ratio);  

m_60= m_60+1;
 
 s=strcat('A',num2str(m_60));
 
 All_data_Results_2_60{m_60}= {filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s};
 
 xlswrite('MCP_MSI_CS_CAVE_ratio_0.3.xls', All_data_Results_2_60{m_60},'sheet1',s);
 
 save MCP_MSI_CS_CAVE_ratio_03 All_data_Results_2_60

 
 elseif  ratio <=0.4
     
[filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s]     =  MCP_MSI_CS_Test (filename, ratio);  
 
m_70= m_70+1;
 
 s=strcat('A',num2str(m_70));
 
 All_data_Results_2_70{m_70}= {filename, ratio, PSNR_Final,FSIM_Final,SSIM_Final, ERGAS_Final, SAM_Final, Time_s};
 
 
 xlswrite('MCP_MSI_CS_CAVE_ratio_0.4.xls', All_data_Results_2_70{m_70},'sheet1',s);   
 
 save MCP_MSI_CS_CAVE_ratio_04 All_data_Results_2_70
 
end

 clearvars -except filename i m_20 All_data_Results_2_20 m_30 All_data_Results_2_30 m_40 All_data_Results_2_40...
    m_10 All_data_Results_2_10 m_50 All_data_Results_2_50 m_60 All_data_Results_2_60 m_70 All_data_Results_2_70 ...
    m_80 All_data_Results_2_80 m_90 All_data_Results_2_90 
end
    
   clearvars -except filename  m_20 All_data_Results_2_20 m_30 All_data_Results_2_30 m_40 All_data_Results_2_40...
    m_10 All_data_Results_2_10 m_50 All_data_Results_2_50 m_60 All_data_Results_2_60 m_70 All_data_Results_2_70 ...
    m_80 All_data_Results_2_80  m_90 All_data_Results_2_90 
end




         