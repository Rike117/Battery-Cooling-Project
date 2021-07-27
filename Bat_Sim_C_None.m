% clear;
% clc;
% 
% %% User Input
% num_batteries = 5; % Number of batteries
% Avg_Flight_Time = 31; % Average Flight Time per battery
% num_chargers = 0;  % Number of Chargers    
% Charger_Cost = 39;
% Battery_Cost = 149;
% Work_Cost = 100;
% n = num_batteries;
% bat_data = {};

function[total_field_time,up_time,Total_Flight_Time,Total_Cost] = Bat_Sim_C_None(batt, costs,min_flight_time)

Charger_Cost = costs(1);
Battery_Cost = costs(2);
Work_Cost = costs(3);

Avg_Flight_Time = batt(3);
%Creating a battery array and calculation total(cost,flight time,field time)
b= min_flight_time*60/Avg_Flight_Time;
Total_Cost = (b*Battery_Cost)+(0*Charger_Cost)+(Work_Cost);
Total_Flight_Time = (b*Avg_Flight_Time)/60;
total_field_time = Total_Flight_Time;
up_time = 1;




% str = "Total Cost:"+Total_Cost+"$";
% disp(str);
% str = "Total Field Time: "+Total_Field_Time+" hours";
% disp(str);
% str = "Total Flight Time: " + Total_Flight_Time + " hours";
% disp(str);
end