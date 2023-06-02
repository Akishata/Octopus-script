local bInit = false


function CalcDistance(vec1, vec2)
    return vec1:Dist(vec2)
end

function IsValidName(name)
    if (string.len(name) >= 2 and name ~= "UNKWSTRING") then  
        return true
    end
    return false
end


function GetObjectInfo(LocalPlayer, ObjectList, ObjectCount)
    local LocalPlayerPos = Entity.GetPosition(LocalPlayer)

    for i=1,ObjectCount do
        local CurrentObject = ObjectList[i]
        if(CurrentObject ~= 0) then
            local ObjectName = Entity.GetName(CurrentObject)
            if(IsValidName(ObjectName)) then

                local ObjectType = Entity.GetType(CurrentObject)
                local ObjectPosition = Entity.GetPosition(CurrentObject)
                local Health = Entity.GetHealth(CurrentObject)
                local MaxHealth = Entity.GetMaxHealth(CurrentObject)
                local Dist = CalcDistance(LocalPlayerPos,ObjectPosition)

                Log.Write("Name: " .. ObjectName .. "  |  " .. "Type: " .. ObjectType .. "  |  " .. "Distance: " .. tostring(math.floor(Dist)) .. "  |  " .. "Health: " .. tostring(Health) .. "/" .. tostring(MaxHealth))
            end
        end
    end
end

function GetObjectByName(ObjectList, ObjectCount, FindName)

    for i=1,ObjectCount do
        local CurrentObject = ObjectList[i]
        if(CurrentObject ~= 0) then
            local ObjectName = Entity.GetName(CurrentObject)
            if(ObjectName == FindName) then
                return CurrentObject
            end
        end
    end
    return 0
end


function OnFrame()
    local LocalPlayer = Entities.GetLocalPlayer();
    local ObjectList = Entities.GetEntityList()
    local ObjectCount = Entities.GetCount()

    if(bInit == false) then
        GetObjectInfo(LocalPlayer,ObjectList,ObjectCount)
        bInit = true
    end
end

Client.AddCallback("OnRenderFrame", OnFrame)