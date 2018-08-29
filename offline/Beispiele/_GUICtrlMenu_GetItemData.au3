#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Ermittelt/Setzt den anwendungsspezifischen Wert des Menüpunktes 'Datei'
	Writeln("Anwendungsspezifischer Wert des Menüpunktes 'Datei': " & _GUICtrlMenu_GetItemData($hMain, 0))
	_GUICtrlMenu_SetItemData($hMain, 0, 1234)
	Writeln("Anwendungsspezifischer Wert des Menüpunktes 'Datei': " & _GUICtrlMenu_GetItemData($hMain, 0))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
