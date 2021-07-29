%% User Input
clear;
clc;

max_bat = 12;% Number of batteries
min_flight_time = 3; %hours

Charger_Cost = 39;
Battery_Cost = 149;
Work_Cost = 100;

charge_time = 90;
cool_time = 60;
flight_time = 21;

batt = [charge_time,cool_time,flight_time];
costs = [Charger_Cost,Battery_Cost,Work_Cost];

i = 1;
for num_batteries = 2:max_bat
    
    [total_field_time1,up_time1,total_flight_time1,Total_Cost1] = Battery_Sim(num_batteries,batt,costs,min_flight_time);
    
    [total_field_time2,up_time2,total_flight_time2,Total_Cost2] = Battery_Sim_C2(num_batteries,batt,costs,min_flight_time);
    
    [total_field_time3,up_time3,total_flight_time3,Total_Cost3] = Bat_Sim_C_All(num_batteries,batt,costs,min_flight_time);
    
    [total_field_time4,up_time4,total_flight_time4,Total_Cost4] = Bat_Sim_C_None(batt,costs,min_flight_time);
    
    field(i,:) = [total_field_time1,total_field_time2,total_field_time3,total_field_time4];
    flight(i,:) = [total_flight_time1,total_flight_time2,total_flight_time3,total_flight_time4];
    Tcosts(i,:) = [Total_Cost1,Total_Cost2,Total_Cost3,Total_Cost4];
 
    i = i+1;
end

import mlreportgen.ppt.*

ppt = Presentation("myPresentation.pptx");


