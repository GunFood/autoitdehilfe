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

	; Ermittelt, ob das Menüitem deaktiviert ist / Deaktiviert ein Menüitem
	Writeln("Der Menüpunkt 'Öffnen' ist deaktiviert: " & _GUICtrlMenu_GetItemDisabled($hFile, 1))
	_GUICtrlMenu_SetItemDisabled($hFile, 1)
	Writeln("Der Menüpunkt 'Öffnen' ist deaktiviert: " & _GUICtrlMenu_GetItemDisabled($hFile, 1))
	_GUICtrlMenu_SetItemEnabled($hFile, 1)
	Writeln("Der Menüpunkt 'Öffnen' ist aktiviert : " & _GUICtrlMenu_GetItemEnabled($hFile, 1))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
