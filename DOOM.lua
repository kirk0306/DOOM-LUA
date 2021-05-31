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
Apex.keyWeapon1    = 4 
Apex.keyWeapon2    = 2 
Apex.keyWeapon3    = 5 
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
-- 选择weapon2
-------------------------------------------------------------------------------
Apex.onWeapon2 = function ()
i=0
	click2 = 1
	Click2()
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
		AbortMacro();
		Apex.onGKeyPressed()
	-- 选择1
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == Apex.keyWeapon1 and not IsModifierPressed("lshift") then
		OutputLogMessage("use weapon1\n")
		Apex.currentWeapon = "weapon1"
		PressAndReleaseKey("z");
	-- 选择2
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == Apex.keyWeapon2 and Apex.isGKeyPressed == true then
		OutputLogMessage("use weapon2\n")
		Apex.currentWeapon = "weapon2"
		PressAndReleaseKey("2");
	-- 选择3
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == Apex.keyWeapon3 and Apex.isGKeyPressed == true then
		OutputLogMessage("use weapon3\n")
		Apex.currentWeapon = "weapon3"
		PressAndReleaseKey("3");
	-- 鼠标左键被按下
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == 1 and not IsModifierPressed("lalt") and not IsMouseButtonPressed(3) then
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
	-- 虚拟被按下
	if (event == "M_RELEASED" and arg == 3) then
		Click()
	end
	if (event == "M_RELEASED" and arg == 2) then
		Click2()
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
		Sleep(50);
		PlayMacro("DOOM n");--DOOM easy DOOM n
	if click == 0 then
		Stopclick()
	elseif click == 1 then 
		SetMKeyState(3)
	else 
		Stopclick()
	end
end

function Click2()
	if(i>69)then
		i=0
	end
		i=i+1
		PlayMacro("DOOM long");
		Sleep(50);
		PressAndReleaseMouseButton(1)
	if click2 == 0 then
		Stopclick()

	elseif click2 == 1 then 
		SetMKeyState(2)
	else 
		Stopclick()
	end
end
-------------------------------------------------------------------------------
-- 停止点击
-------------------------------------------------------------------------------
function Stopclick()
	click = 0
	click2 = 0
	AbortMacro();

end
-------------------------------------------------------------------------------
-- 驱动
-------------------------------------------------------------------------------
function OnEvent(event, arg, family)
--	OutputLogMessage("event = %s, arg = %s, family = %s\n", event, arg, family);
	Apex.onEvent(event, arg)
	if (event == "MOUSE_BUTTON_PRESSED" and arg == 3 and not IsModifierPressed("lalt") and not IsModifierPressed("lshift")) then
		PressAndReleaseKey("c");
		Sleep(300);
		MoveMouseWheel(-1);
		for i = 0, 60 do
			MoveMouseRelative( moveStep, 0 );
			FastSleep(1);
		end
		MoveMouseWheel(-1);
		PressKey("t");
		FastSleep(10);
		ReleaseKey("t");
		for j = 0, 60 do
			MoveMouseRelative( -moveStep, 0 );
			FastSleep(1);	
		end
		PressAndReleaseKey("z");
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 3 and IsModifierPressed("lalt") and not IsModifierPressed("lshift")) then

		PressAndReleaseKey("c");
		Sleep(300);
		MoveMouseWheel(-1);
		for i = 0, 60 do
			MoveMouseRelative( moveStep, 0 );
			FastSleep(1);
		end
		MoveMouseWheel(-1);
		PressKey("t");
		FastSleep(10);
		ReleaseKey("t");
		for j = 0, 60 do
			MoveMouseRelative( -moveStep, 0 );
			FastSleep(1);	
		end
		PlayMacro("DOOM l");
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
end
