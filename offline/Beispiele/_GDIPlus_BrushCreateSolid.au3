#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hBrush1, $hBrush2

	; Erstellt eine GUI
	GUICreate("GDI+", 400, 300)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Erstellt das Füllmuster
	_GDIPlus_Startup()
	$hBrush1 = _GDIPlus_BrushCreateSolid()
	$hBrush2 = _GDIPlus_BrushClone($hBrush1)

	; Zeigt Informationen über das Füllmuster
	MemoWrite("Füllmuster 1 Handle : 0x" & Hex($hBrush1))
	MemoWrite("Füllmuster 1 Typ ...: " & _GDIPlus_BrushGetType($hBrush1))
	MemoWrite("Füllmuster 2 Handle : 0x" & Hex($hBrush2))
	MemoWrite("Füllmuster 2 Typ ...: " & _GDIPlus_BrushGetType($hBrush2))

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush2)
	_GDIPlus_BrushDispose($hBrush1)
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
