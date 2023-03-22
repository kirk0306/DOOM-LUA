do
    local function busyloop(final_ctr)
        final_ctr = final_ctr - final_ctr % 1
        local ctr, prev_ms, ms0, ctr0 = 0
        while ctr ~= final_ctr do
            local ms = GetRunningTime()
            if prev_ms and ms ~= prev_ms then
                if not ms0 then
                    ms0, ctr0 = ms, ctr
                elseif final_ctr < 0 and ms - ms0 > 500 then
                    return (ctr - ctr0) / (ms - ms0)
                end
            end
            prev_ms = ms
            ctr = ctr + 1
        end
    end
    local coefficient = busyloop(-1)
    function FastSleep(ms)
        return busyloop(ms * coefficient)
    end
end

local Apex = {}
ys = 25
-------------------------------------------------------------------------------
-- 快捷键 单独按侧键重置脚本
-------------------------------------------------------------------------------
Apex.keyWeapon1 = 4 -- dpi键 + 上侧键
Apex.keyWeapon2 = 5 -- dpi键 + 下侧键
Apex.keyWeapon3 = 2 -- dpi键 + 右键

-------------------------------------------------------------------------------
-- 变量
-------------------------------------------------------------------------------
-- dpi键是否按下
Apex.isGKeyPressed = false
-- dpi键按下，其他按钮是否按下
Apex.isOKeyPressed = false
-- 当前武器
Apex.currentWeapon = "NIL"

-------------------------------------------------------------------------------
-- dpi键按下
-------------------------------------------------------------------------------
Apex.onGKeyPressed = function()
    Apex.currentWeapon = "NIL"
