function [baseline_model, P, tempAnnMeanAnomaly, movmeanavg] = StationModelProjections(station_number)

% StationModelProjections Analyze modeled future temperature projections at individual stations
%===================================================================
%
% USAGE:  [OUTPUTS] = StationModelProjections(INPUTS) <--update here
%
% DESCRIPTION:
%   **Add your description here**
%
% INPUT:
%    staton_number: Number of the station from which to analyze historical temperature data
%    **Describe any other inputs you choose to include**
%
% OUTPUT:
%    baseline_model: [mean annual temperature over baseline period
%       (2006-2025); standard deviation of temperature over baseline period]
%    P: slope and intercept for a linear fit to annual mean temperature
%       values over the full 21st century modeled period
%   **list any other outputs you choose to include**
%
% AUTHOR:   Sarah Ashebir and Gaby Reiter
%
% REFERENCE:
%    Written for EESC 4464: Environmental Data Exploration and Analysis, Boston College
%    Data are from the a global climate model developed by the NOAA
%       Geophysical Fluid Dynamics Laboratory (GFDL) in Princeton, NJ - output
%       from the A2 scenario extracted by Sarah Purkey for the University of
%       Washington's Program on Climate Change
%==================================================================

%% Read and extract the data from your station from the csv file
filename = ['model' num2str(station_number) '.csv'];
twentyfirst_stationdata = readtable(filename);

%% Calculate the mean and standard deviation of the annual mean temperatures
%  over the baseline period over the first 20 years of the modeled 21st
%  century (2006-2025) - if you follow the template for output values I
%  provided above, you will want to combine these together into an array
%  with both values called baseline_model
 %<-- (this will take multiple lines of code - see the procedure you
 %followed in Part 1 for a reminder of how you can do this)
NewYear=twentyfirst_stationdata.Year;
recentyears =find((NewYear>=2006)&(NewYear<= 2025));
baseline_mean = mean(twentyfirst_stationdata.AnnualMeanTemperature(recentyears));
tempStd = nanstd(twentyfirst_stationdata.AnnualMeanTemperature(recentyears));
baseline_model= [baseline_mean, tempStd];

%% Calculate the 5-year moving mean smoothed annual mean temperature anomaly over the modeled period

% future_year= find((NewYear>=2006)&(NewYear<= 2099))
% futuremean= mean(twentyfirst_stationdata.AnnualMeanTemperature(future_year))
% Note that you could choose to provide these as an output if you want to
% have these values available to plot.
 %<-- anomaly
tempAnnMeanAnomaly = twentyfirst_stationdata.AnnualMeanTemperature - baseline_mean
%annual temps-baselineaverage
%so all from 2025 and whats the differende between baseline and future
    %how does that change std
 %<-- smoothed anomaly
movmeanavg = movmean(tempAnnMeanAnomaly, 5)

%% Calculate the linear trend in temperature this station over the modeled 21st century period
%     %also calculate the slope and intercept of a best fit line just from
%     %1960 to the end of the observational period
% % indrecent = find(Year == recentyears);
P = polyfit(twentyfirst_stationdata.Year,tempAnnMeanAnomaly,1);
station_years= twentyfirst_stationdata.Year
end 
