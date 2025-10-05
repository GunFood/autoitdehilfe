#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd

Example()

Func Example()
	Local $hMain, $tRECT

	; Startet den Editor
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($g_hWnd)

	; Ermittelt das begrenzende Rechteck für 'Datei'
	$tRECT = _GUICtrlMenu_GetItemRectEx($g_hWnd, $hMain, 0)

	Writeln("'Datei' X1: " & DllStructGetData($tRECT, "Left"))
	Writeln("'Datei' Y1: " & DllStructGetData($tRECT, "Top"))
	Writeln("'Datei' X2: " & DllStructGetData($tRECT, "Right"))
	Writeln("'Datei' Y2: " & DllStructGetData($tRECT, "Bottom"))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
