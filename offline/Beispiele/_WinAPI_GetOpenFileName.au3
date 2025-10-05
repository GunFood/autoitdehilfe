#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <WinAPIConstants.au3>
#include <WinAPIDlg.au3>
#include <WindowsStylesConstants.au3>

Global $_g_idLst_Memo

_Example_Defaults()
_Example_ExplorerStyleMultiSelect()
_Example_OldStyle()
_Example_ExplorerStyleSingleSelect()
_Example_ExplorerStyle_NoPlaceBar()

Func _Example_Defaults()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName (mit Standardeinstellungen)", 450, 296)
	$_g_idLst_Memo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	$idBtn_Dialog = GUICtrlCreateButton("Öffnen-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetOpenFileName() ; Verwendet Standards
				If @error Then
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						_MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_Defaults

Func _Example_ExplorerStyleMultiSelect()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName im Explorer-Stil (Mehrfachauswahl)", 450, 296)
	$_g_idLst_Memo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	$idBtn_Dialog = GUICtrlCreateButton("Öffnen-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetOpenFileName("Mein Datei-Öffnen-Dialog", _
						"Textdatei (*.txt;*.au3)", ".", @ScriptName, "", 1, _
						BitOR($OFN_ALLOWMULTISELECT, $OFN_EXPLORER), 0, $hGui)
				If @error Then
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						_MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_ExplorerStyleMultiSelect

Func _Example_OldStyle()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName im alten Stil (Mehrfachauswahl)", 450, 296)
	$_g_idLst_Memo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	$idBtn_Dialog = GUICtrlCreateButton("Öffnen-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetOpenFileName("Mein Datei-Öffnen-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", @ScriptName, _
						"", 2, $OFN_ALLOWMULTISELECT, 0, $hGui)
				If @error Then
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						_MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_OldStyle

Func _Example_ExplorerStyleSingleSelect()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName im Explorer-Stil (Einfachauswahl)", 450, 296)
	_MemoCreate(2, 32, 396, 226, $WS_HSCROLL)
	$idBtn_Dialog = GUICtrlCreateButton("Open Dialog", 155, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetOpenFileName("Mein Datei-Öffnen-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", @ScriptName, _
						"", 2, 0, 0, $hGui)
				If @error Then
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						_MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_ExplorerStyleSingleSelect

Func _Example_ExplorerStyle_NoPlaceBar()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetOpenFileName im Explorer-Stil (ohne Favoriten)", 450, 296)
	_MemoCreate(2, 32, 396, 226, $WS_HSCROLL)
	$idBtn_Dialog = GUICtrlCreateButton("Öffnen-Dialog", 155, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetOpenFileName("Mein Datei-Öffnen-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", @ScriptName, _
						"", 2, $OFN_EXPLORER, $OFN_EX_NOPLACESBAR, $hGui)
				If @error Then
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						_MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_ExplorerStyle_NoPlaceBar
