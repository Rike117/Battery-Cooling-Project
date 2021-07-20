clear;
clc;

%% User Input
num_batteries = 4; % Number of batteries
Avg_Flight_Time = 31; % Average Flight Time per battery
num_chargers = 0;  % Number of Chargers    
Charger_Cost = 39;
Battery_Cost = 149;
Work_Cost = 100;
n = num_batteries;
bat_data = {};

%Creating a battery array and calculation total(cost,flight time,field time)
b= 1:1:n;
Total_Cost = (b*Battery_Cost)+(num_chargers*Charger_Cost)+(Work_Cost);
Total_Flight_Time = (b*Avg_Flight_Time)/60;
Total_Field_Time = Total_Flight_Time;





str = "Total Cost:"+Total_Cost+"$";
disp(str);
str = "Total Field Time: "+Total_Field_Time+" hours";
disp(str);
str = "Total Flight Time: " + Total_Flight_Time + " hours";
disp(str);
