
%% Add a comment at the top with the names of all members of your group
% Gaby and Sarah
%% 1. Load in a list of all 18 stations and their corresponding latitudes and longitudes
load GlobalStationsLatLon.mat

%% 2. Calculate the linear temperature trends over the historical observation period for all 18 station
% You will do this using a similar approach as in Part 1 of this lab, but
% now implementing the work you did last week within a function that you
% can use to loop over all stations in the dataset

%Set the beginning year for the more recent temperature trend
RecentYear = 1960; %you can see how your results change if you vary this value

%Initialize arrays to hold slope and intercept values calculated for all stations
% its only holding an array from one file and not all of them

P_all = NaN(length(sta),2); 
P_recent= NaN(length(sta),2);

for i=1:18
[P_all(i,1:2), P_recent(i,1:2)] = StationTempObs_LinearTrend(sta(i), RecentYear);
end 

%example of how to do this for the full observational period
%<-- do the same thing just for values from RecentYear to today

%Use a for loop to calculate the linear trend over both the full
%observational period and the time from RecentYear (i.e. 1960) to today
%using the function StationTempObs_LinearTrend
%<--

%% 3a. Plot a global map of station locations
%Example code, showing how to plot the locations of all 18 stations
figure(1); clf
worldmap('World')
load coastlines
plotm(coastlat,coastlon)
plotm(lat,lon,'m.','markersize',15)
title('Locations of stations with observational temperature data')




%% 3b. Make a global map of the rate of temperature change at each station
% Follow the model from 3a, now using the function scatterm rather than plotm
%to plot symbols for all 18 stations colored by the rate of temperature
%change from RecentYear to present (i.e. the slope of the linear trendline)


figure(2); clf
worldmap('World')
load coastlines
plotm(coastlat,coastlon)
matrix_p_recent= P_recent(:,1)'
scatterm(lat, lon, 100, matrix_p_recent, 'filled')
plot(P_recent,sta)
title('Rate of Temperature Change from 1960 to Present (�C per Decade)')
colorbar 'EastOutside'


    
%% Extension option: again using scatterm, plot the difference between the
%local rate of temperature change (plotted above) and the global mean rate
%of temperature change over the same period (from your analysis of the
%global mean temperature data in Part 1 of this lab).
%Data visualization recommendation - use the colormap "balance" from the
%function cmocean, which is a good diverging colormap option
%***********************
%Do we need to do this? Did we calculate the gloabl mean tempature change?

%% 4. Now calculate the projected future rate of temperature change at each of these 18 stations
% using annual mean temperature data from GFDL model output following the
% A2 scenario (here you will call the function StationModelProjections,
% which you will need to open and complete)

%Use the function StationModelProjections to loop over all 18 stations to
%extract the linear rate of temperature change over the 21st century at
%each station
% Initialize arrays to hold all the output from the for loop you will write
% below

P = NaN(length(sta),2); 
baseline_model= NaN(length(sta),2);
% movmeanavg= NaN(length(year),length(sta(i));
tempAnnMeanAnomaly=(94:1);

for i=1:18
[baseline_model(i,1:2), P(i,1:2),] = StationModelProjections(sta(i))
end 
% tempAnnMeanAnomaly(i,94:1)

% Write a for loop that will use the function StationModelProjections to
% extract from the model projections for each station:
% 1) the mean and standard deviation of the baseline period
% (2006-2025) temperatures, 2) the annual mean temperature anomaly, and 3)
% the slope and y-intercept of the linear trend over the 21st century
%<--
%try running the loop for one and move on from there 
%and then do the rest 
%% 5. Plot a global map of the rate of temperature change projected at each station over the 21st century

figure(3); clf
worldmap('World')
load coastlines
plotm(coastlat,coastlon)
matrix_p= P (:,1)'
scatterm(lat, lon, 100, matrix_p, 'filled')
plot(P,sta)
title('Rate of Projected Temperature Change from 2006 to 2099 (�C per Decade)')
colorbar 'EastOutside'



%scale and color difference doesnt match whats online
%think it could be our function thats messed up because are factors that
%are 2006-2025 and 2006-2099 mixed up
%baseline model, why std there too, im confused
%how to switch color bar 
%P clearly isnt right and tried to investigate and change 
%% 6a. Plot a global map of the interannual variability in annual mean temperature at each station
%as determined by the baseline standard deviation of the temperatures from
%2005 to 2025
%<--STD of annual mean temp

%% 6b-c. Calculate the time of emergence of the long-term change in temperature from local variability
%There are many ways to make this calcuation, but here we will compare the
%linear trend over time (i.e. the rate of projected temperature change
%plotted above) with the interannual variability in the station's
%temperature, as determined by the baseline standard deviation

%Calculate the year of long-term temperature signal emergence in the model
%projections, calculated as the time (beginning from 2006) when the linear
%temperature trend will have reached 2x the standard deviation of the
%temperatures from the baseline period
%<--

%Plot a global map showing the year of emergence
%<write this out in words first and equations on paper 
