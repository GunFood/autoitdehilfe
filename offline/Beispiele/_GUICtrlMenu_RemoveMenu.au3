#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Hilfe-Menü entfernen
	_GUICtrlMenu_RemoveMenu($hMain, 4)
EndFunc   ;==>Example
