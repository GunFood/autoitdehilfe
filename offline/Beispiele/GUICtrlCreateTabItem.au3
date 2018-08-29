#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit Tabs", 250, 175); Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetBkColor(0x00E0FFFF)
	GUISetFont(9, 300)

	Local $idTab = GUICtrlCreateTab(10, 10, 200, 100)

	GUICtrlCreateTabItem("Tab0")
	GUICtrlCreateLabel("Beschriftung0", 30, 80, 80, 20)
	GUICtrlCreateButton("OK0", 20, 50, 50, 20)
	GUICtrlCreateInput("Standard", 80, 50, 70, 20)

	GUICtrlCreateTabItem("Tab----1")
	GUICtrlCreateLabel("Beschriftung1", 30, 80, 80, 20)
	GUICtrlCreateCombo("", 20, 50, 60, 120)
	GUICtrlSetData(-1, "Trids|CyberSlug|Larry|Jon|Tylo|guinness", "Jon") ; Standardwert Jon
	GUICtrlCreateButton("OK1", 80, 50, 50, 20)

	GUICtrlCreateTabItem("Tab2")
	GUICtrlSetState(-1, $GUI_SHOW) ; Erscheint zuerst
	GUICtrlCreateLabel("Beschriftung2", 30, 80, 80, 20)
	GUICtrlCreateButton("OK2", 140, 50, 50)

	GUICtrlCreateTabItem(""); Beendet die Tab Definition

	GUICtrlCreateLabel("Klicke auf einen Tab und dessen Beschriftung wird sichtbar", 20, 130, 250, 40)

	GUISetState(@SW_SHOW)

Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		$idMsg = GUIGetMsg()

		If $idMsg = $GUI_EVENT_CLOSE Then ExitLoop
		If $idMsg = $idTab Then
			; Der angeklickte Tab erscheint
			WinSetTitle("Meine GUI mit Tabs", "", "Meine GUI mit Tabs" & GUICtrlRead($idTab))
		EndIf
	WEnd
EndFunc   ;==>Example
