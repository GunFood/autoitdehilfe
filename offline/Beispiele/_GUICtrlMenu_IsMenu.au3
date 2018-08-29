#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Prüft den Rückgabewert
	Writeln("Ist es ein Menü: " & _GUICtrlMenu_IsMenu($hWnd))
	Writeln("Ist es ein Menü: " & _GUICtrlMenu_IsMenu($hMain))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
