#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain, $hFile

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Ändert den Menüitemtyp
	Writeln("Menüitemtyp: 0x" & Hex(_GUICtrlMenu_GetItemType($hFile, 1)))
	_GUICtrlMenu_SetItemType($hFile, 1, $MFT_RADIOCHECK)
	_GUICtrlMenu_CheckRadioItem($hFile, 0, 8, 1)
	Writeln("Menüitemtyp: 0x" & Hex(_GUICtrlMenu_GetItemType($hFile, 1)))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
