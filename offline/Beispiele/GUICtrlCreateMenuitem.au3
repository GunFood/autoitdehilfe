#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>

Example()

Func Example()
	GUICreate("Mein GUI Menü", 300, 200)

	Global $sStatus = "Fertig"

	Local $idFileMenu = GUICtrlCreateMenu("&Datei")
	Local $idFileItem = GUICtrlCreateMenuItem("Öffnen", $idFileMenu)
	GUICtrlSetState(-1, $GUI_DEFBUTTON)
	Local $idHelpMenu = GUICtrlCreateMenu("?")
	GUICtrlCreateMenuItem("Speichern", $idFileMenu)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $idInfoItem = GUICtrlCreateMenuItem("Info", $idFileMenu)
	Local $idExit = GUICtrlCreateMenuItem("Beenden", $idFileMenu)
	Local $idRecentFilesMenu = GUICtrlCreateMenu("Letzte Dateien", $idFileMenu, 1)

	GUICtrlCreateMenuItem("", $idFileMenu, 2) ; Erstellt eine leere Zeile

	Local $idViewMenu = GUICtrlCreateMenu("Ansicht", -1, 1) ; Wird vor dem "?" Menü erstellt
	Local $idViewStatusItem = GUICtrlCreateMenuItem("Statuszeile", $idViewMenu)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateButton("OK", 50, 130, 70, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	Local $idCancel = GUICtrlCreateButton("Abbrechen", 180, 130, 70, 20)

	Local $idStatusLabel = GUICtrlCreateLabel($sStatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))

	GUISetState(@SW_SHOW)

	Local $sFilePath
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idCancel, $idExit
				Exit

			Case $idInfoItem
				MsgBox($MB_SYSTEMMODAL, "Info", "Nur ein Test...")

			Case $idFileItem
				$file = FileOpenDialog("Wählen Sie eine Datei aus...", @TempDir, "Alle (*.*)")
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlCreateMenuItem($sFilePath, $idRecentFilesMenu)

			Case $idViewStatusItem
				If BitAND(GUICtrlRead($idViewStatusItem), $GUI_CHECKED) = $GUI_CHECKED Then
					GUICtrlSetState($idViewStatusItem, $GUI_UNCHECKED)
					GUICtrlSetState($idStatusLabel, $GUI_HIDE)
				Else
					GUICtrlSetState($idViewStatusItem, $GUI_CHECKED)
					GUICtrlSetState($idStatusLabel, $GUI_SHOW)
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>Example
