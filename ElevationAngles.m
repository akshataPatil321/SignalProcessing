clc
clear all 
close all

% Monitoring 24 hours at Sweden 
startTime = datetime(2023, 04, 28, 00, 00, 00, 'TimeZone', 'UTC');
stopTime = startTime + hours(24);
sampleTime = 60;
sc = satelliteScenario(startTime, stopTime, sampleTime);
% Testing on GPS:
sat = satellite(sc, "Mixed_TLE.txt");
% show(sat);
for i = 1:length(sat)
    ele(i) = orbitalElements(sat(i));
end
% Adding in a ground station from London:
name = ["Durand"];
lat = [37.427239];
long = [-122.173269];
gs = groundStation(sc, "Name", name, "Latitude", lat, "Longitude", long);

%Monitoring Elevation Angles from 0:23:00 to 03:10:00
minutes = 1:(24*60);
time = startTime + minutes./1440;
elev = zeros(length(minutes), length(sat));

for satIdx = 1:length(sat)
    for idx = 1:length(minutes)
        [~, elev(idx, satIdx), ~] = aer(gs, sat(satIdx), time(idx));
    end
end
