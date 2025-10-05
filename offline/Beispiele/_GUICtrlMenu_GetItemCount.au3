#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd

Example()

Func Example()
	Local $hMain

	; Startet den Editor.
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($g_hWnd)

	; Ermittelt das Handle des Hauptmenüs.
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Ermittelt die Anzahl an Items im Hauptmenü.
	Writeln("Anzahl an Items im Hauptmenü:  " & _GUICtrlMenu_GetItemCount($hMain))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor.
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
