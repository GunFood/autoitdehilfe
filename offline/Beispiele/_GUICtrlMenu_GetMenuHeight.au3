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

	; Ermittelt/Setzt die maximale Höhe des Menüs Datei
	Writeln("Maximale Höhe des Menüs Datei: " & _GUICtrlMenu_GetMenuHeight($hFile))
	_GUICtrlMenu_SetMenuHeight($hFile, 100)
	Writeln("Maximale Höhe des Menüs Datei: " & _GUICtrlMenu_GetMenuHeight($hFile))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
