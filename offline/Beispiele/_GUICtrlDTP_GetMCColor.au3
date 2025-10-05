#include "Extras\HelpFileInternals.au3"

#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>

_Example() ; Verwendet die internen AutoIt Controls

Func _Example()
	; Erstellt eine GUI
	GUICreate("DateTimePick: Setzt und ermittelt MCColor (v" & @AutoItVersion & ")", 450, 300)
	Local $hDTP = GUICtrlGetHandle(GUICtrlCreateDate("", 2, 6, 190))
	_MemoCreate(2, 32, 396, 266, 0)
	GUISetState(@SW_SHOW)

	; Setzt das Anzeigeformat
	_GUICtrlDTP_SetFormat($hDTP, "ddd MMM dd, yyyy hh:mm ttt")

	; Setzt die Hintergrundfarbe des Monatskalenders
	_GUICtrlDTP_SetMCColor($hDTP, 2, $CLR_DARKSEAGREEN)

	; Ermittelt die Farben des DTPs
	_MemoWrite("Hintergrund zwischen den Monaten .: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 0), 6))
	_MemoWrite("Text innerhalb der Monate ........: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 1), 6))
	_MemoWrite("Titelhintergrund .................: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 2), 6))
	_MemoWrite("Titeltext ........................: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 3), 6))
	_MemoWrite("Hintergrund innerhalb der Monate .: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 4), 6))
	_MemoWrite("Text des folgenden Tages .........: " & "0x" & Hex(_GUICtrlDTP_GetMCColor($hDTP, 5), 6))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Example