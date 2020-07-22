function [SeatOff,SeatOn]=Bottom_Transition(Switch,V)
% INPUT
% Switch: Electronic switch signal
% V: Threshold voltage (usually -4)

% OUTPUT
% SeatOff / SeatOn
 
% ROUTINE START
% 1-Signal over threshold voltage is setted at 0
Switch(Switch>V)=0; 
% 2-Signal under threshold voltage is setted at -5
Switch(Switch<V)=-5;
% 3-Differential mask 
DerSwitch=diff(Switch);
SeatOff=find(DerSwitch<=-4,1,'first')+1; 
SeatOn=find(DerSwitch>-(-4),1,'last');