end
-------------------------------------------------------------------------------
-- 选择weapon1
-------------------------------------------------------------------------------
Apex.onWeapon1 = function()
    W1_capslock = {"10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10",
                   "10", "10", "10", "10", "10", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
                   "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2"}
   W1 = {"8", "8", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2"}
    xx = {}
    for i = 1, 200 do
        if i % 2 == 1 then
            xx[i] = "-10"
        else
            xx[i] = "10"
        end
    end
    i = 0
    xy = IsKeyLockOn("capslock") and not IsModifierPressed("lalt") and W1_capslock or W1
    click_a = 1
    Click_Auto()
end
-------------------------------------------------------------------------------
-- 选择weapon2
-------------------------------------------------------------------------------
Apex.onWeapon2 = function()
    W2_capslock = {"14", "14", "14", "14", "14", "14", "14", "14", "14", "14", "14", "14", "14", "14", "14", "14", "14",
                   "14", "14", "14", "14", "14", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10",
                   "10", "10", "10", "10", "10", "10", "10", "10", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0",
                   "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"}

    W2 = {}
    for i=1,60 do
        if i<=11 then
            table.insert(W2,"10")
        else
            table.insert(W2,"2")
        end
    end

    xx = {}
    for i = 1, 200 do
        if i % 2 == 1 then
            xx[i] = "-10"
        else
            xx[i] = "10"
        end
    end
    i = 0
    xy = IsKeyLockOn("capslock") and not IsModifierPressed("lalt") and W2_capslock or W2
    click_a = 1
    Click_Auto()
end
-------------------------------------------------------------------------------
-- 选择weapon3
-------------------------------------------------------------------------------
Apex.onWeapon3 = function()

    A3 = {"0", "0", "0", "0", "0", "0", "0", "0", "32", "32", "32", "32", "16", "16", "16", "16", "16", "16", "16",
          "16", "4", "4", "4", "4", "4", "4", "4", "4", "10", "10", "4", "4", "4", "4", "4", "4", "4", "4", "16", "16",
          "16", "16", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10",
          "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10", "10"}

    C3 = {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "16", "16", "16", "16", "16",
          "16", "16", "16", "16", "16", "16", "16", "2", "2", "2", "2", "2", "2", "2", "2", "16", "16", "16", "16", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2",
          "2", "2", "2", "2", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4",
          "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4",
          "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4", "4",
          "4", "4", "4", "4", "4"}

    xx = {}
    for i = 1, 200 do
        if i <= 16 then
            xx[i] = "0"
        elseif i % 2 == 1 then
            xx[i] = "-10"
        else
            xx[i] = "10"
        end
    end

    i = 0
    if IsKeyLockOn("capslock") and not IsModifierPressed("lalt") then
        xy = C3
        click_a = 1
        Click_Auto()
    else
        xy = C3
        click_a = 1
        Click_Auto()
    end
end
-------------------------------------------------------------------------------
-- 逻辑
-------------------------------------------------------------------------------
Apex.onEvent = function(event, arg)
    if event == "PROFILE_ACTIVATED" then
		EnablePrimaryMouseButtonEvents(true)
    elseif event == "PROFILE_DEACTIVATED" then
        EnablePrimaryMouseButtonEvents(false)
        Apex.currentWeapon = "NIL"
        return
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg == 6 then
        Apex.isGKeyPressed = true
        Apex.isOKeyPressed = false

    elseif event == "MOUSE_BUTTON_RELEASED" and arg == 6 then
        Apex.isGKeyPressed = false
    end

    if event == "MOUSE_BUTTON_PRESSED" and arg ~= 6 and Apex.isGKeyPressed then
        Apex.isOKeyPressed = true
    end

    if event == "MOUSE_BUTTON_RELEASED" and arg == 6 and Apex.isOKeyPressed == false then
        Apex.onGKeyPressed()
    elseif event == "MOUSE_BUTTON_PRESSED" and arg == Apex.keyWeapon1 then
        if Apex.isGKeyPressed then
            OutputLogMessage("use weapon2\n")
			Apex.currentWeapon = "weapon2"
        else
            OutputLogMessage("use weapon1\n")
            Apex.currentWeapon = "weapon1"
        end
        PressAndReleaseKey("1")
    elseif event == "MOUSE_BUTTON_PRESSED" and arg == Apex.keyWeapon3 and Apex.isGKeyPressed then
        OutputLogMessage("use weapon3\n")
        Apex.currentWeapon = "weapon3"
        PressAndReleaseKey("2")
    elseif event == "MOUSE_BUTTON_PRESSED" and arg == 1 and not IsModifierPressed("lalt") then
        if Apex.currentWeapon ~= "NIL" then
            if Apex.currentWeapon == "weapon1" then
                Apex.onWeapon1()
            elseif Apex.currentWeapon == "weapon2" then
                Apex.onWeapon2()
            elseif Apex.currentWeapon == "weapon3" then
                Apex.onWeapon3()
            end
        end
    end

    if event == "M_RELEASED" and arg == 3 then
        Click()
    end

    if event == "M_RELEASED" and arg == 2 then
        Click_Auto()
    end

    if event == "MOUSE_BUTTON_RELEASED" and arg == 1 then
        Stopclick()
    end
end

-------------------------------------------------------------------------------
-- 
-------------------------------------------------------------------------------	
function Click()
    if (i > 500) then
        i = 0
    end
    i = i + 1
    PressAndReleaseMouseButton(1)
	Sleep(ys)
    if click == 0 then
        Stopclick()
    elseif click == 1 then
        SetMKeyState(3)
    else
        Stopclick()
    end
end
-------------------------------------------------------------------------------
-- 
-------------------------------------------------------------------------------
function Click_Auto()
    if (i > 500) then
        i = 0
    end
    i = i + 1
	
	if Apex.currentWeapon == "weapon2" then
		MoveMouseRelative(0, 0)
        PressMouseButton(1)
        FastSleep(ys)
	elseif Apex.currentWeapon == "weapon3" then
        if not IsKeyLockOn("scrolllock") then
            MoveMouseRelative(xx[i], xy[i])
            PressMouseButton(1)
            FastSleep(ys)
        else
            MoveMouseRelative(xx[i + 14], xy[i + 14])
            PressMouseButton(1)
            FastSleep(ys)
        end
    else
        MoveMouseRelative(xx[i], xy[i])
        PressMouseButton(1)
        FastSleep(ys)
    end

    if click_a == 1 then
        SetMKeyState(2)
    end
end

-------------------------------------------------------------------------------
-- 停止点击
-------------------------------------------------------------------------------
function Stopclick()
    click = 0
    click_a = 0
end

-------------------------------------------------------------------------------
-- 驱动
-------------------------------------------------------------------------------
function OnEvent(event, arg)
    Apex.onEvent(event, arg)
    if event == "MOUSE_BUTTON_PRESSED" and arg == 3 then
        if not IsModifierPressed("lshift") then
            PlayMacro("O_pathfinder")
        elseif IsModifierPressed("lctrl") then
            PlayMacro("O_pathfinder_short")
        else
            PlayMacro("O_pathfinder_long")
        end
        Sleep(100)
    elseif event == "MOUSE_BUTTON_PRESSED" and arg == 2 and IsModifierPressed("lshift") then
        PlayMacro("O_G")
        Sleep(100)
    end
end
