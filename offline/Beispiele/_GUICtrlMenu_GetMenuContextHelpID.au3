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

	; Ermittelt/Setzt die Kontexthilfe ID für das Menü 'Datei'
	Writeln("Kontexthilfe ID für das Menü 'Datei': " & _GUICtrlMenu_GetMenuContextHelpID($hFile))
	_GUICtrlMenu_SetMenuContextHelpID($hFile, 1234)
	Writeln("Kontexthilfe ID für das Menü 'Datei': " & _GUICtrlMenu_GetMenuContextHelpID($hFile))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
