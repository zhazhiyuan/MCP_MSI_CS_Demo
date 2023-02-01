function [E_Temp] = NL_PatEstimation(Temp, Opts)                            % For each keypatch group
 
            M_Temp  =   repmat(mean( Temp, 2 ),1,Opts.patnum);
            Temp    =   Temp - M_Temp;
            E_Temp 	=   WNNM(Temp, Opts.lambda) + M_Temp; 
end

function  [X] =  WNNM( Y, C)
    [U,SigmaY,V] = svd(full(Y),'econ');    
    PatNum       = size(Y,2);
    TempC  = C*sqrt(PatNum)*2;
    [SigmaX,svp] = ClosedWNNM(SigmaY,TempC,eps); 
    X =  U(:,1:svp)*diag(SigmaX)*V(:,1:svp)';     
end

function [SigmaX,svp]=ClosedWNNM(SigmaY,C,oureps)
temp=(SigmaY-oureps).^2-4*(C-oureps*SigmaY);
ind=find (temp>0);
svp=length(ind);
SigmaX=max(SigmaY(ind)-oureps+sqrt(temp(ind)),0)/2;
end