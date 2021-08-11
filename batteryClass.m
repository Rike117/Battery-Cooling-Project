classdef batteryClass < handle
    properties 
        time_charge = 90;   %default
        time_cool = 60;     %default
        time_use = 30;      %default
        remaining = 0;      %Time remaining
        status = BatStatus.Ready;   %status
        use_count = 0;      %How many times has this battery been used
        count_max = 10;      %How many times can this battery be used
               
    end
    methods
        %Constructor - use this to customize the battery
        function obj = batteryClass(charge,cool,use) % The number of function input arguements are being set up in this section
            if nargin > 0
                obj.time_charge = charge;
                obj.time_cool = cool;
                obj.time_use = use;
            end
                
        end
        function updateBattery(obj)
            if (obj.status == BatStatus.InUse) % If the object status is "InUse" then the time remaing for the that object is the time remaining minus 1
                obj.remaining = obj.remaining - 1;
                if obj.remaining == 0 % If the time remaining for the object is equal to zero then the objects status should be set to "Depleted"
                    obj.status = BatStatus.Depleted;
                    obj.use_count = obj.use_count + 1; % If an object status is "Depleted" then its use count is its use count plus one
                end
            end
            if (obj.status == BatStatus.Cooling) % If the object status is set to "Cooling" then its remaining time is the objects remaining time minuse 1
                obj.remaining = obj.remaining - 1;
                if obj.remaining == 0 % If an objects remaining time is zero then its status should be set to cooled
                    obj.status = BatStatus.Cooled;
                end
            end
            if (obj.status == BatStatus.Charged) % If an object status is "Charged" then its subsequent status should be set to "Ready"
                obj.status = BatStatus.Ready;
            end
            if obj.use_count == obj.count_max % If an objects use count has reached it maximum allowable count then the objects status should be set to "Done"
                obj.status = BatStatus.Done;
            end
            
        end
        function useBat(obj)
            obj.remaining = obj.time_use;
            obj.status = BatStatus.InUse;
        end
        function setCharge(obj)
            obj.remaining = obj.time_charge; % The objects remaining time is equal to its time to charge
            obj.status = BatStatus.Charging; % The objects is also equal to the batteries charging stauts
        end
        function chargeBat(obj)
            obj.remaining = obj.remaining-1; % A charging batteries remaining time is equal to the remaining time minus one
            if obj.remaining == 0 % If the objects remaining time is equal to zero then the objects status should be set to "Charged"
                obj.status = BatStatus.Charged;
            end
        end
        function status = getStatus(obj) % The status function should be called up when getStatus(obj) is used and subsequently the status should be equal to obj.status
            status = obj.status;
        end
        function startCooling(obj) % When an object commmences the cooling procces then the objects remaining time is equal to the objects cool time. And the objects status should be set to cooling
            obj.remaining = obj.time_cool;
            obj.status = BatStatus.Cooling;
        end
    end
 end



