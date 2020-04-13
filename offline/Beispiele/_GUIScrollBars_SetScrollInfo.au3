#include <GUIConstantsEx.au3>
#include <GuiScrollBars.au3>
#include <StructureConstants.au3>
#include <WindowsConstants.au3>

; Hinweis: Die Buttons im Beispiel haben keinerlei Funktion, sie sollen nur verdeutlichen, dass beim Scrollen alle zur betreffenden GUI gehörenden Items verschoben werden!

Example()

Func Example()
	Local $idFileMenu, $idExititem, $hGuiMsg, $hGui, $h_GUIC, $h_GUIC2
	Local $idListview, $idButton

	; Erstellen der GUI
	$hGui = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	GUISetBkColor(0x88AABB)

	; Menü erstellen
	$idFileMenu = GUICtrlCreateMenu("Datei")
	$idExititem = GUICtrlCreateMenuItem("Beenden", $idFileMenu)

	; ListView und Button erstellen
	$idListview = GUICtrlCreateListView("Spalte1  |Spalte2|Spalte3", 10, 10, 200, 150) ;,$LVS_SORTDESCENDING)
	For $x = 1 To 30
		GUICtrlCreateListViewItem("Item" & $x & "|Spalte2|Spalte3", $idListview)
	Next
	GUICtrlSetResizing($idListview, $GUI_DOCKALL)
	$idButton = GUICtrlCreateButton("Wert?", 75, 170, 70, 20)
	GUICtrlSetResizing($idButton, $GUI_DOCKALL)

	; Einen Nachfahren von $hGui erstellen (ein so genanntes Tochter- oder Child-Fenster)
	$h_GUIC = GUICreate("1. Child-GUI", 200, 200, 10, 200, $WS_CHILD, $WS_EX_CLIENTEDGE, $hGui)
	; Einen Button in der neuen GUI erstellen
	GUICtrlCreateButton("Ein Button in Child-GUI 1", 10, 10, 150, 20)
	GUISetBkColor(0X006400) ; Hintergrundfarbe Grün
	GUISetState(@SW_SHOW)
	GUICtrlSetResizing($h_GUIC, $GUI_DOCKALL)

	; Zur urprünglichen GUI wechseln
	GUISwitch($hGui)

	; Einen weiteren Nachfahren von $hGui erstellen (ein so genanntes Tochter- oder Child-Fenster)
	$h_GUIC2 = GUICreate("2. Child-GUI", 200, 200, 215, 10, $WS_CHILD, $WS_EX_CLIENTEDGE, $hGui)
	; Einen Button in der neuen GUI erstellen
	GUICtrlCreateButton("Ein Button in Child-GUI 2", 10, 10, 150, 20)
	GUISetBkColor(0XA40000) ; Hintergrundfarbe Rot
	GUISetState(@SW_SHOW)
	GUICtrlSetResizing($h_GUIC2, $GUI_DOCKALL)

	; Zur urprünglichen GUI wechseln
	GUISwitch($hGui)

	; Selbstbehandelte Nachrichten registrieren
	GUIRegisterMsg($WM_SIZE, "WM_SIZE") ; Fenstergröße ändern
	GUIRegisterMsg($WM_VSCROLL, "WM_VSCROLL") ; Vertikales Scrollen
	GUIRegisterMsg($WM_HSCROLL, "WM_HSCROLL") ; Horizontales Scrollen

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGui)
	_GUIScrollBars_Init($h_GUIC)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$hGuiMsg = GUIGetMsg()
		Switch $hGuiMsg
			Case $GUI_EVENT_CLOSE, $idExititem
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Fenstergröße wurde geändert
Func WM_SIZE($hWnd, $iMsg, $wParam, $lParam)
	#forceref $iMsg, $wParam
	Local $iIndex = -1, $iCharY, $iCharX, $iClientXMax, $iClientX, $iClientY, $ivMax
	For $x = 0 To UBound($__g_aSB_WindowInfo) - 1
		If $__g_aSB_WindowInfo[$x][0] = $hWnd Then
			$iIndex = $x
			$iClientXMax = $__g_aSB_WindowInfo[$iIndex][1]
			$iCharX = $__g_aSB_WindowInfo[$iIndex][2]
			$iCharY = $__g_aSB_WindowInfo[$iIndex][3]
			$ivMax = $__g_aSB_WindowInfo[$iIndex][7]
			ExitLoop
		EndIf
	Next
	If $iIndex = -1 Then Return 0

	Local $tSCROLLINFO = DllStructCreate($tagSCROLLINFO)

	; Ermittelt die Abmessungen der Arbeitsfläche.
	$iClientX = BitAND($lParam, 0x0000FFFF)
	$iClientY = BitShift($lParam, 16)
	$__g_aSB_WindowInfo[$iIndex][4] = $iClientX
	$__g_aSB_WindowInfo[$iIndex][5] = $iClientY

	; Setzt den vertikalen Scrollbereich und die Seitengröße
	DllStructSetData($tSCROLLINFO, "fMask", BitOR($SIF_RANGE, $SIF_PAGE))
	DllStructSetData($tSCROLLINFO, "nMin", 0)
	DllStructSetData($tSCROLLINFO, "nMax", $ivMax)
	DllStructSetData($tSCROLLINFO, "nPage", $iClientY / $iCharY)
	_GUIScrollBars_SetScrollInfo($hWnd, $SB_VERT, $tSCROLLINFO)

	; Setzt den horizontalen Scrollbereich und die Seitengröße
	DllStructSetData($tSCROLLINFO, "fMask", BitOR($SIF_RANGE, $SIF_PAGE))
	DllStructSetData($tSCROLLINFO, "nMin", 0)
	DllStructSetData($tSCROLLINFO, "nMax", 2 + $iClientXMax / $iCharX)
	DllStructSetData($tSCROLLINFO, "nPage", $iClientX / $iCharX)
	_GUIScrollBars_SetScrollInfo($hWnd, $SB_HORZ, $tSCROLLINFO)

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE

