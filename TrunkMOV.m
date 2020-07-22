function IndexMov=TrunkMOV(KS,Ttl)
% INPUT
% KS: GRF profile divided in epochs
% T: User defined threshold

% OUPUT
% IndexMov: Initiation event

% ROUTINE START
% 1-For each epoch calculate the standard deviation.
std_arr=stdonepoch(KS);

% 2-Moving average of the resulting epochs sequence
std_arr(2,:)=movmean(std_arr(2,:),10);

% 3-Define the Baseline reference as average standard deviation on the first ten epochs
BsLn=abs(mean(std_arr(2,1:10)));

% 4-Normalize the epochs sequence
std_arr(2,:)=std_arr(2,:)./BsLn;

% 5-The first index surpassing the threshold identify the beginning of the movement
IndexMov=std_arr(1,find(std_arr(2,:)>=Ttl,1));
