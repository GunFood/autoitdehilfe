#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <TrayConstants.au3>

#NoTrayIcon

Opt("TrayMenuMode", 3) ; Die Standard Traymenüeinträge (Skript pausieren/beenden) werden nicht angezeigt und die Items werden nicht angehakt wenn diese ausgewählt werden. Verwendet wurden die Optionen 1 und 2 für TrayMenuMode.
Opt("TrayOnEventMode", 1) ; Aktiviert TrayOnEventMode.

Example()

Func Example()
	TrayCreateItem("Über")
	TrayItemSetOnEvent(-1, "About")

	TrayCreateItem("") ; Erzeugt einen Trennstrich.

	TrayCreateItem("Beenden")
	TrayItemSetOnEvent(-1, "ExitScript")

	TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "About") ; Zeigt ein Nachrichtenfenster von 'Über' wenn das Trayicon mit der linken Maustaste doppelgeklickt wurden

	TraySetState($TRAY_ICONSTATE_SHOW) ; Zeigt das Traymenü.

	While 1
		Sleep(100) ; CPU-Last verhindern
	WEnd
EndFunc   ;==>Example

Func About()
	; Zeigt ein Nachrichtenfenster mit der AutoIt Version und dem Installationspfad der AutoIt Startdatei.
	MsgBox($MB_SYSTEMMODAL, "", "AutoIt Traymenü Beispiel." & @CRLF & @CRLF & _
			"Version: " & @AutoItVersion & @CRLF & _
			"Installationspfad: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", $STR_NOCASESENSEBASIC, -1) - 1)) ; Ermittelt den Ordner eines kompletten Pfads.
EndFunc   ;==>About

Func ExitScript()
	Exit
EndFunc   ;==>ExitScript
