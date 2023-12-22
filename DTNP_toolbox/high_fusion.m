function [cp,map]=high_fusion(matrixA,matrixB)

fire_timesA = DTNP(SF(abs(matrixA)),200);
fire_timesB = DTNP(SF(abs(matrixB)),200);
map=(fire_timesA >= fire_timesB);
cp=map.*matrixA+~map.*matrixB;