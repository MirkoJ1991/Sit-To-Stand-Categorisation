function [Fx_cut,Fy_cut,Fz_cut,Bott_cut,time_cut]=CutKS(Fx,Fy,Fz,Bott,time,fsamp,delay)
% Function to cut the first part of the Kistler signal from the force signals for an
% amount of samples equal to fsamp*delay
% INPUT
% Fx/y/z: Force components 
% Bott: Signal from electronic switch
% time: Time array
% fsamp: KISTLER sample frequency
% delay: delay in seconds
% OUTPUT
% Fx/y/z_cut: Cut force components 
% Bott_cut: Cut signal from electronic switch
% time_cut: Cut time array

% //Synchronized force components
Fx_cut=Fx(fsamp*delay:end);
Fy_cut=Fy(fsamp*delay:end);
Fz_cut=Fz(fsamp*delay:end);
Bott_cut=Bott(fsamp*delay:end);

% //Recreate the time array
last_s=((length(time)-fsamp*delay)+1)/fsamp; time_cut=linspace(0,last_s,length(Fx_cut)); 

