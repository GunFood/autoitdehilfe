#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain, $hFile

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Ermittelt/Setzt den Standard-Menüpunkt für das Menü Datei
	Writeln("Standard-Menüpunkt für das Menü Datei: " & _GUICtrlMenu_GetMenuDefaultItem($hFile))
	_GUICtrlMenu_SetMenuDefaultItem($hFile, 1)
	Writeln("Standard-Menüpunkt für das Menü Datei: " & _GUICtrlMenu_GetMenuDefaultItem($hFile))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
