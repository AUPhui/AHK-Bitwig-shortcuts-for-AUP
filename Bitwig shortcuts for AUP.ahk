;;让所有第三方插件的空格键发送给bitwig窗口
#IfWinActive ahk_exe BitwigPluginHost-X64-SSE41.exe 
    Space::
       
        IfWinExist ahk_exe Bitwig Studio.exe
        {
            WinActivate
            Send {Space}
        }
        return
#IfWinActive

;;点击minimeter（查看频谱）也可以继续使用bitwig的空格键
#IfWinActive ahk_exe MiniMeters.exe 
    Space::
       
        IfWinExist ahk_exe Bitwig Studio.exe
        {
            WinActivate
            Send {Space}
        }
        return
#IfWinActive


#IfWinActive, ahk_exe Bitwig Studio.exe

;>---------------------------刷新脚本--------------------------------< 

	F12::Reload

;>------------------------快速加载插件------------------------------<

	effect(item)				
	{
		Send {t}
		Send {Insert}
		Sleep 300
		Send %item%
		Sleep 300
		Send {Tab}
		Sleep 300
		Send {enter}
		Send {enter}

	Return
	}

;;数字键盘专用
	^NumPad1::effect("Fabfilter  C  2 ") 
	^NumPad2::effect("Fabfilter  L  2 ") 
	^NumPad3::effect("Fabfilter  Q  3 ") 
	^NumPad8::effect("kontakt  8 ") 
	^NumPad9::effect("Fabfilter  R  2 ") 


;小键盘的数字键
	^1::effect("Fabfilter  C  2 ") 
	^2::effect("Fabfilter  L  2 ") 
	^3::effect("Fabfilter  Q  3 ") 
	^4::effect("Tool")
	^6::effect("Serum  ")  
	^8::effect("kontakt  8 ") 
	^9::effect("Fabfilter  R  2 ") 


;>----------------------------End------------------------------<
#IfWinActive