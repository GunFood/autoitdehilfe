#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header: Ermittelt das begrenzende Rechteck für ein festgelegtes Item (v" & @AutoItVersion & ")", 600, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Zeigt der Rechteck von Spalte 1
	Local $tRECT = _GUICtrlHeader_GetItemRectEx($hHeader, 0)
	_MemoWrite("Spalte 0 links .: " & DllStructGetData($tRECT, "Left"))
	_MemoWrite("Spalte 0 oben ..: " & DllStructGetData($tRECT, "Top"))
	_MemoWrite("Spalte 0 rechts : " & DllStructGetData($tRECT, "Right"))
	_MemoWrite("Spalte 0 unten .: " & DllStructGetData($tRECT, "Bottom"))

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example