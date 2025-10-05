#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Toolbar: Setzt und ermittelt die Eigenschaften (v" & @AutoItVersion & ")", 500, 300)
	Local $hToolbar = _GUICtrlToolbar_Create($hGUI)
	_MemoCreate(2, 36, 396, 262, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Setzt das ANSI Format
;~     _GUICtrlToolbar_SetUnicodeFormat($hToolbar, False)

	; Fügt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt die Buttons hinzu
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idHelp, $STD_HELP)

	_MemoWrite("Before _GUICtrlToolbar_SetMetrics")

	Sleep(2000)
	GUISetState(@SW_LOCK)

	; Setzt die Eigenschaften eines Toolbar Controls
	_MemoWrite("Schritt 1:")
	_MemoWrite("$iXPad = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 10, 0, 0, 0)
	GUISetState(@SW_UNLOCK)
	_MemoWrite("==> Keine Auswirkung")

	Sleep(2000)
	GUISetState(@SW_LOCK)

	; Setzt die Eigenschaften eines Toolbar Controls
	_MemoWrite("Schritt 2:")
	_MemoWrite("$iYPad = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 0, 10, 0, 0)
	GUISetState(@SW_UNLOCK)
	_MemoWrite("==> Keine Auswirkung")

	Sleep(2000)
	GUISetState(@SW_LOCK)

	; Setzt die Eigenschaften eines Toolbar Controls
	_MemoWrite("Schritt 3:")
	_MemoWrite("$iXSpacing = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 0, 0, 10, 0)
	GUISetState(@SW_UNLOCK)
	_MemoWrite("==> Buttons haben Abstand")

	Sleep(2000)
	GUISetState(@SW_LOCK)

	; Setzt die Eigenschaften eines Toolbar Controls
	_MemoWrite("Schritt 4:")
	_MemoWrite("$iYSpacing = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 0, 0, 0, 10)
	GUISetState(@SW_UNLOCK)
	_MemoWrite("==> Kein Auswirkung, da nur eine Zeile mit Buttons")

	Sleep(2000)
	GUISetState(@SW_LOCK)

	; Setzt die Eigenschaften eines Toolbar Controls
	_MemoWrite("")
	_MemoWrite("Schritt 5:")
	_MemoWrite("$iXPad = 10")
	_MemoWrite("$iYPad = 10")
	_MemoWrite("$iXSpacing = 10")
	_MemoWrite("$iYSpacing = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 10, 10, 10, 10)
	GUISetState(@SW_UNLOCK)
	_MemoWrite("==> Abstand, da nur $iXpacing nicht 0 ist")

	; Zeigt die Eigenschaften eines Toolbar Controls
	Local $aMetrics = _GUICtrlToolbar_GetMetrics($hToolbar)
	_MemoWrite("")
	_MemoWrite("Breite der 'Polsterung' innerhalb der Toolbar Buttons .: " & $aMetrics[0])
	_MemoWrite("Höhe der 'Polsterung' innerhalb der Toolbar Buttons ...: " & $aMetrics[1])
	_MemoWrite("Breite des Raumes zwischen den Toolbar Buttons ........: " & $aMetrics[2])
	_MemoWrite("Höhe des Raumes zwischen den Toolbar Buttons ..........: " & $aMetrics[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example