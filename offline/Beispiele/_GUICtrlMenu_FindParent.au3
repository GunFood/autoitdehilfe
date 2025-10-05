#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd

Example()

Func Example()
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	Local $hMain = _GUICtrlMenu_GetMenu($g_hWnd)

	; Zeigt, dass das Menü-Handle zu Notepad gehört
	Writeln("Notepad Handle: 0x" & Hex($g_hWnd))
	Writeln("Menü-Parent ..: 0x" & Hex(_GUICtrlMenu_FindParent($hMain)))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
