#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <TrayConstants.au3> ; wird für die $TRAY_ICONSTATE_SHOW Konstante benötigt.

#NoTrayIcon

Opt("TrayMenuMode", 3) ; Die Standard Traymenüeinträge (Skript pausieren/beenden) werden nicht angezeigt und die Items werden nicht angehakt wenn diese ausgewählt werden. Verwendet wurden die Optionen 1 und 2 für TrayMenuMode.

Example()

Func Example()
	Local $idSettings = TrayCreateMenu("Settings") ; Erstellt ein Traymenü mit zwei Untermenüs.
	Local $idDisplay = TrayCreateItem("Display", $idSettings)
	Local $idPrinter = TrayCreateItem("Printer", $idSettings)
	TrayCreateItem("") ; Erzeugt einen Trennstrich.

	Local $idAbout = TrayCreateItem("Über")
	TrayCreateItem("") ; Erzeugt einen Trennstrich.

	Local $idExit = TrayCreateItem("Exit")

	TraySetState($TRAY_ICONSTATE_SHOW) ; Zeigt das Traymenü.

	While 1
		Switch TrayGetMsg()
			Case $idAbout ; Zeigt ein Nachrichtenfenster mit der AutoIt Version und dem Installationspfad der AutoIt Startdatei.
				MsgBox($MB_SYSTEMMODAL, "", "AutoIt tray menu example." & @CRLF & @CRLF & _
						"Version: " & @AutoItVersion & @CRLF & _
						"Install Path: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", $STR_NOCASESENSEBASIC, -1) - 1)) ; Ermittelt den Ordner eines kompletten Pfads.

			Case $idDisplay, $idPrinter
				MsgBox($MB_SYSTEMMODAL, "", "A sub menu item was selected from the tray menu.")

			Case $idExit ; Beendet die Schleife.
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example
