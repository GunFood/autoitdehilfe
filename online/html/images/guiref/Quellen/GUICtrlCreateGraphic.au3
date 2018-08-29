#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>

Opt('MustDeclareVars', 1)

Global $MAXGr = 6, $del
Global $a[$MAXGr + 1] ; Die Eintr&auml;ge 0 und $MAXGr Eintr&auml;ge werden nicht verwendet, um bei GUICtrlDelete ein Ergebnis zu erhalten

Example()

Func Example()
	Local $msg, $inc, $i

	CreateChild()

	$i = 1
	$inc = 1
	Do
		$msg = GUIGetMsg()

		If $msg = $del Then
			GUICtrlDelete($a[$i])
			$i = $i + $inc
			If $i < 0 Or $i > $MAXGr Then Exit
		EndIf
		If $msg > 0 Then MsgBox(0, "geklickt", $msg & @LF & $a[5], 2)
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example


Func CreateChild()
	Local $child
	$child = GUICreate("Meine Zeichnung")
	$del = GUICtrlCreateButton("L&ouml;schen", 50, 165, 50)


	$a[1] = GUICtrlCreateGraphic(20, 50, 100, 100)
	GUICtrlSetBkColor(-1, 0xffffff)
	GUICtrlSetColor(-1, 0)

	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff0000, 0xff0000)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 50, 50, 40, 30, 270)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x00ff00, 0xffffff)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 58, 50, 40, -60, 90)

	GUICtrlSetGraphic(-1, $GUI_GR_ELLIPSE, 100, 100, 50, 80)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x00ff00, 0xc0c0ff)
	GUICtrlSetGraphic(-1, $GUI_GR_RECT, 350, 200, 50, 80)
	GUICtrlSetColor(-1, 0xff)

	$a[2] = GUICtrlCreateGraphic(220, 50, 100, 100)
	GUICtrlSetStyle(-1, $SS_NOTIFY)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0, 0xff)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 50, 50, 40, 30, 270)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x00ff00, 0xffffff)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 58, 50, 40, -60, 90)

	$a[3] = GUICtrlCreateGraphic(220, 150, 100, 100, 0)
	GUICtrlSetBkColor(-1, 0xf08080)
	GUICtrlSetColor(-1, 0xff)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff00)
	GUICtrlSetGraphic(-1, $GUI_GR_RECT, 50, 50, 80, 80)

	$a[5] = GUICtrlCreateGraphic(150, 10, 50, 50, 0)
	GUICtrlSetBkColor(-1, 0xa0ffa0)
	GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 20, 20) ; Startpunkt
	; Es ist besser, eine Linie bis zum Endpunkt zu zeichnen,
	; um das st&auml;ndige Wechseln der Farbe zu umgehen
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x0000ff)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 30, 30)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 20, 40)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff0000)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 25, 25)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 40, 40)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 40, 40)

	GUISetState()
EndFunc   ;==>CreateChild
