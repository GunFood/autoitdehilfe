#include "Extras\HelpFileInternals.au3"

#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hBrush1, $hBrush2

	; Erstellt eine GUI
	GUICreate("GDI+", 400, 300)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Erstellt das Füllmuster
	_GDIPlus_Startup()
	$hBrush1 = _GDIPlus_BrushCreateSolid()
	$hBrush2 = _GDIPlus_BrushClone($hBrush1)

	; Zeigt Informationen über das Füllmuster
	_MemoWrite("Füllmuster 1 Handle : 0x" & Hex($hBrush1))
	_MemoWrite("Füllmuster 1 Typ ...: " & _GDIPlus_BrushGetType($hBrush1))
	_MemoWrite("Füllmuster 2 Handle : 0x" & Hex($hBrush2))
	_MemoWrite("Füllmuster 2 Typ ...: " & _GDIPlus_BrushGetType($hBrush2))

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush2)
	_GDIPlus_BrushDispose($hBrush1)
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example