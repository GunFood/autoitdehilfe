#include <MsgBoxConstants.au3>
#include <StructureConstants.au3>
#include <WinAPIConstants.au3>
#include <WinAPISys.au3>
#include <WindowsConstants.au3>

Global $g_hHook, $g_hStub_KeyProc, $g_sBuffer = ""

Example()

Func Example()
	OnAutoItExitRegister("Cleanup")

	Local $hMod

	$g_hStub_KeyProc = DllCallbackRegister("_KeyProc", "long", "int;wparam;lparam")
	$hMod = _WinAPI_GetModuleHandle(0)
	$g_hHook = _WinAPI_SetWindowsHookEx($WH_KEYBOARD_LL, DllCallbackGetPtr($g_hStub_KeyProc), $hMod)

	MsgBox($MB_SYSTEMMODAL, "", "Klicke OK, dann gib im Editor (Notepad) ein:" & _
			@CRLF & @CRLF & "Jon" & @CRLF & "AutoIt" & @CRLF & @CRLF & "Drücke ESC zum Beenden des Skripts." & @CRLF & "(Das Editorfenster darfst du selber schließen!)")

	Run("notepad.exe")
	WinWait("[CLASS:Notepad]")
	WinActivate("[CLASS:Notepad]")

	While 1
		Sleep(10)
	WEnd
EndFunc   ;==>Example

Func EvaluateKey($iKeycode)
	If (($iKeycode > 64) And ($iKeycode < 91)) _ ; A - z
			Or (($iKeycode > 96) And ($iKeycode < 123)) _ ; A - Z
			Or (($iKeycode > 47) And ($iKeycode < 58)) Then ; 0 - 9
		$g_sBuffer &= Chr($iKeycode)
		Switch $g_sBuffer
			Case "Jon"
				ToolTip("Was würdest du sagen?")
			Case "AutoIt"
				ToolTip("AutoIt ist genial!")
		EndSwitch
	ElseIf ($iKeycode > 159) And ($iKeycode < 164) Then
		Return
	ElseIf ($iKeycode = 27) Then ; ESC-Taste
		Exit
	Else
		$g_sBuffer = ""
	EndIf
EndFunc   ;==>EvaluateKey

;===========================================================
; Callback-Funktion
;===========================================================
Func _KeyProc($nCode, $wParam, $lParam)
	Local $tKEYHOOKS
	$tKEYHOOKS = DllStructCreate($tagKBDLLHOOKSTRUCT, $lParam)
	If $nCode < 0 Then
		Return _WinAPI_CallNextHookEx($g_hHook, $nCode, $wParam, $lParam)
	EndIf
	If $wParam = $WM_KEYDOWN Then
		EvaluateKey(DllStructGetData($tKEYHOOKS, "vkCode"))
	Else
		Local $iFlags = DllStructGetData($tKEYHOOKS, "flags")
		Switch $iFlags
			Case $LLKHF_ALTDOWN
				ConsoleWrite("$LLKHF_ALTDOWN" & @CRLF)
			Case $LLKHF_EXTENDED
				ConsoleWrite("$LLKHF_EXTENDED" & @CRLF)
			Case $LLKHF_INJECTED
				ConsoleWrite("$LLKHF_INJECTED" & @CRLF)
			Case $LLKHF_UP
				ConsoleWrite("$LLKHF_UP: Tastencode (scanCode) - " & DllStructGetData($tKEYHOOKS, "scanCode") & @TAB & " Virtueller Tastencode (vkCode) - " & DllStructGetData($tKEYHOOKS, "vkCode") & @CRLF)
		EndSwitch
	EndIf
	Return _WinAPI_CallNextHookEx($g_hHook, $nCode, $wParam, $lParam)
EndFunc   ;==>_KeyProc

Func Cleanup()
	_WinAPI_UnhookWindowsHookEx($g_hHook)
	DllCallbackFree($g_hStub_KeyProc)
EndFunc   ;==>Cleanup
