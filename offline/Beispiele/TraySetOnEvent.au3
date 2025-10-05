#NoTrayIcon

#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <TrayConstants.au3> ; wird für die $TRAY_EVENT_PRIMARYDOUBLE, $TRAY_EVENT_SECONDARYUP und $TRAY_ICONSTATE_SHOW Konstanten benötigt.

Opt("TrayMenuMode", 3) ; Die Standard Traymenüeinträge (Skript pausieren/beenden) werden nicht angezeigt und die Items werden nicht angehakt wenn diese ausgewählt werden. Verwendet wurden die Optionen 1 und 2 für TrayMenuMode.
Opt("TrayOnEventMode", 1) ; Aktiviert TrayOnEventMode.

Example()

Func Example()
	TrayCreateItem("Über")

	TrayCreateItem("") ; Erzeugt einen Trennstrich.

	TrayCreateItem("Beenden")
	TrayItemSetOnEvent(-1, "ExitScript")

	TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "TrayEvent")
	TraySetOnEvent($TRAY_EVENT_SECONDARYUP, "TrayEvent")

	TraySetState($TRAY_ICONSTATE_SHOW) ; Zeigt das Traymenü.

	While 1
		Sleep(100) ; CPU-Last verhindern
	WEnd
EndFunc   ;==>Example

Func TrayEvent()
	Switch @TRAY_ID ; Prüft die letzt Trayitem-ID.
		Case $TRAY_EVENT_PRIMARYDOUBLE
			; Zeigt ein Nachrichtenfenster mit der AutoIt Version und dem Installationspfad der AutoIt Startdatei.
			MsgBox($MB_SYSTEMMODAL, "", "AutoIt Traymenü Beispiel." & @CRLF & @CRLF & _
					"Version: " & @AutoItVersion & @CRLF & _
					"Installationspfad: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", $STR_NOCASESENSEBASIC, -1) - 1)) ; Ermittelt den Ordner eines kompletten Pfads.

		Case $TRAY_EVENT_SECONDARYUP
			MsgBox($MB_SYSTEMMODAL, "", "Die rechte Maustaste wurde über dem Trayicon losgelassen.")

	EndSwitch
EndFunc   ;==>TrayEvent

Func ExitScript()
	Exit
EndFunc   ;==>ExitScript
