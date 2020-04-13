#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit Tabs") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetBkColor(0x00E0FFFF)
	GUISetFont(9, 300)

	GUICtrlCreateTab(10, 10, 200, 100)

	GUICtrlCreateTabItem("Tab0")
	GUICtrlCreateLabel("Beschriftung0", 30, 80, 80, 20)
	GUICtrlCreateButton("OK0", 20, 50, 50, 20)
	GUICtrlCreateInput("Standard", 80, 50, 70, 20)

	GUICtrlCreateTabItem("Tab----1")
	GUICtrlCreateLabel("Beschriftung1", 30, 80, 80, 20)
	GUICtrlCreateCombo("", 20, 50, 60, 120)
	GUICtrlSetData(-1, "Trids|CyberSlug|Larry|Jon|Tylo|guinness", "Jon") ; Standard Jon
	GUICtrlCreateButton("OK1", 80, 50, 50, 20)

	GUICtrlCreateTabItem("Tab2")
	GUICtrlSetState(-1, $GUI_SHOW) ; Lässt die GUI anzeigen
	GUICtrlCreateLabel("Beschriftung2", 30, 80, 80, 20)
	GUICtrlCreateButton("OK2", 140, 50, 50)

	GUICtrlCreateTabItem("") ; Beendet die Tab Definition

	GUICtrlCreateLabel("Beschriftung3", 20, 130, 80, 20)

	GUISetState(@SW_SHOW)

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$idMsg = GUIGetMsg()

		If $idMsg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
