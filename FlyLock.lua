local Parrying = {}

Parrying.OldPosition = {0,0,0}
Parrying.LockPosition = false

Menu.AddCheckBox("FlyLock[num0]")

function OnFrame()
    local LocalPlayer = Entities.GetLocalPlayer() 
    
    if Menu.GetBool("FlyLock[num0]") == true then    
        if Engine.IsKeyDown(0x60) then --numpad 0

            if (Parrying.LockPosition == false) then
                Parrying.OldPosition = Entity.GetPosition(LocalPlayer)
                Parrying.LockPosition = true
            end
              
            local CurrentPosition = Entity.GetPosition(LocalPlayer) 

            CurrentPosition.z = Parrying.OldPosition.z
            Entity.SetPosition(LocalPlayer, CurrentPosition) 
        else
            if(Parrying.LockPosition == true) then
                Parrying.LockPosition = false
            end
        end
    end
end

Client.AddCallback("OnRenderFrame", OnFrame)