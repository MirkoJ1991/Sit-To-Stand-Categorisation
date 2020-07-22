function [Fx,Fy,Fz,COP, Bott,time]=ImportKS(Data)
% Function to extract Fx Fy Fz COP and time as linear combination of 8
% inputs channels from DAQ board.
% INPUT
% Data: table that contains all the DAQ data
% OUTPUT
% Fx/Fy/Fz: Force components
% Bott: Electronic switch signal
% time: Time data

% 1-Extract data
% //Force
force=Data.data.data.data; 
% //Time array
time=Data.data.data.time; 
% //Distance of the axis of sensor from the y-axis -- provided by Kistler Technical Data
a=Data.a;
% //Distance of the axis of sensor from the x-azis -- provided by Kistler Technical Data
b=Data.b;
% //Distance of surface of force plate from the x-,y-plane -- provided by Kistler Technical Data
azo=Data.azo;

% 2-Normalization of Force data
fy14=force(:,1)/Data.SensY14;
fx34=force(:,2)/Data.SensX34;
fx12=force(:,3)/Data.SensX12;
fz3=force(:,4)/Data.SensZ3;
fz2=force(:,5)/Data.SensZ2;
fz1=force(:,6)/Data.SensZ1;
fy23=force(:,7)/Data.SensY23;
fz4=force(:,8)/Data.SensZ4;

% 3-Linear combination of channels 
Fx=fx12+fx34;
Fy=fy14+fy23;
Fz=fz1+fz2+fz3+fz4;

% 4-Force Momentum 
Mx=b*(fz1+fz2-fz3-fz4);
My=a*(-fz1+fz2+fz3-fz4);

% 5-Centre of Pressure
COP=[(Fx*azo-My)./Fz,(Fy*azo+Mx)./Fz];

% 6-Electronic Switch
Bott=force(:,9); 