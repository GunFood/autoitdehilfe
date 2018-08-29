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

	; Ermittelt/Setzt den Itemtext für Öffnen
	Writeln("Öffnen Itemtext: " & _GUICtrlMenu_GetItemText($hFile, 1))
	_GUICtrlMenu_SetItemText($hFile, 1, "&Schließen")
	Writeln("Öffnen Ttemtext: " & _GUICtrlMenu_GetItemText($hFile, 1))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
