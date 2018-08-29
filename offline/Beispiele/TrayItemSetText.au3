#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <TrayConstants.au3> ; wird für die $TRAY_ICONSTATE_SHOW, $TRAY_ITEM_EXIT und $TRAY_ITEM_PAUSE Konstanten benötigt.

#NoTrayIcon

Opt("TrayAutoPause", 0) ; Das Skript pauiert nicht, wenn das Trayicon ausgewählt wurde.
Opt("TrayMenuMode", 2) ; Items werden nicht angehakt, wenn diese augewählt wurden.

Example()

Func Example()
	Local $idRandom = TrayCreateItem("Zufall:") ; Dieses Item ist auszuwählen um den Text mit einer Zufallszahl zu füllen.
	TrayCreateItem("") ; Erzeugt einen Trennstrich.

	Local $idAbout = TrayCreateItem("Über")

	TraySetState($TRAY_ICONSTATE_SHOW) ; Zeigt das Traymenü.

	TrayItemSetText($TRAY_ITEM_EXIT, "Programm beenden") ; Setzt den Text des Standard 'Pause' Items.
	TrayItemSetText($TRAY_ITEM_PAUSE, "Programm pausieren") ; Setzt den Text des Standard 'Beenden' Items.

	While 1
		Switch TrayGetMsg()
			Case $idAbout ; Zeigt ein Nachrichtenfenster mit der AutoIt Version und dem Installationspfad der AutoIt Startdatei.
				MsgBox($MB_SYSTEMMODAL, "", "AutoIt Traymenü Beispiel." & @CRLF & @CRLF & _
						"Version: " & @AutoItVersion & @CRLF & _
						"Installationspfad: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", $STR_NOCASESENSEBASIC, -1) - 1)) ; Ermittelt den Ordner eines kompletten Pfads.

			Case $idRandom
				; Setzt den Text des 'Zufall' Items mir einem Zufallsinteger.
				TrayItemSetText($idRandom, "Zufall: " & Int(Random(1, 10, 1)))

		EndSwitch
	WEnd
EndFunc   ;==>Example
