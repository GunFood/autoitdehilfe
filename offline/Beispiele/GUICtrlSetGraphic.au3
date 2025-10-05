#include <GUIConstantsEx.au3>

Global Const $g_MAXGr = 6
Global $g_aidGraphics[$g_MAXGr + 1] ; 0 und $g_MAXGr-Einträge werden nicht für GUICtrlDelete benutzt
Global $g_idBtn_Del, $g_hChild

Example()

Func Example()
	Local $idMsg, $iInc, $i

	GUICreate("Mein Hauptfenster", -1, -1, 100, 100)
	Local $idBtn_Del1 = GUICtrlCreateButton("Löschen", 50, 200, 50)
	GUISetState(@SW_SHOW)
	CreateChild()

	$i = 1
	$iInc = 1
	;$i=5	; Auskommentieren um den Löschvorgang bei dem zuletzt definierten Grafik-Control zu beginnen
	;$iInc=-1

	Do
		$idMsg = GUIGetMsg()
		If $idMsg = $idBtn_Del1 Then $i = Create($iInc)

		If $idMsg = $g_idBtn_Del Then
			GUICtrlDelete($g_aidGraphics[$i])
			$i = $i + $iInc
			If $i < 0 Or $i > $g_MAXGr Then Exit
		EndIf
	Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func Create($iInc)
	GUIDelete($g_hChild)
	CreateChild()
	If $iInc = -1 Then Return 5
	Return 1
EndFunc   ;==>Create

Func CreateChild()
	$g_hChild = GUICreate("Meine Zeichnung")
	$g_idBtn_Del = GUICtrlCreateButton("Löschen", 50, 165, 50)

	$g_aidGraphics[1] = GUICtrlCreateGraphic(20, 50, 100, 100)
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

	$g_aidGraphics[2] = GUICtrlCreateGraphic(220, 10, 100, 100)

	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0, 0xff)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 50, 50, 40, 30, 270)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x00ff00, 0xffffff)
	GUICtrlSetGraphic(-1, $GUI_GR_PIE, 58, 50, 40, -60, 90)

	$g_aidGraphics[3] = GUICtrlCreateGraphic(220, 110, 100, 100)
	GUICtrlSetBkColor(-1, 0xf08080)
	GUICtrlSetColor(-1, 0xff)
	GUICtrlSetGraphic(-1, $GUI_GR_HINT, 1)

	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff00)
	GUICtrlSetGraphic(-1, $GUI_GR_RECT, 50, 50, 80, 80)

	$g_aidGraphics[4] = GUICtrlCreateGraphic(20, 200, 80, 80)
	GUICtrlSetBkColor(-1, 0xffffff)
	GUICtrlSetGraphic(-1, $GUI_GR_HINT, 1)

	GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 10, 10)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 30, 40)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff00)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 70, 70)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff0000)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 10, 50)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xffff00)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 10, 10)

	$g_aidGraphics[5] = GUICtrlCreateGraphic(150, 10, 50, 50)
	GUICtrlSetBkColor(-1, 0xa0ffa0)
	GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 20, 20) ; Startpunkt
	; Es ist besser eine Linie bis zum Endpunkt zu zeichnen,
	; Um das ständige wechseln der Farbe zu umgehen
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0x0000ff)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 30, 30)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 20, 40)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xff0000)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 25, 25)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 40, 40)
	GUICtrlSetGraphic(-1, $GUI_GR_DOT, 30, 40)

	$g_aidGraphics[6] = GUICtrlCreateGraphic(110, 260, 230, 130)
	GUICtrlSetColor(-1, 0) ; Um eine schwarze Umrandung anzuzeigen
	GUICtrlSetBkColor(-1, 0xc0c0ff)
	GUICtrlSetGraphic(-1, $GUI_GR_HINT, 3) ; Um Punkte am Control und Endpunkte der Linien/Bezierkurven anzuzeigen

	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0, 0xff) ; Mit Blau füllen
	GUICtrlSetGraphic(-1, $GUI_GR_MOVE, 120, 20) ; Startpunkt
	GUICtrlSetGraphic(-1, $GUI_GR_BEZIER, 120, 100, 200, 20, 200, 100)
	GUICtrlSetGraphic(-1, $GUI_GR_BEZIER + $GUI_GR_CLOSE, 100, 40, 40, 100, 40, 20)
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, 60, 30) ; Startpunkt

	GUISetState(@SW_SHOW)
EndFunc   ;==>CreateChild
