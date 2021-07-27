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

function[total_field_time,up_time,total_flight_time,Total_Cost] = Bat_Sim_C_None(num_batteries,num_chargers_None,min_flight_time,Charger_Cost,Battery_Cost,Work_Cost,Avg_Flight_Time);
%Creating a battery array and calculation total(cost,flight time,field time)
b= 1:1:num_batteries;
Total_Cost = (b*Battery_Cost)+(num_chargers_None*Charger_Cost)+(Work_Cost);
Total_Flight_Time = (b*Avg_Flight_Time)/60;
Total_Field_Time = Total_Flight_Time;





str = "Total Cost:"+Total_Cost+"$";
disp(str);
str = "Total Field Time: "+Total_Field_Time+" hours";
disp(str);
str = "Total Flight Time: " + Total_Flight_Time + " hours";
disp(str);
end