; Horizontales Scrollen
Func WM_HSCROLL($hWnd, $iMsg, $wParam, $lParam)
	#forceref $iMsg, $lParam
	Local $iScrollCode = BitAND($wParam, 0x0000FFFF)

	Local $iIndex = -1, $iCharX, $iPosX
	Local $iMin, $iMax, $iPage, $iPos, $iTrackPos

	For $x = 0 To UBound($__g_aSB_WindowInfo) - 1
		If $__g_aSB_WindowInfo[$x][0] = $hWnd Then
			$iIndex = $x
			$iCharX = $__g_aSB_WindowInfo[$iIndex][2]
			ExitLoop
		EndIf
	Next
	If $iIndex = -1 Then Return 0

	; Ermittelt alle Informationen der horizontalen Scrollbar
	Local $tSCROLLINFO = _GUIScrollBars_GetScrollInfoEx($hWnd, $SB_HORZ)
	$iMin = DllStructGetData($tSCROLLINFO, "nMin")
	$iMax = DllStructGetData($tSCROLLINFO, "nMax")
	$iPage = DllStructGetData($tSCROLLINFO, "nPage")
	$iPosX = DllStructGetData($tSCROLLINFO, "nPos")
	$iTrackPos = DllStructGetData($tSCROLLINFO, "nTrackPos")
	; Speichert die x-Position für einen späteren Vergleich
	$iPos = $iPosX
	#forceref $iMin, $iMax
	; Auswertung der vom System gemeldeten Scroll-Nachricht
	Switch $iScrollCode
		Case $SB_LINELEFT ; Der Anwender klickte auf den linken Pfeil
			DllStructSetData($tSCROLLINFO, "nPos", $iPos - 1)

		Case $SB_LINERIGHT ; Der Anwender klickte auf den rechten Pfeil
			DllStructSetData($tSCROLLINFO, "nPos", $iPos + 1)

		Case $SB_PAGELEFT ; Der Anwender klickte links neben dem Scrollbalken
			DllStructSetData($tSCROLLINFO, "nPos", $iPos - $iPage)

		Case $SB_PAGERIGHT ; Der Anwender klickte rechts neben dem Scrollbalken
			DllStructSetData($tSCROLLINFO, "nPos", $iPos + $iPage)

		Case $SB_THUMBTRACK ; Der Anwender zog den Scrollbalken
			DllStructSetData($tSCROLLINFO, "nPos", $iTrackPos)
	EndSwitch

