#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <WindowsConstants.au3>

Global $g_hBtn, $g_idMemo, $g_hBtn2

; Es ist zu beachten, dass dias Handle dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!

Example()

Func Example()
	Local $hGui, $aInfo

	$hGui = GUICreate("Buttons", 400, 400)
	$g_idMemo = GUICtrlCreateEdit("", 10, 100, 390, 284, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	$g_hBtn = _GUICtrlButton_Create($hGui, "Split Button", 10, 10, 120, 30, $BS_SPLITBUTTON)
	_GUICtrlButton_SetSplitInfo($g_hBtn)
	$g_hBtn = _GUICtrlButton_Create($hGui, "Split Button 2", 10, 50, 120, 30, $BS_SPLITBUTTON)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	GUISetState(@SW_SHOW)

	$aInfo = _GUICtrlButton_GetSplitInfo($g_hBtn)
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
	Local $tNMBHOTITEM = DllStructCreate("hwnd hWndFrom;int IDFrom;int Code;dword dwFlags", $lParam)
	Local $nNotifyCode = DllStructGetData($tNMBHOTITEM, "Code")
	Local $nID = DllStructGetData($tNMBHOTITEM, "IDFrom")
	Local $hCtrl = DllStructGetData($tNMBHOTITEM, "hWndFrom")
	Local $iFlags = DllStructGetData($tNMBHOTITEM, "dwFlags")
	Local $sText = ""

	Switch $nNotifyCode
		Case $BCN_HOTITEMCHANGE ; Win XP und neuer
			If BitAND($iFlags, 0x10) = 0x10 Then
				$sText = "$BCN_HOTITEMCHANGE - Eintreten: " & @CRLF

			ElseIf BitAND($iFlags, 0x20) = 0x20 Then
				$sText = "$BCN_HOTITEMCHANGE - Verlassen: " & @CRLF
			EndIf
			MemoWrite($sText & _
					"-----------------------------" & @CRLF & _
					"WM_NOTIFY - Infos:" & @CRLF & _
					"-----------------------------" & @CRLF & _
					"Code" & @TAB & ":" & $nNotifyCode & @CRLF & _
					"CtrlID" & @TAB & ":" & $nID & @CRLF & _
					"CtrlHWnd:" & $hCtrl & @CRLF & _
					_GUICtrlButton_GetText($hCtrl) & @CRLF)
		Case $BCN_DROPDOWN
			MemoWrite("$BCN_DROPDOWN")
			_Popup_Menu($hCtrl)
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
	Local $nID = BitAND($wParam, 0x0000FFFF)
	Local $hCtrl = $lParam
	Local $sText = ""

	Switch $hCtrl
		Case $g_hBtn, $g_hBtn2
			Switch $nNotifyCode
				Case $BN_CLICKED
					$sText = "$BN_CLICKED" & @CRLF
				Case $BN_PAINT
					$sText = "$BN_PAINT" & @CRLF
				Case $BN_PUSHED, $BN_HILITE
					$sText = "$BN_PUSHED, $BN_HILITE" & @CRLF
				Case $BN_UNPUSHED, $BN_UNHILITE
					$sText = "$BN_UNPUSHED" & @CRLF
				Case $BN_DISABLE
					$sText = "$BN_DISABLE" & @CRLF
				Case $BN_DBLCLK, $BN_DOUBLECLICKED
					$sText = "$BN_DBLCLK, $BN_DOUBLECLICKED" & @CRLF
				Case $BN_SETFOCUS
					$sText = "$BN_SETFOCUS" & @CRLF
				Case $BN_KILLFOCUS
					$sText = "$BN_KILLFOCUS" & @CRLF
			EndSwitch
			MemoWrite($sText & _
					"-----------------------------" & @CRLF & _
					"WM_COMMAND - Infos:" & @CRLF & _
					"-----------------------------" & @CRLF & _
					"Code" & @TAB & ":" & $nNotifyCode & @CRLF & _
					"CtrlID" & @TAB & ":" & $nID & @CRLF & _
					"CtrlHWnd:" & $hCtrl & @CRLF & _
					_GUICtrlButton_GetText($hCtrl) & @CRLF)
			Return 0 ; Nur zurückgeben, wenn auf den Button geklickt
	EndSwitch
	; Ausführung der standardmässigen, internen AutoIt3 Nachrichtenkommandos.
	; Diese Zeile kann auch komplett ausgelassen werden.
	; !!! Aber, nur 'Return' (ohne jeglichen Wert) wird zukünftig nicht die
	; Standardmässigen, internen AutoIt3 Nachrichtenkommandos ausführen !!!
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND
