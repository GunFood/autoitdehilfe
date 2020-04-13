#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <WinAPIError.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $id_SetData, $id_GetData, $hMemory, $tData

	; Erstellt eine GUI
	$hGui = GUICreate("Zwischenablage", 600, 450)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	$id_SetData = GUICtrlCreateButton("Schreibt Daten in die Zwischenablage", 50, 410, 220, 30)
	$id_GetData = GUICtrlCreateButton("Holt Daten aus der Zwischenablage", 300, 410, 220, 30)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $id_SetData
				_ClipBoard_SetData("ClipBoard Testdaten")
			Case $id_GetData
				; Öffnet die Zwischenablage
				If _ClipBoard_Open($hGui) Then

					; Liest Text aus der Zwischenablage
					$hMemory = _ClipBoard_GetDataEx($CF_TEXT)
					If $hMemory = 0 Then _WinAPI_ShowError("_ClipBoard_GetDataEx fehlgeschlagen!")
					$tData = DllStructCreate("char Text[8192]", $hMemory)
					MemoWrite(DllStructGetData($tData, "Text"))

					; Schließt die Zwischenablage
					_ClipBoard_Close()
				Else
					_WinAPI_ShowError("_ClipBoard_Open fehlgeschlagen!")
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
