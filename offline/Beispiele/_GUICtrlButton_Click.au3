#include <GuiButton.au3>
#include <GUIConstantsEx.au3>

Global $g_idBtn[6], $g_idMemo, $g_iRand

HotKeySet("!b", "Clickit")

Example()

Func Example()
	Local $y = 70

	GUICreate("Buttons", 610, 400)
	$g_idMemo = GUICtrlCreateEdit("", 119, 10, 476, 374, 0)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	MemoWrite("Drücke Alt+b, um einen zufällig ausgewählten Button zu drücken.")

	$g_idBtn[0] = GUICtrlCreateButton("Button1", 10, 10, 100, 50)

	For $x = 1 To 5
		$g_idBtn[$x] = GUICtrlCreateButton("Button" & $x + 1, 10, $y, 100, 50)
		$y += 60
	Next

	$g_iRand = Random(0, 5, 1)
	_GUICtrlButton_SetText($g_idBtn[$g_iRand], "Neuer Text " & $g_iRand + 1)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $g_idBtn[$g_iRand]
				MemoWrite(_GUICtrlButton_GetText($g_idBtn[$g_iRand]) & " angeklickt")
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

Func Clickit()
	$g_iRand = Random(0, 5, 1)
	_GUICtrlButton_Click($g_idBtn[$g_iRand])
EndFunc   ;==>Clickit

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
