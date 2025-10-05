#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd

Example()

Func Example()
	Local $hMain, $aRect

	; Startet den Editor
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($g_hWnd)


	; Ermittelt das begrenzende Rechteck für 'Datei'
	$aRect = _GUICtrlMenu_GetItemRect($g_hWnd, $hMain, 0)

	Writeln("'Datei' X1: " & $aRect[0])
	Writeln("'Datei' Y1: " & $aRect[1])
	Writeln("'Datei' X2: " & $aRect[2])
	Writeln("'Datei' Y2: " & $aRect[3])

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
