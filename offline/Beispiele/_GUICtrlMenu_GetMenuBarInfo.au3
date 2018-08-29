#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $aInfo

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")

	; Ermittelt die Menü Leisten Informationen
	$aInfo = _GUICtrlMenu_GetMenuBarInfo($hWnd)
	Writeln("Links ............: " & $aInfo[0])
	Writeln("Oben .............: " & $aInfo[1])
	Writeln("Rechts ...........: " & $aInfo[2])
	Writeln("Unten ..........: " & $aInfo[3])
	Writeln("Menü Handle .....: 0x" & Hex($aInfo[4]))
	Writeln("Submenü Handle ..: 0x" & Hex($aInfo[5]))
	Writeln("Menü Leiste fokusiert : " & $aInfo[6])
	Writeln("Menu Item fokusiert: " & $aInfo[7])
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
