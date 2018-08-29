#include <GUIConstantsEx.au3>
#include <StructureConstants.au3>
#include <WinAPIDlg.au3>
#include <WindowsConstants.au3>

;#include <StructureConstants.au3>

Global $g_idMemo

_Example_Defaults()
_Example_ExplorerStyle()
_Example_OldStyle()
_Example_ExplorerStyle_NoPlaceBar()

Func _Example_Defaults()
	Local $hGui, $id_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetSaveFileName mit Standardeinstellungen", 450, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	$id_Dialog = GUICtrlCreateButton("Speichern-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $id_Dialog
				$aFile = _WinAPI_GetSaveFileName() ; Standard
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_Defaults

Func _Example_ExplorerStyle()
	Local $hGui, $id_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetSaveFileName im Explorer-Stil", 450, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	$id_Dialog = GUICtrlCreateButton("Speichern-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $id_Dialog
				$aFile = _WinAPI_GetSaveFileName("Mein Datei-Speichern-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", _
						"", "au3", 2, 0, 0, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_ExplorerStyle

Func _Example_OldStyle()
	Local $hGui, $id_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetSaveFileName im alten Stil", 450, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	$id_Dialog = GUICtrlCreateButton("Speichern-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $id_Dialog
				$aFile = _WinAPI_GetSaveFileName("Mein Datei-Speichern-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", "", _
						"", 2, $OFN_ALLOWMULTISELECT, 0, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_OldStyle

Func _Example_ExplorerStyle_NoPlaceBar()
	Local $hGui, $id_Dialog, $aFile, $sError

	; Erstellt eine GUI
	$hGui = GUICreate("GetSaveFileName im Explorer-Stil (ohne Favoriten)", 450, 296)
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 446, 226, $WS_HSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	$id_Dialog = GUICtrlCreateButton("Speichern-Dialog", 180, 270, 90, 20)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $id_Dialog
				$aFile = _WinAPI_GetSaveFileName("Mein Datei-Speichern-Dialog", _
						"Textdatei (*.txt)|AutoIt-Datei (*.au3)", ".", "", _
						"", 2, 0, $OFN_EX_NOPLACESBAR, $hGui)
				If $aFile[0] = 0 Then
					$sError = _WinAPI_CommDlgExtendedError()
					MemoWrite("CommDlgExtendedError (" & @error & "): " & $sError)
				Else
					For $x = 1 To $aFile[0]
						MemoWrite($aFile[$x])
					Next
				EndIf
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete($hGui)
EndFunc   ;==>_Example_ExplorerStyle_NoPlaceBar

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
