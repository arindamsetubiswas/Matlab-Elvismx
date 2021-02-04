%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Arindam Biswas
% Date: 02/03/2021
% Description: This code parses data logged from ElvisMx(NI) text file into
% channelwise data. The time is converted to ms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear

%% change the text file name
fid = fopen('IVData.txt');

%% fomatting
% 1/27/2021  17:36:23.863670	2.069381E+0	1/27/2021  17:36:23.863680	2.051844E+0
data = textscan(fid,'%d %c %d %c %d %d %c %d %c %f %f %d %c %d %c %d %d %c %d %c %f %f','HeaderLines',6);

fclose(fid);

timeAxis=data{1,10}; %parsing the time axis
timeAxis=((timeAxis-timeAxis(1)))*1e3; %converting from us to ms
Ch1=data{1,11}; %extracting the channel 1 data
Ch2=data{1,22}; % extracting the channel 2 data

figure(1)
plot(timeAxis,Ch1,timeAxis,Ch2,'LineWidth',1.5);
xlabel('Time(ms)');
ylabel('Voltage (V)');
legend('Ch 01','Ch 02');
set(gca,'FontSize',15);

figure(2)
plot(Ch1,Ch2,'LineWidth',1.5);
xlabel('Channel 1');
ylabel('Channel 2');
legend('X-Y Plot');
set(gca,'FontSize',15);