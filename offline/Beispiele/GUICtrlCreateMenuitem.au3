#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>

Example()

Func Example()
	GUICreate("Mein GUI Menü", 300, 200)

	Global $sStatus = "Fertig"

	Local $idMnu_File = GUICtrlCreateMenu("&Datei")
	Local $idMni_File = GUICtrlCreateMenuItem("Öffnen", $idMnu_File)
	GUICtrlSetState(-1, $GUI_DEFBUTTON)
	Local $idMnu_Help = GUICtrlCreateMenu("?")
	GUICtrlCreateMenuItem("Speichern", $idMnu_File)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $idMni_Info = GUICtrlCreateMenuItem("Info", $idMnu_File)
	Local $idMni_Exit = GUICtrlCreateMenuItem("Beenden", $idMnu_File)
	Local $idMnu_RecentFiles = GUICtrlCreateMenu("Letzte Dateien", $idMnu_File, 1)

	GUICtrlCreateMenuItem("", $idMnu_File, 2) ; Erstellt eine leere Zeile

	Local $idMnu_View = GUICtrlCreateMenu("Ansicht", -1, 1) ; Wird vor dem "?" Menü erstellt
	Local $idMni_ViewStatus = GUICtrlCreateMenuItem("Statuszeile", $idMnu_View)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateButton("OK", 50, 130, 70, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	Local $idBtn_Cancel = GUICtrlCreateButton("Abbrechen", 180, 130, 70, 20)

	Local $idLbl_Status = GUICtrlCreateLabel($sStatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))

	GUISetState(@SW_SHOW)

	Local $sFilePath
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idBtn_Cancel, $idMni_Exit
				Exit

			Case $idMni_Info
				MsgBox($MB_SYSTEMMODAL, "Info", "Nur ein Test...")

			Case $idMni_File
				$file = FileOpenDialog("Wählen Sie eine Datei aus...", @TempDir, "Alle (*.*)")
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlCreateMenuItem($sFilePath, $idMnu_RecentFiles)

			Case $idMni_ViewStatus
				If BitAND(GUICtrlRead($idMni_ViewStatus), $GUI_CHECKED) = $GUI_CHECKED Then
					GUICtrlSetState($idMni_ViewStatus, $GUI_UNCHECKED)
					GUICtrlSetState($idLbl_Status, $GUI_HIDE)
				Else
					GUICtrlSetState($idMni_ViewStatus, $GUI_CHECKED)
					GUICtrlSetState($idLbl_Status, $GUI_SHOW)
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>Example
