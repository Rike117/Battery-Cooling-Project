
%% User Input
clear;
clc;

max_bat = 9;% Number of batteries
min_flight_time = 3; %hours

Charger_Cost = 39;
Battery_Cost = 149;
Work_Cost = 100;
Method_Cost = 150;

charge_time = 90;
cool_time = 19;
flight_time = 21;

batt = [charge_time,cool_time,flight_time];
costs = [Charger_Cost,Battery_Cost,Work_Cost,Method_Cost];

i = 1;
for num_batteries = 2:max_bat
    
    [total_field_time1,up_time1,total_flight_time1,Total_Cost1] = Battery_Sim(num_batteries,batt,costs,min_flight_time);
    
    [total_field_time2,up_time2,total_flight_time2,Total_Cost2] = Battery_Sim_C2(num_batteries,batt,costs,min_flight_time);
    
    [total_field_time3,up_time3,total_flight_time3,Total_Cost3] = Bat_Sim_C_All(num_batteries,batt,costs,min_flight_time);
    
    [total_field_time4,up_time4,total_flight_time4,Total_Cost4] = Bat_Sim_C_None(batt,costs,min_flight_time);
    
    field(i,:) = [total_field_time1,total_field_time2,total_field_time3,total_field_time4];
    flight(i,:) = [total_flight_time1,total_flight_time2,total_flight_time3,total_flight_time4];
    Tcosts(i,:) = [Total_Cost1,Total_Cost2,Total_Cost3,Total_Cost4];
    UpTime(i,:) = [up_time1,up_time2,up_time3,up_time4];
 
    i = i+1;
end

figure();
bar(2:9,field)
title('Total Field Time')
xlabel('Number of Batteries')
ylabel('Field Time')
legend('1-Charger','2-Chargers','All-Charger','None');

figure();
bar(2:9,flight)
title('Total Flight Time')
xlabel('Number of Batteries')
ylabel('Flight Time')
legend('1-Charger','2-Chargers','All-Charger','None');

figure();
bar(2:9,Tcosts)
title('Total Cost')
xlabel('Number of Batteries')
ylabel('Cost')
legend('1-Charger','2-Chargers','All-Charger','None');

 figure();
 bar(2:9,UpTime)
 title('Total Up Time')
 xlabel('Number of Batteries')
 ylabel('Up Time')
 legend('1-Charger','2-Chargers','All-Charger','None');



% import mlreportgen.ppt.*
% ppt = Presentation('Lipo Battery Cooling Methods.pptx');
% open(ppt);
% 
% titleSlide = add(ppt,'Title Slide');
% textSlide  = add(ppt,'Title and Content');
% 
% paraObj = Paragraph(' A Study on Lipo Battery Cooling Methods');
% paraObj.FontColor = 'Black';
% replace(titleSlide,'Title',paraObj);
% 
% replace(textSlide,'Title','Summary');
% replace(textSlide,'Content',{'As a part of this study Matlab scripts were created to simulate the varying wait times, cooling times, charging times, and costs that one might encounter while utilizing drones.'...
%     ,'The first scnerario simulated the conditions that one would encounter when only having one charger. Continually via the script the total wait time, flight time, and field time are calculated',...
%     'The second scenario simulates the conditions of only having two chargers','The third simulates the conditions of having 5 chargers','The fourth simulates the conditons of having no chargers and using only batteries to achieve the desired flight time'});
% 
% slide  = add(ppt,'Title and Content');
% replace(slide,"Title","Total Field Time");
% fig = figure;
% bar(field);
% title('Total Field Time')
% xlabel('Number of Batteries')
% ylabel('Field Time')
% legend('1-Charger','2-Chargers','All-Charger','None');
% 
% slide2  = add(ppt,'Title and Content');
% replace(slide2,"Title","Total Flight Time");
% fig2 = figure;
% bar(flight);
% title('Total Flight Time')
% xlabel('Number of Batteries')
% ylabel('Flight Time')
% legend('1-Charger','2-Chargers','All-Charger','None');
% 
% slide3  = add(ppt,'Title and Content');
% replace(slide3,"Title","Total Cost");
% fig3 = figure;
% bar(Tcosts);
% title('Total Cost')
% xlabel('Number of Batteries')
% ylabel('Cost')
% legend('1-Charger','2-Chargers','All-Charger','None');
% 
% slide4  = add(ppt,'Title and Content');
% replace(slide4,"Title","Total Up Time");
% fig4 = figure;
% bar(UpTime);
% title('Total Up Time')
% xlabel('Number of Batteries')
% ylabel('Up Time')
% legend('1-Charger','2-Chargers','All-Charger','None');
% 
% % Print the figure to an image file
% figSnapshotImage = "figSnapshot.png";
% Flight_Pic = "Flight Pic.png";
% Cost_Pic = "Cost Pic.png";
% UpTime_Pic = "UpTime_Pic.png";
% 
% print(fig,"-dpng",figSnapshotImage);
% print(fig2,"-dpng",Flight_Pic);
% print(fig3,"-dpng",Cost_Pic);
% print(fig4,"-dpng",UpTime_Pic);
% 
% % Create a Picture object using the figure snapshot image file
% figPicture = Picture(figSnapshotImage);
% figPicture2 = Picture(Flight_Pic);
% figPicture3 = Picture(Cost_Pic);
% figPicture4 = Picture(UpTime_Pic);
% 
% % Add the figure snapshot picture to the slide
% replace(slide,"Content",figPicture);
% replace(slide2,"Content",figPicture2);
% replace(slide3,"Content",figPicture3);
% replace(slide4,"Content",figPicture4);
% 
% % Close the presentation
% close(ppt);
% 
% % Once the presentation is generated, the figure and the image file
% % can be deleted
% delete(fig);
% delete(fig2);
% delete(fig3);
% delete(fig4);
% 
% delete(figSnapshotImage);
% delete(Flight_Pic);
% delete(Cost_Pic);
% delete(UpTime_Pic);
% 
% % View the presentation
% rptview(ppt);
% 
