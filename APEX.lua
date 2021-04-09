local Apex = {}
ys=50
-------------------------------------------------------------------------------
-- 快捷键 单独按侧键重置脚本
-------------------------------------------------------------------------------
Apex.keyWeapon1    = 5 -- dpi键 + 上侧键
Apex.keyWeapon2    = 4 -- dpi键 + 下侧键
Apex.keyWeapon3    = 2 -- dpi键 + 右键

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
-- 选择weapon1（Caps切换连点和自动模式，A为自动C为连点）
-------------------------------------------------------------------------------
Apex.onWeapon1 = function ()
A1={"18","18","18","18","18","18","18","18","18","18","18","18","18","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2"}
C1={"15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","15","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2"}
xx={"0","0","0","0","-8","-8","-8","0","0","8","8","0","-8","-8","0","8","8","8","8","-8","-8","-8","-8","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0"}
i=0	
	if IsKeyLockOn("capslock") and not IsModifierPressed("lalt") then				
		xy=A1
		click2 = 1
		Click2()
 	else 
		xy=C1
		click = 1
		Click()
	end
end
-------------------------------------------------------------------------------
-- 选择weapon2（Caps切换连点和自动模式，A为自动C为连点）
-------------------------------------------------------------------------------
Apex.onWeapon2 = function ()
A2={"14","14","14","14","14","14","14","14","14","14",
	"14","14","14","14","14","14","14","14","14","14",
	"14","14","10","10","10","10","10","10","10","10",
	"10","10","10","10","10","10","10","10","10","10",
	"10","10","0","0","0","0","0","0","0","0",
	"0","0","0","0","0","0","0","0","0","0",
	"0","0","0","0","0","0","0","0","0","0"}


C2={"10","10","10","10","10","10","10","10","10","10","10","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2","2"}    

xx={"20","20","20","20","20","0","0","-20","-20","-20",
	"0","0","-6","-6","5","5","-6","-6","5","5",
	"-6","-6","5","5","-6","-6","5","5","-6","-6",
	"0","0","0","0","0","0","0","0","0","0",
	"0","0","0","0","0","0","0","0","0","0",
	"0","0","0","0","0","0","0","0","0","0"}


i=0  
	if IsKeyLockOn("capslock") and not IsModifierPressed("lalt") then				
		xy=A2
		click2 = 1
		Click2()
	
 	else 
		xy=C2
		click2 = 1
		Click2()
	end
end
-------------------------------------------------------------------------------
-- 选择weapon3（Caps切换连点和自动模式，A为自动C为连点）
-------------------------------------------------------------------------------
Apex.onWeapon3 = function ()

A3={"0","0","0","0","0","0","0","0","32","32",
	"32","32","16","16","16","16","16","16","16","16",
	"4","4","4","4","4","4","4","4","8","8",
	"4","4","4","4","4","4","4","4","16","16",
	"16","16","10","10","10","10","10","10","10","10",
	"10","10","10","10","10","10","10","10","10","10",
	"10","10","10","10","10","10","10","10","10","10"}

C3={"0","0","0","0","0","0","0","0","32","32",
	"32","32","16","16","16","16","16","16","16","16",
	"4","4","4","4","4","4","4","4","8","8",
	"4","4","4","4","4","4","4","4","16","16",
	"16","16","10","10","10","10","10","10","10","10",
	"10","10","10","10","10","10","10","10","10","10",
	"10","10","10","10","10","10","10","10","10","10"}

xx={"0","0","0","0","0","0","0","0","-20","-20",
    "10","10","0","0","5","5","5","5","5","5",
    "0","0","-10","-10","-10","-10","-10","-10","0","0",
    "10","10","10","10","10","10","10","10","5","5",
    "5","5","5","5","5","5","5","5","5","5",
    "0","0","0","0","0","0","0","0","0","0",
    "0","0","0","0","0","0","0","0","0","0"}
i=0  
	if IsKeyLockOn("capslock") and not IsModifierPressed("lalt") then				
		xy=A3
		click2 = 1
		Click2()
 	else 
		xy=C3
		click2 = 1
		Click2()
	end
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
		Sleep(30);
		PressAndReleaseKey("P")
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
		Sleep (30)
		PressAndReleaseKey("1")
		-- 选择2
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == Apex.keyWeapon2 and Apex.isGKeyPressed == true then
		OutputLogMessage("use weapon2\n")
		Apex.currentWeapon = "weapon2"
		PressAndReleaseKey("e")
		Sleep (30)
		PressAndReleaseKey("1")
		-- 选择3
	elseif event == "MOUSE_BUTTON_PRESSED" and arg == Apex.keyWeapon3 and Apex.isGKeyPressed == true then
		OutputLogMessage("use weapon3\n")
		Apex.currentWeapon = "weapon3"
		PressAndReleaseKey("e")
		Sleep (30)
		PressAndReleaseKey("2")

	-- 鼠标左键被按下
	elseif (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and not IsModifierPressed("lalt")) then
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
-- 按住（需新建一个名为liandian的按键宏，按键为副射击键）
-------------------------------------------------------------------------------	
function Click() 
	if(i>69)then
		i=0
	end
		i=i+1
		MoveMouseRelative(0, xy[i])
		PressAndReleaseMouseButton(1)
		Sleep (ys)
 		PlayMacro("liandian");
		Sleep (ys)
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
function Click2() 
	if(i>69)then
		i=0
	end
		i=i+1
		if not IsKeyLockOn("capslock") and Apex.currentWeapon == "weapon2" then
			MoveMouseRelative(0, xy[i])
			PressMouseButton(1)
			Sleep (ys)
		elseif Apex.currentWeapon == "weapon3" and IsKeyLockOn("scrolllock") then
			MoveMouseRelative(xx[i], xy[i])
			PressMouseButton(1)
			Sleep (ys)
		elseif Apex.currentWeapon == "weapon3" and not IsKeyLockOn("scrolllock") then
			MoveMouseRelative(xx[i+7], xy[i+7])
			PressMouseButton(1)
			Sleep (ys)

		else 
			MoveMouseRelative(xx[i], xy[i])
			PressMouseButton(1)
			Sleep (ys)
		end

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
end

-------------------------------------------------------------------------------
-- 驱动
-------------------------------------------------------------------------------
function OnEvent(event, arg)
--	OutputLogMessage("event = %s, arg = %s", event, arg);
	Apex.onEvent(event, arg)
	if(event == "MOUSE_BUTTON_PRESSED" and arg == 3 and not IsModifierPressed("lshift")) then
	PlayMacro("O_pathfinder"); -- O_pathfinder -- O_fuse
	Sleep(100)

	elseif(event == "MOUSE_BUTTON_PRESSED" and arg == 3 and IsModifierPressed("lshift")) then
	PlayMacro("O_pathfinder_long"); --O_octane drop
	Sleep(100)

	elseif(event == "MOUSE_BUTTON_PRESSED" and arg == 2 and IsModifierPressed("lshift")) then
	PlayMacro("O_G");
	Sleep(100)

	end
end