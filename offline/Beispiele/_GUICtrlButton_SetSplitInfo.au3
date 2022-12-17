#include <Extras\WM_NOTIFY.au3>
#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <WindowsConstants.au3>

Global $g_hBtn, $g_idMemo, $g_hBtn2

; Es ist zu beachten, dass dias Handle dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!

Example()

Func Example()
	Local $hGUI = GUICreate('Button: Informationen für ein "Split"-Button-Control (v' & @AutoItVersion & ")", 600, 400)
	$g_idMemo = GUICtrlCreateEdit("", 10, 100, 390, 284, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	$g_hBtn = _GUICtrlButton_Create($hGUI, "Split Button", 10, 10, 120, 30, $BS_SPLITBUTTON)
	_GUICtrlButton_SetSplitInfo($g_hBtn)
	$g_hBtn = _GUICtrlButton_Create($hGUI, "Split Button 2", 10, 50, 120, 30, $BS_SPLITBUTTON)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	_WM_NOTIFY_Register($g_idMemo)

	GUISetState(@SW_SHOW)

	Local $aInfo = _GUICtrlButton_GetSplitInfo($g_hBtn)
	MemoWrite("Split Info" & @CRLF & "----------------")
	For $x = 0 To 3
		MemoWrite("$ainfo[" & $x & "] = " & $aInfo[$x])
	Next
	MemoWrite("Split Info" & @CRLF & "----------------")

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local Const $BCN_HOTITEMCHANGE = -1249
	Local $tagNMBHOTITEM = $tagNMHDR & ";dword dwFlags"
	Local $tNMBHOTITEM = DllStructCreate($tagNMBHOTITEM, $lParam)
	Local $iCode = DllStructGetData($tNMBHOTITEM, "Code")
	Local $hWndFrom = DllStructGetData($tNMBHOTITEM, "hWndFrom")
	Local $iFlags = DllStructGetData($tNMBHOTITEM, "dwFlags")
	Local $sText = ""

	Switch $iCode
		Case $BCN_HOTITEMCHANGE     ; Win XP und neuer
			$sText = "Text=" & _GUICtrlButton_GetText($hWndFrom)
			If BitAND($iFlags, 0x10) = 0x10 Then
				_WM_NOTIFY_DebugEvent("$BCN_HOTITEMCHANGE - Eintreten", $tagNMBHOTITEM, $lParam, "IDFrom", $sText)

			ElseIf BitAND($iFlags, 0x20) = 0x20 Then
				_WM_NOTIFY_DebugEvent("$BCN_HOTITEMCHANGE - Verlassen", $tagNMBHOTITEM, $lParam, "IDFrom", $sText)

			EndIf
		Case $BCN_DROPDOWN
			MemoWrite("$BCN_DROPDOWN")
			_Popup_Menu($hWndFrom)
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _Popup_Menu($hCtrl)
	Local $hMenu
	Local Enum $e_idOpen = 1000, $e_idSave, $idInfo
	$hMenu = _GUICtrlMenu_CreatePopup()
	_GUICtrlMenu_InsertMenuItem($hMenu, 0, "Öffnen", $e_idOpen)
	_GUICtrlMenu_InsertMenuItem($hMenu, 1, "Speichern", $e_idSave)
	_GUICtrlMenu_InsertMenuItem($hMenu, 3, "", 0)
	_GUICtrlMenu_InsertMenuItem($hMenu, 3, "Info", $idInfo)
	Switch _GUICtrlMenu_TrackPopupMenu($hMenu, $hCtrl, -1, -1, 1, 1, 2)
		Case $e_idOpen
			MemoWrite("Öffnen    - Gewählt")
		Case $e_idSave
			MemoWrite("Speichern - Gewählt")
		Case $idInfo
			MemoWrite("Info      - Gewählt")
	EndSwitch
	_GUICtrlMenu_DestroyMenu($hMenu)
EndFunc   ;==>_Popup_Menu

; Reagiere auf einen Klick auf dem Button
Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg
	Local $nNotifyCode = BitShift($wParam, 16)
	Local $iCode = BitShift($wParam, 16)
	Local $hCtrl = $lParam
	Local $sCode, $sText

	Switch $hCtrl
		Case $g_hBtn, $g_hBtn2
			Switch $iCode
				Case $BN_CLICKED
					$sCode = "$BN_CLICKED"
				Case $BN_PAINT
					$sCode = "$BN_PAINT"
				Case $BN_PUSHED
					$sCode = "$BN_PUSHED"
				Case $BN_HILITE
					$sCode = "$BN_HILITE"
				Case $BN_UNPUSHED
					$sCode = "$BN_UNPUSHED"
				Case $BN_UNHILITE
					$sCode = "$BN_UNHILITE"
				Case $BN_DISABLE
					$sCode = "$BN_DISABLE"
				Case $BN_DBLCLK
					$sCode = "$BN_DBLCLK"
				Case $BN_DOUBLECLICKED
					$sCode = "$BN_DOUBLECLICKED"
				Case $BN_SETFOCUS
					$sCode = "$BN_SETFOCUS"
				Case $BN_KILLFOCUS
					$sCode = "$BN_KILLFOCUS"
			EndSwitch
			$sText = "Text=" & _GUICtrlButton_GetText($hCtrl)
			_WM_NOTIFY_DebugEvent($sCode, $tagNMHDR, $lParam, "IDFrom", $sText)
			Return 0 ; Nur zurückgeben, wenn auf den Button geklickt
	EndSwitch
	; Ausführung der standardmässigen, internen AutoIt3 Nachrichtenkommandos.
	; Diese Zeile kann auch komplett ausgelassen werden.
	; !!! Aber, nur 'Return' (ohne jeglichen Wert) wird zukünftig nicht die
	; Standardmässigen, internen AutoIt3 Nachrichtenkommandos ausführen !!!
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND
