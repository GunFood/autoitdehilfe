#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain, $hItem1, $hItem2

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Erstellt ein Subitem Menü
	$hItem1 = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hItem1, 0, "SubItem &1", 0x1000)
	_GUICtrlMenu_InsertMenuItem($hItem1, 1, "SubItem &2", 0x1001)

	; Erstellt ein Menü
	$hItem2 = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hItem2, 0, "Item &1", 0x2000, $hItem1)
	_GUICtrlMenu_InsertMenuItem($hItem2, 1, "Item &2", 0x2001)
	_GUICtrlMenu_InsertMenuItem($hItem2, 2, "", 0)
	_GUICtrlMenu_InsertMenuItem($hItem2, 3, "Item &3", 0x2002)
	_GUICtrlMenu_InsertMenuItem($hItem2, 4, "Item &4", 0x2003)

	; Fügt ein neues Menü in den Editor ein
	_GUICtrlMenu_InsertMenuItem($hMain, 6, "&AutoIt", 0, $hItem2)
	_GUICtrlMenu_DrawMenuBar($hWnd)
EndFunc   ;==>Example
