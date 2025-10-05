#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd

Example()

Func Example()
	Local $aInfo

	; Startet den Editor
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")

	; Ermittelt die Menü Leisten Informationen
	$aInfo = _GUICtrlMenu_GetMenuBarInfo($g_hWnd)
	Writeln("Links ............: " & $aInfo[0])
	Writeln("Oben .............: " & $aInfo[1])
	Writeln("Rechts ...........: " & $aInfo[2])
	Writeln("Unten ..........: " & $aInfo[3])
	Writeln("Menü Handle .....: 0x" & Hex($aInfo[4]))
	Writeln("Submenü Handle ..: 0x" & Hex($aInfo[5]))
	Writeln("Menü Leiste fokusiert : " & $aInfo[6])
	Writeln("Menu Item fokusiert: " & $aInfo[7])

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln