#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Ermittelt die Textlänge (v" & @AutoItVersion & ")", 450, 320, 100, 100)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI, $SBT_NOBORDERS)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	; Setzt die Abschnitte
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 0", 0, $SBT_POPOUT)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 1, $SBT_NOBORDERS)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 2, $SBT_NOTABPARSING)


	; Ermittelt Textinformationen
	For $iI = 0 To _GUICtrlStatusBar_GetCount($hStatus) - 1
		_MemoWrite("Abschnitt " & $iI & " Text Flags : 0x" & Hex(_GUICtrlStatusBar_GetTextFlags($hStatus, $iI)))
		_MemoWrite("Abschnitt " & $iI & " Textlänge. : " & _GUICtrlStatusBar_GetTextLength($hStatus, $iI))
		_MemoWrite("Abschnitt " & $iI & " Textlänge. : 0x" & Hex(_GUICtrlStatusBar_GetTextLengthEx($hStatus, $iI)))
		_MemoWrite()
	Next

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example