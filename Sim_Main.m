%% User Input
num_batteries = 5; % Number of batteries
num_chargers = 2 ;  % Number of Chargers
num_chargers_2 = 2 ;
num_chargers_All = 5 ;
num_chargers_None = 0 ;
min_flight_time = 5; %hours
Charger_Cost = 39;
Battery_Cost = 149;
Work_Cost = 100;
Avg_Flight_Time = 31; % Average Flight Time per battery



Battery_Sim(num_batteries,num_chargers,min_flight_time,Charger_Cost,Battery_Cost,Work_Cost)
Battery_Sim_C2(num_batteries,num_chargers_2,min_flight_time,Charger_Cost,Battery_Cost,Work_Cost)
Bat_Sim_C_All(num_batteries,num_chargers_All,min_flight_time,Charger_Cost,Battery_Cost,Work_Cost)
Bat_Sim_C_None(num_batteries,num_chargers_None,min_flight_time,Charger_Cost,Battery_Cost,Work_Cost,Avg_Flight_Time)

