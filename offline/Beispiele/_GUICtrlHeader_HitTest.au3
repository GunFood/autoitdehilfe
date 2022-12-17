#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

Global $g_idMemo

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Header: Hit Test (v" & @AutoItVersion & ")", 400, 300)
	Local $hHeader = _GUICtrlHeader_Create($hGUI)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	$g_idMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Testet einen Punkt (Spalte2), um zu ermitteln, welches Item sich an dem festgelegten Punkt befindet.
	Local $aHT = _GUICtrlHeader_HitTest($hHeader, 110, 10)
	MemoWrite("Itemindex ................................: " & $aHT[0])
	MemoWrite("Im Fenster ...............................: " & $aHT[1])
	MemoWrite("Im Rechteck des Controls ...........: " & $aHT[2])
	MemoWrite("Zwischen zwei Items ......................: " & $aHT[3])
	MemoWrite("Auf einem Item welches die Breite 0 hat: " & $aHT[4])
	MemoWrite("Über einem Filterbereich .................: " & $aHT[5])
	MemoWrite("Auf dem Filterbutton .....................: " & $aHT[6])
	MemoWrite("Über dem begrenzenden Rechteck ...........: " & $aHT[7])
	MemoWrite("Unterhalb des begrenzenden Rechtecks .....: " & $aHT[8])
	MemoWrite("Rechts des begrenzenden Rechtecks ........: " & $aHT[9])
	MemoWrite("Links des begrenzenden Rechtecks .........: " & $aHT[10])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
