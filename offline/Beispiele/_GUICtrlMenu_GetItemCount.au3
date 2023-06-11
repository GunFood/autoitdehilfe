#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain

	; Startet den Editor.
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")

	; Ermittelt das Handle des Hauptmenüs.
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Ermittelt die Anzahl an Items im Hauptmenü.
	Writeln("Anzahl an Items im Hauptmenü:  " & _GUICtrlMenu_GetItemCount($hMain))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor.
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
