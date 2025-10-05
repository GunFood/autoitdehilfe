#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>

Global $g_hWnd

Example()

Func Example()
	Local $hMain, $hFile, $tInfo

	; Startet den Editor
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($g_hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Ermittelt Informationen über den Menüpunkt 'Öffnen'
	$tInfo = _GUICtrlMenu_GetItemInfo($hFile, 1)
	Writeln("ID des Menüpunktes 'Öffnen': " & DllStructGetData($tInfo, "ID"))
	DllStructSetData($tInfo, "ID", 0)
	_GUICtrlMenu_SetItemInfo($hFile, 1, $tInfo)
	$tInfo = _GUICtrlMenu_GetItemInfo($hFile, 1)
	Writeln("ID des Menüpunktes 'Öffnen': " & DllStructGetData($tInfo, "ID"))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln
