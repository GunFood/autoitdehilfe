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

	; Ermittelt/Setzt, ob das Menüitem 'Öffnen' ausgegraut ist
	Writeln("Menüitem 'Öffnen' ist ausgegraut: " & _GUICtrlMenu_GetItemGrayed($hFile, 1))
	_GUICtrlMenu_SetItemGrayed($hFile, 1)
	Writeln("Menüitem 'Öffnen' ist ausgegraut: " & _GUICtrlMenu_GetItemGrayed($hFile, 1))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
