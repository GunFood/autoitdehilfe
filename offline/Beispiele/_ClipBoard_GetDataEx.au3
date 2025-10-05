; == Besipiel 1 verwendet _ClipBoard_SetData()

#include "Extras\HelpFileInternals.au3"

#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <WinAPIError.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Zwischenablage: Setzt und ermittelt DataEx (v" & @AutoItVersion & ")", 600, 450)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	Local $idBtn_SetData = GUICtrlCreateButton("Schreibt Daten in die Zwischenablage", 50, 410, 220, 30)
	Local $idBtn_GetData = GUICtrlCreateButton("Holt Daten aus der Zwischenablage", 300, 410, 220, 30)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Local $hMemory, $tData
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idBtn_SetData
				_ClipBoard_SetData("ClipBoard Testdaten")
			Case $idBtn_GetData
				; Öffnet die Zwischenablage
				If _ClipBoard_Open($hGUI) Then

					; Liest Text aus der Zwischenablage
					$hMemory = _ClipBoard_GetDataEx($CF_TEXT)
					If $hMemory = 0 Then _WinAPI_ShowError("_ClipBoard_GetDataEx fehlgeschlagen!")
					$tData = DllStructCreate("char Text[8192]", $hMemory)
					_MemoWrite(DllStructGetData($tData, "Text"))

					; Schließt die Zwischenablage
					_ClipBoard_Close()
				Else
					_WinAPI_ShowError("_ClipBoard_Open fehlgeschlagen!")
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>Example
