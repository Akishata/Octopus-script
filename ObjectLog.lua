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

function OnFrame()
    if(bInit == false) then
        local LocalPlayer = Entities.GetLocalPlayer();
        local ObjectList = Entities.GetEntityList()
        local ObjectCount = Entities.GetCount()

        local LocalPlayerPos = Entity.GetPosition(LocalPlayer)
        
        for i=1,ObjectCount do
            local CurrentObject = ObjectList[i]
            if(CurrentObject ~= 0) then
                local ObjectName = Entity.GetName(CurrentObject)
                if(IsValidName(ObjectName)) then
                    local ObjectType = Entity.GetType(CurrentObject)
                    local ObjectPosition = Entity.GetPosition(CurrentObject)
                    local Dist = CalcDistance(LocalPlayerPos,ObjectPosition)

                    Log.Write("Name: " .. ObjectName .. "  |  " .. "Type: " .. ObjectType .. "  |  " .. "Distance: " .. tostring(math.floor(Dist)))
                end
            end
        end
        bInit = true
    end
end

Client.AddCallback("OnRenderFrame", OnFrame)