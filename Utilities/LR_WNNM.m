function [Spa_Img, Spa_Wei]                    =                  LR_WNNM(img_noisy, Opts)

img_noisy                              =                  reshape (img_noisy, [Opts.h, Opts. w, Opts. b]);

E_Img                                  =                  img_noisy;
[r, c, b] = size(img_noisy);
N=r*c;
Y_noisy = reshape(img_noisy, N, b)';
p   = 1;  
[U_ss,~]=svd(Y_noisy,'econ');
U_ss(:,p+1:end) = []; 
Average =U_ss'*Y_noisy; 
Average = reshape(Average', r, c, p);
[CurPat, Mat]	=	Cub2Patch(E_Img, Average, Opts );   
%
[Neighbor_arr, Num_arr, Self_arr] =	NeighborIndex(Average, Opts);                                  
NL_mat  =  Block_matching(Mat, Opts, Neighbor_arr, Num_arr, Self_arr);    

EPat = zeros(size(CurPat));
W    = zeros(size(CurPat));
Temp = cell(length(Self_arr),1);
E_Temp = cell(length(Self_arr),1);
    %%
    for i = 1:length(Self_arr) 
        Temp{i} =  CurPat(:, NL_mat(1:Opts.patnum,i));                
    end
    %%
    parfor i = 1:length(Self_arr)  
    E_Temp{i}    =  NL_PatEstimation(Temp{i},Opts); 
    end
    %%
    for  i      =  1 : length(Self_arr)                                
     EPat(:,NL_mat(1:Opts.patnum,i))  = EPat(:,NL_mat(1:Opts.patnum,i)) + E_Temp{i};      
     W(:,NL_mat(1:Opts.patnum,i))     = W(:,NL_mat(1:Opts.patnum,i)) + ones(size(CurPat,1),size(NL_mat(1:Opts.patnum,i),1));
    end
    %%
    % Estimate the spatial patches
    [Spa_Img, Spa_Wei] = Patch2Cub( EPat, W, Opts.patsize, r, c, b );    
  %   Z = Spa_Img./Spa_Wei;
  
  
  Spa_Img      = reshape (Spa_Img, Opts.h * Opts.w, Opts.b);
  
  Spa_Wei      = reshape (Spa_Wei, Opts.h * Opts.w, Opts.b);
  
  
     
     
     
     
end

