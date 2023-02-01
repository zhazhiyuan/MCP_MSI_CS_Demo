function Opts = MCP_MSI_CS_parameters (rate)

Opts.patsize              =                        5;    % Patch size

Opts.patnum               =                        50;    

Opts.step                 =                        4;

Opts.SearchWin            =                       50;


Opts.Iters                =                        200;



if rate<=0.02
    
Opts. mu                  =                        0.001;

Opts. alpha               =                        0.001;

Opts. beta                =                         0.0004;

Opts. lambda              =                         55*sqrt(2);

Opts. Thr                 =                         25;

Opts. Err_or              =                        0.0017;


elseif rate<=0.05  
    
    
Opts. mu                  =                       0.001; 

Opts. alpha               =                       0.0008;

Opts. beta                =                       0.0008;  

Opts. lambda              =                      32*sqrt(2); 

Opts. Thr                 =                        25;

Opts. Err_or              =                       0.00038;


    
elseif rate<=0.1
    
Opts. mu                  =                       0.001;
    
Opts. alpha               =                      0.0004; 

Opts. beta                =                      0.0008; 

Opts. lambda              =                       9*sqrt(2);

Opts. Thr                 =                       25; 
    
Opts. Err_or              =                      0.0005;


elseif rate<=0.15 
    
Opts. mu                  =                        0.001;
    

Opts. alpha               =                       0.0006; 

Opts. beta                =                       0.0008;   

Opts. lambda              =                       8*sqrt(2); 

Opts. Thr                 =                       20; 

Opts. Err_or              =                      6.9E-06;


elseif rate<=0.2    
    
Opts. mu                  =                     0.001; 
    

Opts. alpha               =                    0.0006;   

Opts. beta                =                    0.0009;   

Opts. lambda              =                    4*sqrt(2); 

Opts. Thr                 =                       20;

Opts. Err_or              =                      0.0002;

 
elseif rate<=0.3
    
Opts. mu                  =                        0.001; 
    

Opts. alpha               =                        0.0006;  

Opts. beta                =                       0.004; 

Opts. lambda              =                        2*sqrt(2); 

Opts. Thr                 =                       20;  

Opts. Err_or              =                       0.001;


else
    
Opts. mu                  =                      0.001;
    

Opts. alpha               =                      0.0005;

Opts. beta                =                      0.005; 

Opts. lambda              =                      0.3*sqrt(2);

Opts. Thr                 =                     20;

Opts. Err_or              =                      0.0008;
    
    
end
end

