#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>

Example()

Func Example()
	Local $sDefaultstatus = "Bereit"

	GUICreate("Mein GUI Menü", 300, 200)

	Local $idMnu_File = GUICtrlCreateMenu("&Datei")
	Local $idMni_File = GUICtrlCreateMenuItem("Öffnen", $idMnu_File)
	GUICtrlSetState(-1, $GUI_DEFBUTTON)
	Local $idMnu_Help = GUICtrlCreateMenu("?")
	GUICtrlCreateMenuItem("Speichern", $idMnu_File)
	GUICtrlSetState(-1, $GUI_DISABLE)
	Local $idMni_Info = GUICtrlCreateMenuItem("Info", $idMnu_Help)
	Local $idMni_Exit = GUICtrlCreateMenuItem("Beenden", $idMnu_File)
	Local $idMnu_Recentfiles = GUICtrlCreateMenu("Letzte Dateien", $idMnu_File, 1)

	GUICtrlCreateMenuItem("", $idMnu_File, 2) ; Erstellt eine Trennlinie (hier: leere Zeile)

	Local $idMnu_View = GUICtrlCreateMenu("Ansicht", -1, 1) ; Wird vor dem "?" Menü erstellt
	Local $idMni_Viewstatus = GUICtrlCreateMenuItem("Statusbar", $idMnu_View)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateButton("OK", 50, 130, 70, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	Local $idBtn_Cancel = GUICtrlCreateButton("Abbrechen", 180, 130, 70, 20)

	Local $idLbl_Status = GUICtrlCreateLabel($sDefaultstatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $idMni_File
				$file = FileOpenDialog("Wählen Sie eine Datei aus...", @TempDir, "Alle (*.*)")
				If @error <> 1 Then GUICtrlCreateMenuItem($file, $idMnu_Recentfiles)
			Case $idMni_Viewstatus
				If BitAND(GUICtrlRead($idMni_Viewstatus), $GUI_CHECKED) = $GUI_CHECKED Then
					GUICtrlSetState($idMni_Viewstatus, $GUI_UNCHECKED)
					GUICtrlSetState($idLbl_Status, $GUI_HIDE)
				Else
					GUICtrlSetState($idMni_Viewstatus, $GUI_CHECKED)
					GUICtrlSetState($idLbl_Status, $GUI_SHOW)
				EndIf
			Case $GUI_EVENT_CLOSE, $idBtn_Cancel, $idMni_Exit
				ExitLoop
			Case $idMni_Info
				MsgBox($MB_SYSTEMMODAL, "Info", "Nur ein Test...")
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example



