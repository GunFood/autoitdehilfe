Local $aCaretPos = WinGetCaretPos()
If Not @error Then
	ToolTip("Erste Methode", $aCaretPos[0], $aCaretPos[1])
EndIf
Sleep(2000)

$aCaretPos = _WinGetCaretPos()
If Not @error Then
	ToolTip("Zweite Methode", $aCaretPos[0], $aCaretPos[1])
EndIf
Sleep(2000)

;Eine zuverlässigere Methode, um die Koordinaten in MDI Texteditoren herauszufinden ("Multiple Document Interface")
Func _WinGetCaretPos()
	Local $iXAdjust = 5
	Local $iYAdjust = 40

	Local $iOpt = Opt("CaretCoordMode", 0) ; Setzt den "CaretCoordMode" auf den relativen Modus und speichert die vorherige Option.
	Local $aGetCaretPos = WinGetCaretPos() ; Ermittelt die relativen Cursor Koordinaten.
	Local $aGetPos = WinGetPos("[ACTIVE]") ; Ermittelt sowohl die Position als auch die Höhe und Breite des aktiven Fensters.
	Local $sControl = ControlGetFocus("[ACTIVE]") ; Ermittel den Controlnamen welches den Tastaturfokus besitzt.
	Local $aControlPos = ControlGetPos("[ACTIVE]", "", $sControl) ; Ermittelt die Position als auch die Größe des Controls.
	$iOpt = Opt("CaretCoordMode", $iOpt) ; Setzt den "CaretCoordMode" zurück auf die vorherige Option.

	Local $aReturn[2] = [0, 0] ; Erstellt ein Array um die X- und Y-Position zu speichern.
	If IsArray($aGetCaretPos) And IsArray($aGetPos) And IsArray($aControlPos) Then
		$aReturn[0] = $aGetCaretPos[0] + $aGetPos[0] + $aControlPos[0] + $iXAdjust
		$aReturn[1] = $aGetCaretPos[1] + $aGetPos[1] + $aControlPos[1] + $iYAdjust
		Return $aReturn ; Gibt das Array zurück.
	Else
		Return SetError(1, 0, $aReturn) ; Gibt das Array zurück. und setzt das @error Flag auf 1.
	EndIf
EndFunc   ;==>_WinGetCaretPos
