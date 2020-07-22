function EpForce=Epochs_Force(Force,epochs,fsamp)
% Function to divide in time epochs of fixed lenghts.
% INPUT
% Force: Forcec signal filtered and resampled
% epochs : lenght of time epochs (in s) 
% fsamp: sample frequency 
% OUTPUT
% EpForce: Force signal divided in epochs.
 
% Calculated how many samples are in an epoch at a discrete fsamples
nsamples=fix(fsamp*epochs);
% Force signal divided in epochs
EpForce=buffer(Force,nsamples,0,'nodelay');
