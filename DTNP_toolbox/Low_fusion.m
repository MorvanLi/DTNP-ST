function [cp,map]=Low_fusion(matrixA,matrixB)
%%
SML_A=SML(abs(matrixA));
SML_B=SML(abs(matrixB));
%%
DTNP_A=DTNP(SML_A,200);
DTNP_B=DTNP(SML_B,200);
map=(DTNP_A>=DTNP_B);
%%
cp=map.*matrixA+~map.*matrixB;