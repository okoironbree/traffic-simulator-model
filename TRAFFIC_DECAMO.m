% traffic_decamo
% single-lane cellular automaton traffic simulation 
% foundation for a larger Dublin road network. Cars will move in a
% single-laned looped road, following four simple rules 
% Life like 'phantom jams' will appear naturally.
% author ; Brigid Okoiron





% Initializing parameters
roadLength = 100;
numVehicle = 50;
v_Max = 5;
probBreak = 0.4; % chances of car slowing down, reducing human error
numSteps = 300; % how many timesteps to stimulate 

% to place cars at random, everyone starts stationary in non-overlapping
% posititons in slots on road

positions = sort(randperm(roadLength, numVehicle) - 1); % places no two cars in same place 
speeds= zeros(1, numVehicle);

% Creating blank canvas to present data in a circle form and not just as an
% end of road stimulation
f = figure('Color','white');
axis equal; % setting x and y to simutaneously have the same scale
axis off;
hold on; % not erasing data, readding new plots 

%XXX Come BACK FOR LATER SETTUP XXXX
center = [0,0]; % Dublin center point
radius = (2000); %2000 meters, 40km diameter covering a realistic Greater Dublin Zone 

carPlot = scatter(zeros(1,numVehicle), zeros(1,numVehicle), 65, speeds, "filled");

colormap(flipud(autumn));% reversing colour map, r = stopped/slowing vehicles , y = fast vehicles
c = colorbar ;
clim([0 v_Max]);
ylabel(c,'Speed(cells/step)', 'FontSize',12 );

title('Traffic Flow Simulation - Nagel-Schreckenberg Model');

% loop
for step = 1: numSteps

    [positions, sortIdx] = sort(positions); % gap between vehicles rearrange cars and tells us how it has been reordered 
    speeds= speeds(sortIdx); % vehicle speeds arranged in same way to be reordered 
    newSpeeds = speeds; % computing based on the OLD states 

    for i = 1: numVehicle
        % Update speed based on the rules of the model
        % Find gap to the car ahead 
        nextIdx = mod(i, numVehicle) + 1; % next car wraps to car 1 
        % Update speed based on the gap of car ahead
        gap = mod(positions(nextIdx)- positions(i) - 1, roadLength);
       
        % Rule 1--- Acceleration
        newSpeeds(i) = min(speeds(i) + 1, v_Max);

        % Rule 2--- Deceleration
        
            newSpeeds(i) = min(newSpeeds(i), gap);
        

        % Rule 3--- Randomization
        if rand() < probBreak && newSpeeds(i) > 0
             newSpeeds(i) = newSpeeds(i)- 1;
        end
        end
        speeds = newSpeeds;
        positions =mod(positions + speeds, roadLength); % move every car using fresh speeds
        angles = positions/ roadLength * 2 * pi;
        set(carPlot, 'XDATA', cos(angles),'YData', sin(angles), 'CData', speeds);% data now plotted on circle 
        drawnow % carPlot redraws new positions at each frame

end








 




