#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Global $g_iPID

; Hover over one of the characters in the Charmap app to get a tooltip to display, then press 'g' to
; retrieve its information.
HotKeySet('g', "_Read_Tip")

Example()

Func Example()
	; Run character map program
	$g_iPID = Run("charmap.exe")
	; Wait for it to become the active window
;~ 	WinWaitActive("Character Map", "", 10)
	WinWaitActive("Table des caract", "", 10)

	; Show the tooltip associated with the button
	Opt("MouseCoordMode", 2)
	MouseMove(50, 72, 0)
	Sleep(250)

	 _Read_Tip()

	While ProcessExists($g_iPID)
		Sleep(100)
	WEnd
EndFunc   ;==>Example

Func _Read_Tip()
	; Get list of tooltips
	Local $aTipList = WinList("[CLASS:tooltips_class32]")
	WinWaitActive("Table des caract", "", 10)

	; See which belong to your app
	For $i = 1 To $aTipList[0][0]
		If WinGetProcess($aTipList[$i][1]) = $g_iPID Then ; See which one is active for your app
			; If one is active then display it
			Local $aTool = _GUIToolTip_GetCurrentTool($aTipList[$i][1])
			MsgBox($MB_SYSTEMMODAL, "Tooltip info $i = " & $i, "Flags: " & @TAB & _GUIToolTip_BitsToTTF($aTool[0]) & @CRLF & _
					"HWnd: " & @TAB & $aTool[1] & @CRLF & _
					"ID: " & @TAB & $aTool[2] & @CRLF & _
					"Left X:" & @TAB & $aTool[3] & @CRLF & _
					"Left Y:" & @TAB & $aTool[4] & @CRLF & _
					"Right X:" & @TAB & $aTool[5] & @CRLF & _
					"Right Y:" & @TAB & $aTool[6] & @CRLF & _
					"Instance:" & @TAB & $aTool[7] & @CRLF & _
					"Text:" & @TAB & $aTool[8] & @TAB & @TAB & @CRLF & _
					"lParam:" & @TAB & $aTool[9])
		EndIf
	Next
EndFunc   ;==>_Read_Tip
