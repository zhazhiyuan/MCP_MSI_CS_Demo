This demo is using to MCP-based MSI-CS reconstruction.

All MSI dataset can be downloaded at the following linking:

https://pan.baidu.com/s/1LHILMjpdktqWsFTw0RU2vQ 
Extract code：1234 

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

Please cite as follows:

@ARTICLE{Zha2023Multiple,
  author={Zha, Zhiyuan and Wen, Bihan and Yuan, Xin and Zhang, Jiachao and Zhou, Jiantao and Jiang, Xudong and Zhu, Ce},
  journal={IEEE Transactions on Cybernetics}, 
  title={Multiple Complementary Priors for Multispectral Image Compressive Sensing Reconstruction}, 
  year={2023},
  volume={},
  number={},
  pages={1-14},
  doi={10.1109/TCYB.2023.3251730}}
