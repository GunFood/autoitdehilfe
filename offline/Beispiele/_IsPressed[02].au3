; == Example 2 : _IsPressed using $vkey as array with modifier key checking

#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIvkeysConstants.au3>

Local $asModifierKeys[6] = [0, "VK_SHIFT", "VK_CONTROL", "VK_MENU", "VK_LWIN", "VK_RWIN"]

Local $aKeys[3] = [$VK_ESCAPE, $VK_LBUTTON, $VK_TAB]
While 1
	Local $iRet = _IsPressed($aKeys, Default, True) ; Check modifier
	If Not $iRet And @extended Then ConsoleWrite("The modifier key " & $asModifierKeys[@extended] & " has been pressed. @extended = " & @extended & @CRLF)

	Local $sKey
	Switch $iRet
		Case 1 ; Keyboard ESC
			$sKey = "{ESCAPE}"
			ExitLoop

		Case 2 ; MouseClick Left
			$sKey = "{LBUTTON}"
			ExitLoop

		Case 3 ; Keyboard Tab
			$sKey = "{TAB}"
			ExitLoop

	EndSwitch

	Sleep(100)
WEnd

_IsPressed() ; to DLLClose the default Dll created by the previous _IsPressed_(...)

Send("^z") ; to avoid change in the Scite Window

ConsoleWrite("The key " & $sKey & " has been pressed." & @CRLF)
MsgBox($MB_SYSTEMMODAL, "Result", "The key " & $sKey & " has been pressed.", 2)
