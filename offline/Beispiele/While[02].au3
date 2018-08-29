; Setzt einen Hotkey für die Esc-Taste um das Skript zu beenden.
HotKeySet("{ESC}", "_Terminate")

Example()

Func Example()
	; Initialisiert ein lokale Variable.
	Local $aMgp = 0

	; Erstellt eine Endlosschleife, da 1 immer 1 und somit True ist.
	While 1
		; Weist einer lokalen Variable die Koordinaten des Cursors zu (Array).
		$aMgp = MouseGetPos()

		; Zeigt ein Tooltip in der Nähe des Cursors mit dessen Koordinaten an.
		ToolTip("x: " & $aMgp[0] & ", y: " & $aMgp[1], $aMgp[0] + 10, $aMgp[1] + 10)

		; Vermeidung zu hoher CPU-Last.
		Sleep(50)
	WEnd
EndFunc   ;==>Example

Func _Terminate()
	Exit
EndFunc   ;==>_Terminate
