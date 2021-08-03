%% User Input
clear;
clc;

max_bat = 12;% Number of batteries
min_flight_time = 3; %hours

Charger_Cost = 39;
Battery_Cost = 149;
Work_Cost = 100;

charge_time = 90;
cool_time = 6;
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

figure();
bar(field)
title('Total Field Time')
xlabel('Number of Batteries')
ylabel('Field Time')
legend();

figure();
bar(flight)
title('Total Flight Time')
xlabel('Number of Batteries')
ylabel('Flight Time')
legend();

figure();
bar(Tcosts)
title('Total Cost')
xlabel('Number of Batteries')
ylabel('Cost')
legend();

% import mlreportgen.ppt.*
% ppt = Presentation('myFirstPresentation.pptx');
% open(ppt);
% 
% titleSlide = add(ppt,'Title Slide');
% textSlide  = add(ppt,'Title and Content');
% 
% paraObj = Paragraph('My First Presentation');
% paraObj.FontColor = 'red';
% replace(titleSlide,'Title',paraObj);
% 
% replace(textSlide,'Content',{'Subject A','Subject B','Subject C'});
% close(ppt);
% rptview(ppt);

