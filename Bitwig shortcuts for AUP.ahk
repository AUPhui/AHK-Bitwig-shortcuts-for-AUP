;;当前版本号V 0.24
;;开发者AUPhui


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; 使用 tilde (~) 来确保这个热键不会阻止其他脚本或程序拦截 ESC 键
~Esc::
{
    ; 检查当前活动窗口是否是 Bitwig Studio.exe
    IfWinActive, ahk_exe Bitwig Studio.exe
    {
        WinGet, windowCount, Count, ahk_class vst3window
        ; 如果存在 'vst3window' 类的窗口，则关闭它
        if (windowCount > 0)
        {
            WinClose, ahk_class vst3window
        }
    }
    return  ; 确保热键结束后不再执行其他操作
}

#IfWinActive ahk_class vst3window
	ESC::
  		  winclose
	return
#IfWinActive

;;让所有第三方插件的空格键发送给bitwig窗口
#IfWinActive ahk_class vst3window
	Space::
  		  ControlSend,, {Space}, ahk_exe Bitwig Studio.exe
	return
#IfWinActive


;;点击minimeter（查看频谱）也可以继续使用bitwig的空格键
#IfWinActive ahk_exe MiniMeters.exe 
	Space::
  		  ControlSend,, {Space}, ahk_exe Bitwig Studio.exe
	return
#IfWinActive

;;以下脚本仅在Bitwig处于活动窗口时启动
#IfWinActive, ahk_exe Bitwig Studio.exe

;>---------------------------刷新脚本--------------------------------< 

	F12::Reload

;>------------------------快速加载插件------------------------------<

	effect(item)				
	{
		Send {t}
		Send {Insert}
		Sleep 200
		Send %item%
		Sleep 200
		Send {Tab}
		Sleep 200
		Send {enter}
		Send {enter}

	Return
	}

;;数字键盘专用
	^NumPad0::effect("MOTT  ") 
	^NumPad1::effect("PRO  C  2 ") 
	^NumPad2::effect("PRO  L  2 ") 
	^NumPad3::effect("PRO  Q  3 ") 
	^NumPad5::effect("TOOL ") 
	^NumPad6::effect("Current  VST3   ") 
	^NumPad8::effect("kontakt  8 ") 
	^NumPad9::effect("PRO  R  2 ") 
	^NumPadAdd::effect("EQ+  ") 


;上方的数字键
	^1::effect("PRO  C  2 ") 
	^2::effect("PRO  L  2 ") 
	^3::effect("PRO  Q  3 ") 
	^5::effect("Tool  ")
	^6::effect("Serum  ")  
	^8::effect("kontakt  8 ") 
	^9::effect("PRO  R  2 ") 


; Alt+滚轮切换选中的轨道
	+WheelDown::Send {Down}
	+WheelUp::Send {Up}

	
; Alt+滚轮垂直缩放
	!WheelDown::Send, ^+{-}
	!WheelUp::Send, ^+{+}




; 一键和弦功能 待开发
	+7::
		Send ^{c}
		Send {up 3}
		Send ^{v}
		Send {up 7}
		Send ^{v}
		Send {up 10}
		Send ^{v}

;>----------------------------End------------------------------<
#IfWinActive
