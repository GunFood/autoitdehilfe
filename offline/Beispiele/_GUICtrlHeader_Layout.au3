#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGui = GUICreate("Header", 400, 300, 100, 100)
	Local $hHeader = _GUICtrlHeader_Create($hGui)
	_MemoCreate(2, 52, 444, 220)

;~ 	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 0", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)

	; Ermittelt die korrekte Größe und Position des Controls
	Local $tRECT = _WinAPI_GetClientRect($hGui)
	Local $tPos = _GUICtrlHeader_Layout($hHeader, $tRECT)

	; Zeigt die korrekte Größe und Position des Controls
	_MemoWrite("Fenster Handle .....: " & DllStructGetData($tPos, "hWnd"))
	_MemoWrite("Z Reihenfolge Handle: " & DllStructGetData($tPos, "InsertAfter"))
	_MemoWrite("Horizontale Position: " & DllStructGetData($tPos, "X"))
	_MemoWrite("Vertikale Position .: " & DllStructGetData($tPos, "Y"))
	_MemoWrite("Breite .............: " & DllStructGetData($tPos, "CX"))
	_MemoWrite("Höhe... ............: " & DllStructGetData($tPos, "CY"))
	_MemoWrite("Flags ..............: " & DllStructGetData($tPos, "Flags"))

	_MemoMsgBoxStatus("", -1, $hGui) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example