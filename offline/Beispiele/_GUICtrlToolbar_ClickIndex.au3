#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <StructureConstants.au3>
#include <WinAPIConstants.au3>
#include <WindowsNotifsConstants.au3>
#include <WindowsStylesConstants.au3>

Global $g_hToolbar
Global $g_iItem ; ID des Buttons der mit der Nachricht verknüpft ist
Global Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp

Example()

Func Example()
	Local $hGUI, $aSize, $aStrings[4]

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 600, 400)
	$g_hToolbar = _GUICtrlToolbar_Create($hGUI)
	$aSize = _GUICtrlToolbar_GetMaxSize($g_hToolbar)

	_MemoCreate(2, $aSize[1] + 30, 596, 396 - ($aSize[1] + 30), $WS_VSCROLL)
	GUISetState(@SW_SHOW)
	GUIRegisterMsg($WM_NOTIFY, "_WM_NOTIFY")

	; Fügt die Standard Systembitmaps hinzu
	_GUICtrlToolbar_AddBitmap($g_hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)

	; Fügt Strings hinzu
	$aStrings[0] = _GUICtrlToolbar_AddString($g_hToolbar, "&Neu")
	$aStrings[1] = _GUICtrlToolbar_AddString($g_hToolbar, "&Öffnen")
	$aStrings[2] = _GUICtrlToolbar_AddString($g_hToolbar, "&Speichern")
	$aStrings[3] = _GUICtrlToolbar_AddString($g_hToolbar, "&Hilfe")

	; Fügt die Buttons hinzu
	_GUICtrlToolbar_AddButton($g_hToolbar, $e_idNew, $STD_FILENEW, $aStrings[0])
	_GUICtrlToolbar_AddButton($g_hToolbar, $e_idOpen, $STD_FILEOPEN, $aStrings[1])
	_GUICtrlToolbar_AddButton($g_hToolbar, $e_idSave, $STD_FILESAVE, $aStrings[2])
	_GUICtrlToolbar_AddButtonSep($g_hToolbar)
	_GUICtrlToolbar_AddButton($g_hToolbar, $e_idHelp, $STD_HELP, $aStrings[3])

	; Klickt auf den Speichern-Button durch Verwendung des Abkürzungsbefehls
	_GUICtrlToolbar_ClickIndex($g_hToolbar, 2, "left", True)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

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
					_MemoWrite("$NM_LDOWN: Angeklicktes Item: " & $g_iItem & " bei Index: " & _GUICtrlToolbar_CommandToIndex($g_hToolbar, $g_iItem))
					;----------------------------------------------------------------------------------------------
				Case $TBN_HOTITEMCHANGE
					$tNMTBHOTITEM = DllStructCreate($tagNMTBHOTITEM, $lParam)
					$i_idOld = DllStructGetData($tNMTBHOTITEM, "idOld")
					$i_idNew = DllStructGetData($tNMTBHOTITEM, "idNew")
					$g_iItem = $i_idNew
					$iFlags = DllStructGetData($tNMTBHOTITEM, "dwFlags")
					If BitAND($iFlags, $HICF_LEAVING) = $HICF_LEAVING Then
						_MemoWrite("$HICF_LEAVING: " & $i_idOld)
					Else
						Switch $i_idNew
							Case $e_idNew
								;----------------------------------------------------------------------------------------------
								_MemoWrite("$TBN_HOTITEMCHANGE: $e_idNew")
								;----------------------------------------------------------------------------------------------
							Case $e_idOpen
								;----------------------------------------------------------------------------------------------
								_MemoWrite("$TBN_HOTITEMCHANGE: $e_idOpen")
								;----------------------------------------------------------------------------------------------
							Case $e_idSave
								;----------------------------------------------------------------------------------------------
								_MemoWrite("$TBN_HOTITEMCHANGE: $e_idSave")
								;----------------------------------------------------------------------------------------------
							Case $e_idHelp
								;----------------------------------------------------------------------------------------------
								_MemoWrite("$TBN_HOTITEMCHANGE: $e_idHelp")
								;----------------------------------------------------------------------------------------------
						EndSwitch
					EndIf
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>_WM_NOTIFY
