#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <WinAPIConstants.au3>
#include <WinAPIDlg.au3>
#include <WindowsStylesConstants.au3>

_Example_Defaults()
_Example_ExplorerStyle()
_Example_OldStyle()
_Example_ExplorerStyle_NoPlaceBar()

Func _Example_Defaults()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetSaveFileName mit Standardeinstellungen", 450, 296)
	$_g_idLst_Memo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($_g_idLst_Memo, 9, 400, 0, "Courier New")
	$idBtn_Dialog = GUICtrlCreateButton("Speichern-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetSaveFileName() ; Standard
				If @error Then
					Local $iError = @error
					Local $iExtended = @extended
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & $iError & "/" & $iExtended & "): " & $sError)
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

Func _Example_ExplorerStyle()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetSaveFileName im Explorer-Stil", 450, 296)
	_MemoCreate(2, 32, 396, 226, $WS_HSCROLL)
	$idBtn_Dialog = GUICtrlCreateButton("Speichern-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetSaveFileName("Mein Datei-Speichern-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", _
						"", "au3", 2, 0, 0, $hGui)
				If @error Then
					Local $iError = @error
					Local $iExtended = @extended
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & $iError & "/" & $iExtended & "): " & $sError)
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
EndFunc   ;==>_Example_ExplorerStyle

Func _Example_OldStyle()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetSaveFileName im alten Stil", 450, 296)
	_MemoCreate(2, 32, 396, 226, $WS_HSCROLL)
	$idBtn_Dialog = GUICtrlCreateButton("Speichern-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetSaveFileName("Mein Datei-Speichern-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", "", _
						"", 2, $OFN_ALLOWMULTISELECT, 0, $hGui)
				If @error Then
					Local $iError = @error
					Local $iExtended = @extended
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & $iError & "/" & $iExtended & "): " & $sError)
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

Func _Example_ExplorerStyle_NoPlaceBar()
	Local $hGui, $idBtn_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetSaveFileName im Explorer-Stil (ohne Favoriten)", 450, 296)
	_MemoCreate(2, 32, 396, 226, $WS_HSCROLL)
	$idBtn_Dialog = GUICtrlCreateButton("Speichern-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $idBtn_Dialog
				$aFile = _WinAPI_GetSaveFileName("Mein Datei-Speichern-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", "", _
						"", 2, 0, $OFN_EX_NOPLACESBAR, $hGui)
				If @error Then
					Local $iError = @error
					Local $iExtended = @extended
					$sError = _WinAPI_CommDlgExtendedError()
					_MemoWrite("CommDlgExtendedError (" & $iError & "/" & $iExtended & "): " & $sError)
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
