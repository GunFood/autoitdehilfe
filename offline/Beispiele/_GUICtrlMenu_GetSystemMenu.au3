#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd

Example()

Func Example()
	Local $hMenu, $iCount, $iI

	; Startet den Editor
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	$hMenu = _GUICtrlMenu_GetSystemMenu($g_hWnd)

	; Ändert das Systemmenü
	_GUICtrlMenu_InsertMenuItem($hMenu, 5, "&AutoIt")

	; Zeigt das Systemmenü an
	$iCount = _GUICtrlMenu_GetItemCount($hMenu)
	Writeln("Handle des Systemmenüs: 0x" & Hex($hMenu))
	Writeln("Anzahl Items..........: " & $iCount)
	For $iI = 0 To $iCount - 1
		Writeln("Item " & $iI & " Text ......: " & _GUICtrlMenu_GetItemText($hMenu, $iI))
	Next

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
