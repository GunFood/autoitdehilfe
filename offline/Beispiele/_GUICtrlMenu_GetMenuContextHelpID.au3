#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd

Example()

Func Example()
	Local $hMain, $hFile

	; Startet den Editor
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($g_hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Ermittelt/Setzt die Kontexthilfe ID für das Menü 'Datei'
	Writeln("Kontexthilfe ID für das Menü 'Datei': " & _GUICtrlMenu_GetMenuContextHelpID($hFile))
	_GUICtrlMenu_SetMenuContextHelpID($hFile, 1234)
	Writeln("Kontexthilfe ID für das Menü 'Datei': " & _GUICtrlMenu_GetMenuContextHelpID($hFile))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln