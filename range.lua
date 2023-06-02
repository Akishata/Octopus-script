Menu.AddCheckBox("Range")
Menu.AddSliderFloat("RangeSlider",-3,3)


function OnFrame()
    if Menu.GetBool("Range") == true then
        local SliderValue = Menu.GetFloat("RangeSlider")
        Local.AddAttackRange(SliderValue)
    end
end

Client.AddCallback("OnRenderFrame", OnFrame)