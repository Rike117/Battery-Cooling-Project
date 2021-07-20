classdef BatStatus
    enumeration % This class is establishing the status from which the battery class and simulation will call from
        InUse,Depleted,Cooling,Cooled,Charging,Charged,Ready,Done
    end
end