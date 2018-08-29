#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMenu, $iCount, $iI

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMenu = _GUICtrlMenu_GetSystemMenu($hWnd)

	; Ändert das Systemmenü
	_GUICtrlMenu_InsertMenuItem($hMenu, 5, "&AutoIt")

	; Zeigt das Systemmenü an
	$iCount = _GUICtrlMenu_GetItemCount($hMenu)
	Writeln("Handle des Systemmenüs: 0x" & Hex($hMenu))
	Writeln("Anzahl Items..........: " & $iCount)
	For $iI = 0 To $iCount - 1
		Writeln("Item " & $iI & " Text ......: " & _GUICtrlMenu_GetItemText($hMenu, $iI))
	Next
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln
