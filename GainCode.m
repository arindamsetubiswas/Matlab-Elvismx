%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Arindam Biswas
% Date: 02/03/2021
% Description: This code parses data logged from ElvisMx(NI) text file into
% channelwise data. The time is converted to ms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear

%% change the text file name
[fileName,path] = uigetfile('.txt');
cd(path);
fid=fopen(fileName);
%% fomatting
% 1/27/2021  17:36:23.863670	2.069381E+0	1/27/2021  17:36:23.863680	2.051844E+0
data = textscan(fid,'%f %f %f ','HeaderLines',4);

fclose(fid);

Freq=data{1,1}; %parsing the time axis
% timeAxis=((timeAxis-timeAxis(1)))*1e3; %converting from us to ms
Gain=data{1,2}; %extracting the channel 1 data

figure(1)
semilogx(Freq,Gain,'LineWidth',1.5);
grid on
xlabel('Frequency (Hz)');
ylabel('Gain(dB)');
set(gca,'FontSize',15);
set(gca,'LineWidth',2);
