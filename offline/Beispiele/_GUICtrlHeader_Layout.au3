#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <WinAPISysWin.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hHeader, $tRECT, $tPos

	; Erstellt eine GUI
	$hGui = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGui)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	$g_idMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Ermittelt die korrekte Größe und Position des Controls
	$tRECT = _WinAPI_GetClientRect($hGui)
	$tPos = _GUICtrlHeader_Layout($hHeader, $tRECT)

	; Zeigt die korrekte Größe und Position des Controls
	MemoWrite("Fenster Handle .....: " & DllStructGetData($tPos, "hWnd"))
	MemoWrite("Z Reihenfolge Handle: " & DllStructGetData($tPos, "InsertAfter"))
	MemoWrite("Horizontale Position: " & DllStructGetData($tPos, "X"))
	MemoWrite("Vertikale Position .: " & DllStructGetData($tPos, "Y"))
	MemoWrite("Breite .............: " & DllStructGetData($tPos, "CX"))
	MemoWrite("Höhe... ............: " & DllStructGetData($tPos, "CY"))
	MemoWrite("Flags ..............: " & DllStructGetData($tPos, "Flags"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
