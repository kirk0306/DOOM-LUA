do
	local function busyloop(final_ctr)
		final_ctr = final_ctr - final_ctr%1
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

moveStep = 100;

local Apex = {}

-------------------------------------------------------------------------------
-- 快捷键 单独按侧键重置脚本
-------------------------------------------------------------------------------
Apex.keyWeapon1    = 5 -- dpi键 + 上侧键
--Apex.keyWeapon2    = 4 -- dpi键 + 下侧键
--Apex.keyWeapon3    = 2 -- dpi键 + 右键

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
Apex.onGKeyPressed = function ()
	Apex.currentWeapon = "NIL"
end
-------------------------------------------------------------------------------
-- 选择weapon1
-------------------------------------------------------------------------------
Apex.onWeapon1 = function ()
i=0
	click = 1
	Click()
end
-------------------------------------------------------------------------------
-- 逻辑
-------------------------------------------------------------------------------
Apex.onEvent = function (event, arg)
	--OutputLogMessage("event = %s, arg = %d\n", event, arg)
	if (event == "PROFILE_ACTIVATED") then
		EnablePrimaryMouseButtonEvents(true)
	elseif event == "PROFILE_DEACTIVATED" then
		EnablePrimaryMouseButtonEvents(false)
		Apex.currentWeapon = "NIL"
		return
	end

	-- dpi键按下逻辑
	if event == "MOUSE_BUTTON_PRESSED" and arg == 6 then
		Apex.isGKeyPressed = true
		Apex.isOKeyPressed = false
	elseif event == "MOUSE_BUTTON_RELEASED" and arg == 6 then
		Apex.isGKeyPressed = false
	end

	-- 在dpi键按下的时候，其他键是否被按下
	if event == "MOUSE_BUTTON_PRESSED" and arg ~= 6 and Apex.isGKeyPressed then
		Apex.isOKeyPressed = true
	end

	-- dpi键和某键同时按下 

	if event == "MOUSE_BUTTON_RELEASED" and arg == 6 and Apex.isOKeyPressed == false then
		Apex.onGKeyPressed()
	-- 选择1
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == Apex.keyWeapon1 and Apex.isGKeyPressed == true then
		OutputLogMessage("use weapon1\n")
		Apex.currentWeapon = "weapon1"

	-- 鼠标左键被按下
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == 1 and not IsModifierPressed("lalt") and not IsMouseButtonPressed(3) then
		if Apex.currentWeapon ~= "NIL" then
			if Apex.currentWeapon == "weapon1" then
				Apex.onWeapon1() 
			end
		end
	end

	-- 虚拟被按下
	if (event == "M_RELEASED" and arg == 3) then
		Click()
	end
	
	if (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
		Stopclick()
	end	
end	

-------------------------------------------------------------------------------
-- 按住
-------------------------------------------------------------------------------	
function Click()
	if(i>69)then
		i=0
	end
		i=i+1
		PressAndReleaseMouseButton(1)
		PlayMacro("DOOM n");
		Sleep(50);

	if click == 0 then
		Stopclick()

	elseif click == 1 then 
		SetMKeyState(3)
	else 
		Stopclick()

	end
end

-------------------------------------------------------------------------------
-- 停止点击
-------------------------------------------------------------------------------
function Stopclick()
	click = 0
	AbortMacro();

end

-------------------------------------------------------------------------------
-- 驱动
-------------------------------------------------------------------------------
function OnEvent(event, arg, family)
--	OutputLogMessage("event = %s, arg = %s, family = %s\n", event, arg, family);
	Apex.onEvent(event, arg)
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 3 and not IsModifierPressed("lshift")) then
		PressAndReleaseKey("c");
		Sleep(300);
		for i = 0, 63 do
			MoveMouseRelative( moveStep, 0 );
			FastSleep(1);
		end
		PressKey("spacebar");
		FastSleep(10);
		ReleaseKey("spacebar");
		FastSleep(10);
		PressKey("t");
		FastSleep(10);
		ReleaseKey("t");
		for j = 0, 63 do
			MoveMouseRelative( -moveStep, 0 );
			FastSleep(1);	
		end
		PressAndReleaseKey("z");
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 3 and IsModifierPressed("lshift")) then
		PlayMacro("DOOM");
		Sleep(50);
	end
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 2 and IsModifierPressed("lshift")) then

		AbortMacro();
		PressKey("x");
		Sleep(50);
		ReleaseKey("x");
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 2) then
		AbortMacro();
	end
	if (event == "MOUSE_BUTTON_RELEASED" and arg == 4 and family == "mouse") then
		AbortMacro();
		PressKey("z");
		Sleep(50);
		ReleaseKey("z");
	end
	if(event == "MOUSE_BUTTON_PRESSED" and arg == 8 and family == "mouse") then

	end
end