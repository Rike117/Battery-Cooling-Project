clear;
clc;

%% User Input
num_batteries = 5; % Number of batteries
num_chargers = 2;  % Number of Chargers    
min_flight_time = 5; %hours
Charger_Cost = 39;
Battery_Cost = 149;
Work_Cost = 100;
Total_Cost = (num_batteries*Battery_Cost)+(num_chargers*Charger_Cost)+(Work_Cost);


%% Create Battery Array
for i = 1:num_batteries  % creating a battery array to run code for any number of batteries
    bat_array(i) = batteryClass(90,40,22); %Set battery to charge 90 mins ...
                                           %cool for 40 mins ...
                                           %use for 22 mins
end

bat_data = {}; %Store the battery use visualization chart here

char1 = Charger(); %Create one charger
char2 = Charger(); % creating a second charger


%% Setup Simulation
min_flight_time = ceil(min_flight_time*60/bat_array(1).time_use)* ... 
    bat_array(1).time_use/60*.99; %round to the nearest battery duration max
sim_flag = true;
next_ready_battery = 0; % These variables are used to describe at what point in time the status of the batteries should change 
battery_in_use = 0;
next_cool_battery = 0;
charging_battery = 0;
drone_in_use = false;
total_flight_time = 0;
i = 0;

%%  Simulation Loop
while sim_flag == true
    i = i+1;
    current_round = 8;
    next_ready_battery = 0;
    
    next_cool_battery = 0;
    
    for b=1:num_batteries  % Stating that the number of batteries in the array should start at 1
        bat_array(b).updateBattery();
        if (bat_array(b).getStatus() == BatStatus.Ready) % This section is stating that if the status of a battery in the array is "Ready" that means that the use count is less than the current round count...
            if bat_array(b).use_count<current_round
                current_round = bat_array(b).use_count;
                next_ready_battery = b;
            end
        end
        if (bat_array(b).getStatus()==BatStatus.Cooled)
            next_cool_battery = b;
        end
        if (battery_in_use == b)
            if (bat_array(b).getStatus()==BatStatus.Depleted)||(bat_array(b).getStatus()==BatStatus.Done)
                drone_in_use = false;
                battery_in_use = 0;
            end
        end
        if (bat_array(b).getStatus()==BatStatus.Depleted)
            bat_array(b).startCooling();
        end
            
    end
    
   if char1.getStatus==ChargerStatus.Charging % If the status of charger one is set to "charging" then the its status within the array should be correlated to the battery it is currently charging 
        bat_array(charging_battery) = char1.updateCharger(bat_array(charging_battery));
    end
    
    if drone_in_use == false % If the drone/battery is still in use the following statements are considered false and are voided
        if (next_ready_battery~=0)
            bat_array(next_ready_battery).useBat();
            drone_in_use = true;
            battery_in_use = next_ready_battery;
        end
    end
    if (next_cool_battery~=0) % If the next cool battery is equal to zero then the status of charger one is set to "Ready" then the battery should move on to the next battery that needs to be charged
        if char1.getStatus == ChargerStatus.Ready
            bat_array(next_cool_battery) = char1.setBattery(bat_array(next_cool_battery));
            charging_battery = next_cool_battery;
        end
    end
    
      if char2.getStatus==ChargerStatus.Charging % If the status of charger one is set to "charging" then the its status within the array should be correlated to the battery it is currently charging 
        bat_array(charging_battery) = char1.updateCharger(bat_array(charging_battery));
    end
    
    if drone_in_use == false % If the drone/battery is still in use the following statements are considered false and are voided
        if (next_ready_battery~=0)
            bat_array(next_ready_battery).useBat();
            drone_in_use = true;
            battery_in_use = next_ready_battery;
        end
    end
    if (next_cool_battery~=0) % If the next cool battery is equal to zero then the status of charger one is set to "Ready" then the battery should move on to the next battery that needs to be charged
        if char2.getStatus == ChargerStatus.Ready
            bat_array(next_cool_battery) = char2.setBattery(bat_array(next_cool_battery));
            charging_battery = next_cool_battery;
        end
    end
              
    simulation_not_done = false;
    for b = 1:num_batteries
        status = string(bat_array(b).getStatus);
        if status=="InUse"
            total_flight_time = total_flight_time+1/60;
        end
        if total_flight_time <= min_flight_time
            simulation_not_done = true;
        end
        bat_data(i,b) = {status};
    end
    if simulation_not_done == false
        sim_flag = false;
    end

end

%% Print Outputs
total_field_time = i/60;
up_time = total_flight_time/total_field_time*100;
str = "Total Flight Time: " + total_flight_time + " hours";
disp(str);
str = "Total Field Time: "+total_field_time+" hours";
disp(str);
str = "Total Up Time: " + up_time + "%";
disp(str);
str = "Total Cost:"+Total_Cost+"$";
disp(str);

xlswrite("bat_data_C2.xlsx",bat_data,"sheet1"); % creates an excel table