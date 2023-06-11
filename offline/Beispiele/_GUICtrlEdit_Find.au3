#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <WindowsConstants.au3>

; verwendet die AutoIt-Funktion

Example_Internal()

Func Example_Internal()
	Local $s_Text = "Das ist ein Test." & @CRLF & _
			"Das ist nur ein Test." & @CRLF & _
			"Das Testen sollte bei dir genauso funktionieren wie bei mir!"
	Local $idButton1, $idButton2, $iMsg, $idEdit

	GUICreate('Beispiel: Suchen und Ersetzen mit AutoIt ' & FileGetVersion(@AutoItExe), 622, 448, 192, 125)
	$idEdit = GUICtrlCreateEdit($s_Text, 64, 24, 505, 233, _
			BitOR($ES_AUTOVSCROLL, $WS_VSCROLL, $ES_MULTILINE, $WS_HSCROLL, $ES_NOHIDESEL))
	$idButton1 = GUICtrlCreateButton("Suchen", 176, 288, 121, 33, 0)
	$idButton2 = GUICtrlCreateButton("Suchen und Ersetzen", 368, 288, 121, 33, 0)
	GUISetState(@SW_SHOW)

	While 1
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $iMsg = $idButton1
				_GUICtrlEdit_Find($idEdit)
			Case $iMsg = $idButton2
				_GUICtrlEdit_Find($idEdit, True)
			Case Else
				;;;;;;;
		EndSelect
	WEnd
	GUIDelete()
EndFunc   ;==>Example_Internal
