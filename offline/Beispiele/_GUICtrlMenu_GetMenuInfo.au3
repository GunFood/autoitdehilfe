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

	; Ermittelt/Setzt die Datei Menü Informationen
	$tInfo = _GUICtrlMenu_GetMenuInfo($hFile)
	Writeln("Menü Stil ..........: " & DllStructGetData($tInfo, "Style"))
	Writeln("Maximale Menü Höhe .....: " & DllStructGetData($tInfo, "YMax"))
	Writeln("Hintergrundmuster des Menüs: " & DllStructGetData($tInfo, "hBack"))
	Writeln("Kontext Hilfe-ID des Menüs : " & DllStructGetData($tInfo, "ContextHelpID"))
	Writeln("Menü Daten ...........: " & DllStructGetData($tInfo, "MenuData"))
	Writeln("")
	$tInfo = DllStructCreate($tagMENUINFO)
	DllStructSetData($tInfo, "Size", DllStructGetSize($tInfo))
	DllStructSetData($tInfo, "Mask", BitOR($MIM_HELPID, $MIM_MAXHEIGHT, $MIM_MENUDATA))
	DllStructSetData($tInfo, "YMax", 100)
	DllStructSetData($tInfo, "ContextHelpID", 1234)
	DllStructSetData($tInfo, "MenuData", 4567)
	_GUICtrlMenu_SetMenuInfo($hFile, $tInfo)
	$tInfo = _GUICtrlMenu_GetMenuInfo($hFile)
	Writeln("Menü Stil ..........: " & DllStructGetData($tInfo, "Style"))
	Writeln("Maximale Höhe des Menü .....: " & DllStructGetData($tInfo, "YMax"))
	Writeln("Hintergrundmuster des Menüs: " & DllStructGetData($tInfo, "hBack"))
	Writeln("Kontext Hilfe-ID des Menüs : " & DllStructGetData($tInfo, "ContextHelpID"))
	Writeln("Menü Daten ...........: " & DllStructGetData($tInfo, "MenuData"))
	Writeln("")
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
