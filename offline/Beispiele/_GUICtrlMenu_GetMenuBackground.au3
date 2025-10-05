#include "Extras\HelpFileInternals.au3"

#include <GuiMenu.au3>
#include <WinAPIGdi.au3>
#include <WindowsSysColorConstants.au3>

Global $g_hWnd

Example()

Func Example()
	Local $hMain, $hFile, $hBrush

	; Startet den Editor
	Run("notepad.exe")
	$g_hWnd = WinWaitActive("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($g_hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Menühintergrund
	Writeln("Menühintergrund: 0x" & Hex(_GUICtrlMenu_GetMenuBackground($hFile)))
	$hBrush = _WinAPI_GetSysColorBrush($COLOR_INFOBK)
	_GUICtrlMenu_SetMenuBackground($hFile, $hBrush)
	Writeln("Menühintergrund: 0x" & Hex(_GUICtrlMenu_GetMenuBackground($hFile)))

	_NotepadForceClose($g_hWnd)
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText, $hWnd = $g_hWnd)
	ControlSend($hWnd, "", ControlGetFocus($hWnd), $sText & @CRLF)
EndFunc   ;==>Writeln