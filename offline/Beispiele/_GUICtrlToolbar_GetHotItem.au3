#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsConstants.au3>

Global $g_hToolbar, $g_idMemo
Global $g_iItem ; ID des Buttons der mit der Nachricht verknüpft ist
Global Enum $id_New = 1000, $e_idOpen, $e_idSave, $e_idHelp

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate('Toolbar: Setzt und ermittelt das "hot" Item Get Hot Item (v' & @AutoItVersion & ")", 600, 400)
	$g_hToolbar = _GUICtrlToolbar_Create($hGUI)
	Local $aSize = _GUICtrlToolbar_GetMaxSize($g_hToolbar)

	$g_idMemo = GUICtrlCreateEdit("", 2, $aSize[1] + 20, 596, 396 - ($aSize[1] + 20), $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)
	GUIRegisterMsg($WM_NOTIFY, "_WM_NOTIFY")

	; Setzt das ANSI Format
;~     _GUICtrlToolbar_SetUnicodeFormat($hToolbar, False)

	; Fügt die Standard Systembitmaps hinzu
	_GUICtrlToolbar_AddBitmap($g_hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)

	; Fügt die Buttons hinzu
	_GUICtrlToolbar_AddButton($g_hToolbar, $id_New, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($g_hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($g_hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($g_hToolbar)
	_GUICtrlToolbar_AddButton($g_hToolbar, $e_idHelp, $STD_HELP)

	; Ermittelt das "hot" Item
	Local $iHotItem = _GUICtrlToolbar_GetHotItem($g_hToolbar)
	MemoWrite("vor $iHotItem= " & $iHotItem)

	; Setzt das "hot" Item
	_GUICtrlToolbar_SetHotItem($g_hToolbar, 2)
	; Ermittelt das "hot" Item
	$iHotItem = _GUICtrlToolbar_GetHotItem($g_hToolbar)
	MemoWrite("nach $iHotItem= " & $iHotItem)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; WM_NOTIFY-Eventhandler
Func _WM_NOTIFY($hWndGUI, $iMsgID, $wParam, $lParam)
	#forceref $hWndGUI, $iMsgID, $wParam
	Local $tNMHDR, $hwndFrom, $code, $i_idNew, $iFlags, $i_idOld
	Local $tNMTBHOTITEM
	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hwndFrom = DllStructGetData($tNMHDR, "hWndFrom")
	$code = DllStructGetData($tNMHDR, "Code")
	Switch $hwndFrom
		Case $g_hToolbar
			Switch $code
				Case $NM_LDOWN
					;----------------------------------------------------------------------------------------------
					MemoWrite("$NM_LDOWN: Angeklicktes Item: " & $g_iItem & " bei Index: " & _GUICtrlToolbar_CommandToIndex($g_hToolbar, $g_iItem))
					;----------------------------------------------------------------------------------------------
				Case $TBN_HOTITEMCHANGE
					$tNMTBHOTITEM = DllStructCreate($tagNMTBHOTITEM, $lParam)
					$i_idOld = DllStructGetData($tNMTBHOTITEM, "idOld")
					$i_idNew = DllStructGetData($tNMTBHOTITEM, "idNew")
					$g_iItem = $i_idNew
					$iFlags = DllStructGetData($tNMTBHOTITEM, "dwFlags")
					If BitAND($iFlags, $HICF_LEAVING) = $HICF_LEAVING Then
						MemoWrite("$HICF_LEAVING: " & $i_idOld)
					Else
						Switch $i_idNew
							Case $id_New
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $e_idNew")
								;----------------------------------------------------------------------------------------------
							Case $e_idOpen
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $e_idOpen")
								;----------------------------------------------------------------------------------------------
							Case $e_idSave
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $e_idSave")
								;----------------------------------------------------------------------------------------------
							Case $e_idHelp
								;----------------------------------------------------------------------------------------------
								MemoWrite("$TBN_HOTITEMCHANGE: $idHelp")
								;----------------------------------------------------------------------------------------------
						EndSwitch
					EndIf
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>_WM_NOTIFY
