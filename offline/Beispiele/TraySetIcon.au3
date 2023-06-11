#include <TrayConstants.au3> ; wird für die $TRAY_ICONSTATE_SHOW Konstante benötigt.

#NoTrayIcon

Opt("TrayMenuMode", 3) ; Die Standard Traymenüeinträge (Skript pausieren/beenden) werden nicht angezeigt und die Items werden nicht angehakt wenn diese ausgewählt werden. Verwendet wurden die Optionen 1 und 2 für TrayMenuMode.

Example()

Func Example()
	Local $idExit = TrayCreateItem("Beenden")

	TraySetState($TRAY_ICONSTATE_SHOW) ; Zeigt das Traymenü.

	Local $hTimer = TimerInit() ; Startet den Timer und speichert das Handle in einer Variable.
	Local $fDiff = 0, $iIndex = 0

	While 1
		$fDiff = TimerDiff($hTimer) ; Ermittelt den Zeitunterschied zu dem vorherigen Aufruf von TimerInit
		If $fDiff > 1000 Then ; Falls der Unterschied größer als eine Sekunden ist, so wird das Traymenüicon geändert.

			$iIndex = -Random(0, 100, 1) ; Negativ um die Ordinalnummerierung zu verwenden
			TraySetToolTip("Aktuell wird das Icon shell32.dll, " & $iIndex & " verwendet.") ; Setzt den Traymnenü Tooltip mit Informationen über den Iconindex.
			TraySetIcon("shell32.dll", $iIndex) ; Setzt das Traymnenüicon mit der shell32.dll und einer Zufallsindexzahl.
			$hTimer = TimerInit() ; Setzt den Timer zurück.

		EndIf

		Switch TrayGetMsg()
			Case $idExit ; Beendet die Schleife.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example
