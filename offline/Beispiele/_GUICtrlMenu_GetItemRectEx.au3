#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain, $tRECT

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Ermittelt das begrenzende Rechteck für 'Datei'
	$tRECT = _GUICtrlMenu_GetItemRectEx($hWnd, $hMain, 0)

	Writeln("'Datei' X1: " & DllStructGetData($tRECT, "Left"))
	Writeln("'Datei' Y1: " & DllStructGetData($tRECT, "Top"))
	Writeln("'Datei' X2: " & DllStructGetData($tRECT, "Right"))
	Writeln("'Datei' Y2: " & DllStructGetData($tRECT, "Bottom"))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
