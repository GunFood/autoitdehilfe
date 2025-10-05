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

	; Ermittelt/Setzt, ob das Menüitem 'Öffnen' ausgegraut ist
	Writeln("Menüitem 'Öffnen' ist ausgegraut: " & _GUICtrlMenu_GetItemGrayed($hFile, 1))
	_GUICtrlMenu_SetItemGrayed($hFile, 1)
	Writeln("Menüitem 'Öffnen' ist ausgegraut: " & _GUICtrlMenu_GetItemGrayed($hFile, 1))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
