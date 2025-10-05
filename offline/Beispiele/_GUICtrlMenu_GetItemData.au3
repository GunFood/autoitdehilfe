#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd
Example()

Func Example()
	Local $hMain

	; Startet den Editor
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($g_hWnd)

	; Ermittelt/Setzt den anwendungsspezifischen Wert des Menüpunktes 'Datei'
	Writeln("Anwendungsspezifischer Wert des Menüpunktes 'Datei': " & _GUICtrlMenu_GetItemData($hMain, 0))
	_GUICtrlMenu_SetItemData($hMain, 0, 1234)
	Writeln("Anwendungsspezifischer Wert des Menüpunktes 'Datei': " & _GUICtrlMenu_GetItemData($hMain, 0))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
