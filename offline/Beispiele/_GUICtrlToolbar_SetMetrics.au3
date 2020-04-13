#include <GUIConstantsEx.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $hGui, $hToolbar, $aMetrics
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $idHelp

	; Erstellt eine GUI
	$hGui = GUICreate("Toolbar", 500, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGui)
	$g_idMemo = GUICtrlCreateEdit("", 2, 36, 496, 262, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 10, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Fügt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	MemoWrite("Before _GUICtrlToolbar_SetMetrics")

	Sleep(3000)
	GUISetState(@SW_LOCK)

	; Setzt die Eigenschaften eines Toolbar Controls
	MemoWrite("Schritt 1:")
	MemoWrite("$iXPad = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 10, 0, 0, 0)
	GUISetState(@SW_UNLOCK)
	MemoWrite("==> Kein Effekt")

	Sleep(3000)
	GUISetState(@SW_LOCK)

	; Setzt die Eigenschaften eines Toolbar Controls
	MemoWrite("Schritt 2:")
	MemoWrite("$iYPad = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 0, 10, 0, 0)
	GUISetState(@SW_UNLOCK)
	MemoWrite("==> Kein Effekt")

	Sleep(3000)

	GUISetState(@SW_LOCK)

	; Setzt die Eigenschaften eines Toolbar Controls
	MemoWrite("Schritt 3:")
	MemoWrite("$iXSpacing = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 0, 0, 10, 0)
	GUISetState(@SW_UNLOCK)

	MemoWrite("==> Buttons sind getrennt")

	Sleep(3000)
	GUISetState(@SW_LOCK)
	; Setzt die Eigenschaften eines Toolbar Controls
	MemoWrite("Schritt 4:")
	MemoWrite("$iYSpacing = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 0, 0, 0, 10)
	GUISetState(@SW_UNLOCK)
	MemoWrite("==> Kein Effekt, da nur eines Zeile mit Buttons existiert")

	Sleep(3000)
	GUISetState(@SW_LOCK)
	; Setzt die Eigenschaften eines Toolbar Controls
	MemoWrite("")
	MemoWrite("Schritt 5:")
	MemoWrite("$iXPad = 10")
	MemoWrite("$iYPad = 10")
	MemoWrite("$iXSpacing = 10")
	MemoWrite("$iYSpacing = 10")
	_GUICtrlToolbar_SetMetrics($hToolbar, 10, 10, 10, 10)
	GUISetState(@SW_UNLOCK)
	MemoWrite("==> Platzhalter, da $iXpacing ungleich 0 ist")

	; Zeigt die Eigenschaften eines Toolbar Controls
	$aMetrics = _GUICtrlToolbar_GetMetrics($hToolbar)
	MemoWrite("Breite der 'Polsterung' innerhalb der Toolbar Buttons .: " & $aMetrics[0])
	MemoWrite("Höhe der 'Polsterung' innerhalb der Toolbar Buttons ...: " & $aMetrics[1])
	MemoWrite("Breite des Raumes zwischen den Toolbar Buttons ........: " & $aMetrics[2])
	MemoWrite("Höhe des Raumes zwischen den Toolbar Buttons ..........: " & $aMetrics[3])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
