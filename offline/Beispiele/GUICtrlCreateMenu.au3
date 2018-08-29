#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>

Example()

Func Example()
	Local $sDefaultstatus = "Bereit"

	GUICreate("Mein GUI Menü", 300, 200)

	Local $idFilemenu = GUICtrlCreateMenu("&Datei")
	Local $idFileitem = GUICtrlCreateMenuItem("Öffnen", $idFilemenu)
	GUICtrlSetState(-1, $GUI_DEFBUTTON)
	Local $idHelpmenu = GUICtrlCreateMenu("?")
	GUICtrlCreateMenuItem("Speichern", $idFilemenu)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $idInfoitem = GUICtrlCreateMenuItem("Info", $idHelpmenu)
	Local $idExititem = GUICtrlCreateMenuItem("Beenden", $idFilemenu)
	Local $idRecentfilesmenu = GUICtrlCreateMenu("Letzte Dateien", $idFilemenu, 1)

	GUICtrlCreateMenuItem("", $idFilemenu, 2) ; Erstellt eine Trennlinie (hier: leere Zeile)

	Local $idViewmenu = GUICtrlCreateMenu("Ansicht", -1, 1) ; Wird vor dem "?" Menü erstellt
	Local $idViewstatusitem = GUICtrlCreateMenuItem("Statusbar", $idViewmenu)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateButton("OK", 50, 130, 70, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	Local $idCancelbutton = GUICtrlCreateButton("Abbrechen", 180, 130, 70, 20)

	Local $idStatuslabel = GUICtrlCreateLabel($sDefaultstatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		Switch GUIGetMsg()
			Case $idFileitem
				$file = FileOpenDialog("Wählen Sie eine Datei aus...", @TempDir, "Alle (*.*)")
				If @error <> 1 Then GUICtrlCreateMenuItem($file, $idRecentfilesmenu)
			Case $idViewstatusitem
				If BitAND(GUICtrlRead($idViewstatusitem), $GUI_CHECKED) = $GUI_CHECKED Then
					GUICtrlSetState($idViewstatusitem, $GUI_UNCHECKED)
					GUICtrlSetState($idStatuslabel, $GUI_HIDE)
				Else
					GUICtrlSetState($idViewstatusitem, $GUI_CHECKED)
					GUICtrlSetState($idStatuslabel, $GUI_SHOW)
				EndIf
			Case $GUI_EVENT_CLOSE, $idCancelbutton, $idExititem
				ExitLoop
			Case $idInfoitem
				MsgBox($MB_SYSTEMMODAL, "Info", "Nur ein Test...")
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example



