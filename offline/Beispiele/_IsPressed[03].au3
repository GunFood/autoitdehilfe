; == Example 3 : _Ispressed using $vkey as integer with modifier key checking

#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIvkeysConstants.au3>

Example()
Func Example()
	While 1
		If _IsPressed($VK_F2, Default, True) Then
			ConsoleWrite("_IsPressed - F2 (without any modifier keys pressed) was pressed." & @CRLF)
			; Wait until key is released.
			While _IsPressed($VK_F2, Default, True)
				Sleep(100)
			WEnd
			ConsoleWrite("_IsPressed - F2 (without any modifier keys pressed) was released." & @CRLF)
		ElseIf _IsPressed($VK_ESCAPE) Then
			MsgBox($MB_SYSTEMMODAL, "_IsPressed", "The Esc Key was pressed, therefore we will close the application.", 3)
			ExitLoop
		EndIf
		Sleep(100)
	WEnd

	_IsPressed() ; to release the internal handle created by previous call to _IsPressed(...)

EndFunc   ;==>Example
