#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <GuiToolTip.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIConstants.au3>
#include <WindowsConstants.au3>

Global Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $idHelp

Example()

Func Example()
	Local $hGui, $hToolbar, $hToolTip

	; Erstellt eine GUI
	$hGui = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGui)
	GUISetState(@SW_SHOW)

	; Erstellt eine ToolTip
	$hToolTip = _GUIToolTip_Create($hToolbar)
	_GUICtrlToolbar_SetToolTips($hToolbar, $hToolTip)

	; Fügt die Standard-Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; Zeigt das Handle des ToolTips
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des ToolTips .: 0x" & Hex(_GUICtrlToolbar_GetToolTips($hToolbar)) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlToolbar_GetToolTips($hToolbar)) & " IsHWnd = " & IsHWnd(_GUICtrlToolbar_GetToolTips($hToolbar)))

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Verarbeitet die WM_NOTIFY Nachricht
Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam, $lParam
	Local $tInfo, $iID, $iCode

	$tInfo = DllStructCreate($tagNMTTDISPINFO, $lParam)
	$iCode = DllStructGetData($tInfo, "Code")
	If $iCode = $TTN_GETDISPINFOW Then
		$iID = DllStructGetData($tInfo, "IDFrom")
		Switch $iID
			Case $e_idNew
				DllStructSetData($tInfo, "aText", "Neu")
			Case $e_idOpen
				DllStructSetData($tInfo, "aText", "Öffnen")
			Case $e_idSave
				DllStructSetData($tInfo, "aText", "Speichern")
			Case $idHelp
				DllStructSetData($tInfo, "aText", "Hilfe")
		EndSwitch
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
