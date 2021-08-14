function[total_field_time,up_time,Total_Flight_Time,Total_Cost] = Bat_Sim_C_None(batt, costs,min_flight_time)

Charger_Cost = costs(1);
Battery_Cost = costs(2);
Work_Cost = costs(3);
Method_Cost = costs(4);
num_batteries=0;
Avg_Flight_Time = batt(3);

b= min_flight_time*60/Avg_Flight_Time;
Total_Flight_Time = (b*Avg_Flight_Time)/60;
total_field_time = Total_Flight_Time;
Total_Cost = (b*Battery_Cost)+(0*Charger_Cost)+(Work_Cost*total_field_time);
up_time = 100;


%  filename = "\Bat_Sim_C_None" + num_batteries+"B.xlsx";
%  
%  xlswrite(filename,"sheet1"); % creates an excel table


end 
