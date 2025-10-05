#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header: Hit Test (v" & @AutoItVersion & ")", 400, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Testet einen Punkt (Spalte 1), um zu ermitteln, welches Item sich an dem festgelegten Punkt befindet.
	Local $aHT = _GUICtrlHeader_HitTest($hHeader, 110, 10)
	_MemoWrite("Itemindex ................................: " & $aHT[0])
	_MemoWrite("Im Fenster ...............................: " & $aHT[1])
	_MemoWrite("Im Rechteck des Controls ...........: " & $aHT[2])
	_MemoWrite("Zwischen zwei Items ......................: " & $aHT[3])
	_MemoWrite("Auf einem Item welches die Breite 0 hat: " & $aHT[4])
	_MemoWrite("Über einem Filterbereich .................: " & $aHT[5])
	_MemoWrite("Auf dem Filterbutton .....................: " & $aHT[6])
	_MemoWrite("Über dem begrenzenden Rechteck ...........: " & $aHT[7])
	_MemoWrite("Unterhalb des begrenzenden Rechtecks .....: " & $aHT[8])
	_MemoWrite("Rechts des begrenzenden Rechtecks ........: " & $aHT[9])
	_MemoWrite("Links des begrenzenden Rechtecks .........: " & $aHT[10])

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example