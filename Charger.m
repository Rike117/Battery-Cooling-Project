classdef Charger < handle
    properties % Establishing the Chargers properties 
        status = ChargerStatus.Ready;
        current_bat = 0;
    end
    
    methods
        function battery = setBattery(obj,battery) % Setting the batteru as an object
            battery.setCharge(); % correlating a battery with a charger set
            obj.current_bat = battery; % The status of charger will be based upon the battery currently in use
            obj.status = ChargerStatus.Charging; % If a charger is in use then its status should be "Charging"
        end
        function status = getStatus(obj) % When the status of an object is called then the status of the object should be presented
            status = obj.status;
        end
        function battery = updateCharger(obj,battery) % the status of the battery should be relaid to the battery so that its status should be updated accordingly 
            
            if obj.current_bat ~= 0 % If the current battery is equal zero then that battery will be the one that will be charged
                battery = obj.current_bat;
                if obj.status == ChargerStatus.Charging % If the objects status is set to "Charging" that means that a battery is currently being charged
                    battery.chargeBat();
                end
                
                if battery.getStatus() == BatStatus.Charged % If the objects status is set to "Charged" then that means that the battery in question is fully charged
                    obj.status = ChargerStatus.Charged;
                end
                if obj.status == ChargerStatus.Charged % Furthermore, since the battery is fully charged the chargers status should be set to ready
                    obj.status = ChargerStatus.Ready;
                end
            end
            
        end
    end
end

