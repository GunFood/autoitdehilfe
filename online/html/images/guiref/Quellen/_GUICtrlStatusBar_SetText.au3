#Region    ;************ Includes ************
#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>
#EndRegion ;************ Includes ************

Opt('MustDeclareVars', 1)

Global $iMemo

Beispiel1()
;~ Beispiel2()

Func Beispiel1()

	Local $hGUI, $hIcons[2], $hStatus
	Local $aParts[4] = [100, 200, 300, 400]

	; Erstellt eine GUI
	$hGUI = GUICreate("(Beispiel 1) StatusBar Text ermitteln", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Steuerelement
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Setzt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts, 50)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)

	; Setzt die Icons
	$hIcons[0] = _WinAPI_LoadShell32Icon(23)
	$hIcons[1] = _WinAPI_LoadShell32Icon(40)
	_GUICtrlStatusBar_SetIcon($hStatus, 0, $hIcons[0])
	_GUICtrlStatusBar_SetIcon($hStatus, 1, $hIcons[1])

	; Zeigt den Text der Abschnitte
	MemoWrite("Text von Abschnitt 1 ........: " & _GUICtrlStatusBar_GetText($hStatus, 0))
	MemoWrite("Text von Abschnitt 2 ........: " & _GUICtrlStatusBar_GetText($hStatus, 1))

	; Zeigt die Handles der Icons
	MemoWrite("Iconhandle Abschnitt 1 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	MemoWrite("Iconhandle Abschnitt 2 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 1)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	; Icons l&ouml;schen
	_WinAPI_DestroyIcon($hIcons[0])
	_WinAPI_DestroyIcon($hIcons[1])
	GUIDelete()
EndFunc   ;==>Beispiel1

Func Beispiel2()

	Local $hGUI, $hStatus
	Local $aParts[4] = [75, 150, 300, 400]

	; Erstellt eine GUI
	$hGUI = GUICreate("(Beispiel 2) StatusBar Text ermitteln", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Steuerelement
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Setzt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)

	; Setzt die Icons
	_GUICtrlStatusBar_SetIcon($hStatus, 0, 23, "shell32.dll")
	_GUICtrlStatusBar_SetIcon($hStatus, 1, 40, "shell32.dll")

	; Zeigt den Text der Abschnitte
	MemoWrite("Text von Abschnitt 1 ........: " & _GUICtrlStatusBar_GetText($hStatus, 0))
	MemoWrite("Text von Abschnitt 2 ........: " & _GUICtrlStatusBar_GetText($hStatus, 1))

	; Zeigt die Handles der Icons
	MemoWrite("Iconhandle Abschnitt 1 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 0)))
	MemoWrite("Iconhandle Abschnitt 2 .: 0x" & Hex(_GUICtrlStatusBar_GetIcon($hStatus, 1)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Beispiel2

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