;~    // Setzt die neue Position und ermittelt sie danach erneut.
;~    // Abhängig von den Windows-Einstellungen kann es sein, dass die gelesenen Werte nicht die gleichen sind, wie die vorher gesetzten.

	DllStructSetData($tSCROLLINFO, "fMask", $SIF_POS)
	_GUIScrollBars_SetScrollInfo($hWnd, $SB_HORZ, $tSCROLLINFO)
	_GUIScrollBars_GetScrollInfo($hWnd, $SB_HORZ, $tSCROLLINFO)
	; // Falls sich die x-Position der Scrollbar geändert hat, den Fensterbereich verschieben und aktualisieren
	$iPos = DllStructGetData($tSCROLLINFO, "nPos")
	If ($iPos <> $iPosX) Then _GUIScrollBars_ScrollWindow($hWnd, $iCharX * ($iPosX - $iPos), 0)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_HSCROLL

; Vertikales Scrollen
Func WM_VSCROLL($hWnd, $iMsg, $wParam, $lParam)
	#forceref $iMsg, $wParam, $lParam
	Local $iScrollCode = BitAND($wParam, 0x0000FFFF)
	Local $iIndex = -1, $iCharY, $iPosY
	Local $iMin, $iMax, $iPage, $iPos, $iTrackPos

	For $x = 0 To UBound($__g_aSB_WindowInfo) - 1
		If $__g_aSB_WindowInfo[$x][0] = $hWnd Then
			$iIndex = $x
			$iCharY = $__g_aSB_WindowInfo[$iIndex][3]
			ExitLoop
		EndIf
	Next
	If $iIndex = -1 Then Return 0

	; Ermittelt alle Informationen der vertikalen Scrollbar
	Local $tSCROLLINFO = _GUIScrollBars_GetScrollInfoEx($hWnd, $SB_VERT)
	$iMin = DllStructGetData($tSCROLLINFO, "nMin")
	$iMax = DllStructGetData($tSCROLLINFO, "nMax")
	$iPage = DllStructGetData($tSCROLLINFO, "nPage")
	$iPosY = DllStructGetData($tSCROLLINFO, "nPos")
	$iTrackPos = DllStructGetData($tSCROLLINFO, "nTrackPos")
	; Speichert die y-Position für einen späteren Vergleich
	$iPos = $iPosY

	; Auswertung der vom System gemeldeten Scroll-Nachricht
	Switch $iScrollCode
		Case $SB_TOP ; Der Anwender klickte auf die "Pos1"-Taste
			DllStructSetData($tSCROLLINFO, "nPos", $iMin)

		Case $SB_BOTTOM ; Der Anwender klickte auf die "Ende"-Taste
			DllStructSetData($tSCROLLINFO, "nPos", $iMax)

		Case $SB_LINEUP ; Der Anwender klickte auf den oberen Pfeil
			DllStructSetData($tSCROLLINFO, "nPos", $iPos - 1)

		Case $SB_LINEDOWN ; Der Anwender klickte auf den unteren Pfeil
			DllStructSetData($tSCROLLINFO, "nPos", $iPos + 1)

		Case $SB_PAGEUP ; Der Anwender klickte oberhalb des Scrollbalkens
			DllStructSetData($tSCROLLINFO, "nPos", $iPos - $iPage)

		Case $SB_PAGEDOWN ; Der Anwender klickte unterhalb des Scrollbalkens
			DllStructSetData($tSCROLLINFO, "nPos", $iPos + $iPage)

		Case $SB_THUMBTRACK ; Der Anwender zog den Scrollbalken
			DllStructSetData($tSCROLLINFO, "nPos", $iTrackPos)
	EndSwitch

;~    // Setzt die neue Position und ermittelt sie danach erneut.
;~    // Abhängig von den Windows-Einstellungen kann es sein, dass die gelesenen Werte nicht die gleichen sind, wie die vorher gesetzten.

	DllStructSetData($tSCROLLINFO, "fMask", $SIF_POS)
	_GUIScrollBars_SetScrollInfo($hWnd, $SB_VERT, $tSCROLLINFO)
	_GUIScrollBars_GetScrollInfo($hWnd, $SB_VERT, $tSCROLLINFO)
	; // Falls sich die y-Position der Scrollbar geändert hat, den Fensterbereich verschieben und aktualisieren
	$iPos = DllStructGetData($tSCROLLINFO, "nPos")
	If ($iPos <> $iPosY) Then
		_GUIScrollBars_ScrollWindow($hWnd, 0, $iCharY * ($iPosY - $iPos))
		$iPosY = $iPos
	EndIf

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_VSCROLL
