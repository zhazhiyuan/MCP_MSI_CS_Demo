This demo is using to MCP-based MSI-CS reconstruction.

When you use this demo, please first load software package "matconvnet", and make sure
run the function "vl_compilenn.m" succesfully.

Later, you can directly run the function "MCP_MSI_CS_Demo.m" 
Currently, this demo can be directly runned by using any CPU.


Note that:

If you cannot conduct the function "vl_compilenn.m" succesfully.

Please do the following operator:

In function "FFD_Net_Denoiser.m", 
please transform " res     =   vl_ffdnet_concise(net, input);"
into "res    = vl_ffdnet_matlab(net, input);".

but this operator is very slow.
