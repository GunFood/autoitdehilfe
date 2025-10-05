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

	; Ermittelt, ob das Menüitem deaktiviert ist / Deaktiviert ein Menüitem
	Writeln("Der Menüpunkt 'Öffnen' ist deaktiviert: " & _GUICtrlMenu_GetItemDisabled($hFile, 1))
	_GUICtrlMenu_SetItemDisabled($hFile, 1)
	Writeln("Der Menüpunkt 'Öffnen' ist deaktiviert: " & _GUICtrlMenu_GetItemDisabled($hFile, 1))
	_GUICtrlMenu_SetItemEnabled($hFile, 1)
	Writeln("Der Menüpunkt 'Öffnen' ist aktiviert : " & _GUICtrlMenu_GetItemEnabled($hFile, 1))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
