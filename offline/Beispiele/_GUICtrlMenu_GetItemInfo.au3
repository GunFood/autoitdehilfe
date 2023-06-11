#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain, $hFile, $tInfo

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Ermittelt Informationen über den Menüpunkt 'Öffnen'
	$tInfo = _GUICtrlMenu_GetItemInfo($hFile, 1)
	Writeln("ID des Menüpunktes 'Öffnen': " & DllStructGetData($tInfo, "ID"))
	DllStructSetData($tInfo, "ID", 0)
	_GUICtrlMenu_SetItemInfo($hFile, 1, $tInfo)
	$tInfo = _GUICtrlMenu_GetItemInfo($hFile, 1)
	Writeln("ID des Menüpunktes 'Öffnen': " & DllStructGetData($tInfo, "ID"))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
