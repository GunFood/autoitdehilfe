#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>

Global Const $g_MAXGr = 6
Global $g_a_idArray[$g_MAXGr + 1] ; Die Einträge 0 und $g_MAXGr Einträge werden nicht verwendet, um bei GUICtrlDelete ein Ergebnis zu erhalten
Global $g_idDel

Example()

Func Example()
	Local $idMsg, $iInc, $i

	CreateChild()

	$i = 1
	$iInc = 1

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslös
	Do
		$idMsg = GUIGetMsg()

		If $idMsg = $g_idDel Then
			GUICtrlDelete($g_a_idArray[$i])
			$i = $i + $iInc
			If $i < 0 Or $i > $g_MAXGr Then Exit
		EndIf
		If $idMsg > 0 Then MsgBox($MB_SYSTEMMODAL, "geklickt", $idMsg & @CRLF & $g_a_idArray[5], 2)
	Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example


Func CreateChild()
	GUICreate("Meine Zeichnung")
	$g_idDel = GUICtrlCreateButton("Löschen", 50, 165, 50)

	$g_a_idArray[1] = GUICtrlCreateGraphic(20, 50, 100, 100)
	GUICtrlSetBkColor(-1, 0xffffff)
	GUICtrlSetColor(-1, 0)

	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff0000, 0xff0000)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 50, 50, 40, 30, 270)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x00ff00, 0xffffff)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 58, 50, 40, -60, 90)

	GUICtrlSetGraphic(-1, $GUI_GR_ELLIPSE, 100, 100, 50, 80)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x00ff00, 0xc0c0ff)
	GUICtrlSetGraphic(-1, $GUI_GR_RECT, 350, 200, 50, 80)
	GUICtrlCreateLabel("Label", 65, 100, 30)
	GUICtrlSetColor(-1, 0xff)


	$g_a_idArray[2] = GUICtrlCreateGraphic(220, 50, 100, 100)
	GUICtrlSetStyle(-1, $SS_NOTIFY)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0, 0xff)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 50, 50, 40, 30, 270)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x00ff00, 0xffffff)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 58, 50, 40, -60, 90)

	$g_a_idArray[3] = GUICtrlCreateGraphic(220, 150, 100, 100, 0)
	GUICtrlSetBkColor(-1, 0xf08080)
	GUICtrlSetColor(-1, 0xff)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff00)
	GUICtrlSetGraphic(-1, $GUI_GR_RECT, 50, 50, 80, 80)

	$g_a_idArray[4] = GUICtrlCreateGraphic(20, 200, 80, 80)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlSetBkColor(-1, 0xffffff)
	GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 10, 10)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 30, 40)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff00)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 70, 70)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff0000)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 10, 50)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xffff00)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 10, 10)

	$g_a_idArray[5] = GUICtrlCreateGraphic(150, 10, 50, 50, 0)
	GUICtrlSetBkColor(-1, 0xa0ffa0)
	GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 20, 20) ; Startpunkt
	; Es ist besser, eine Linie bis zum Endpunkt zu zeichnen,
	; Um das ständige Wechseln der Farbe zu umgehen
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x0000ff)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 30, 30)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 20, 40)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff0000)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 25, 25)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 40, 40)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 40, 40)

	GUISetState(@SW_SHOW)
EndFunc   ;==>CreateChild
