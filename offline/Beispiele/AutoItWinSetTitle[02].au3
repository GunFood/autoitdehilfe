#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Setzt den Titel des versteckten AutoIt Fensters
	AutoItWinSetTitle("Mein AutoIt Fenster")

	; Zeigt das versteckte AutoIt Fenster.
	AutoItWinShow()

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Zeigt das versteckte AutoIt Fenster. Gibt das Handle des Fensters zurück.
Func AutoItWinShow()
	Local $hWnd = WinGetHandle(AutoItWinGetTitle()) ; Ermittelt das Handle des versteckten AutoIt Fensters durch das ermitteln des Titels des versteckten AutoIt Fensters.
	WinMove($hWnd, "", (@DesktopWidth / 2) - 250, (@DesktopHeight / 2) - 250, 500, 500) ; Verschiebt das versteckte AutoIt Fenster und ändert die Größe für eine bessere Ansicht.
	WinSetState($hWnd, "", @SW_SHOW) ; Zeigt das versteckte AutoIt Fenster. Normalerweise ist dieses versteckt, aber in diesem Beispiel wird des gezeigt.
	Return $hWnd
EndFunc   ;==>AutoItWinShow
