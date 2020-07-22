function [Standing,Sitting]=SteadyStandingPoints(F,fs,ep,SitOff,SitOn,Tst)
% INPUT
% F: Force signal
% fs: Sample frequency (50 Hz)
% ep: time epoch (0,1 s)
% SeatOff: Seat Off event
% SeatOn: Seat On event
% T: Threshold

% OUTPUT
% SeatOff / SeatOn

% ROUTINE START
% 1-Calculate number of samples per epoch
samples=fix(fs*ep);
% 2-Time array from Seat Off to Sit On (in samples)
t=SitOff:SitOn;
% 3-Trimming force from stand to sit
stand2sit=F(SitOff:SitOn);
% 4-Division in time epochs 
bstdF=std(buffer(stand2sit,samples,0,'nodelay'));
bavgT=mean(buffer(t,samples,0,'nodelay'));
% 5-Middle point of the stable stance between Sit Off and Sit On
midpoint=round(length(bstdF)/2);
% 6-Calculating the baseline
baseline=mean(bstdF(midpoint-10:midpoint+10));
bstdF=bstdF/baseline;
mask=movmean(bstdF,10)>Tst;
Standing=bavgT(find(mask==0,1,'first'));
Sitting=bavgT(find(mask==0,1,'last'));


