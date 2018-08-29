#include <GUIConstantsEx.au3>

Opt('MustDeclareVars', 1)

Example()

Func Example()
	Local $tab, $tab0, $tab0OK, $tab0input
	Local $tab1, $tab1combo, $tab1OK
	Local $tab2, $tab2OK, $msg

	GUICreate("Meine GUI mit Tabs") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetFont(9, 300)

	$tab = GUICtrlCreateTab(10, 10, 200, 100)

	$tab0 = GUICtrlCreateTabItem("Tab0")
	GUICtrlCreateLabel("Beschriftung0", 30, 80, 80, 20)
	$tab0OK = GUICtrlCreateButton("OK0", 20, 50, 50, 20)
	$tab0input = GUICtrlCreateInput("Standard", 80, 50, 70, 20)

	$tab1 = GUICtrlCreateTabItem("Tab----1")
	GUICtrlCreateLabel("Beschriftung1", 30, 80, 80, 20)
	$tab1combo = GUICtrlCreateCombo("", 20, 50, 60, 120)
	GUICtrlSetData(-1, "Trids|CyberSlug|Larry|Jon|Tylo", "Jon") ; Standard Jon
	$tab1OK = GUICtrlCreateButton("OK1", 80, 50, 50, 20)

	$tab2 = GUICtrlCreateTabItem("Tab2")
	GUICtrlSetState(-1, $GUI_SHOW) ; L&auml;sst die GUI anzeigen
	GUICtrlCreateLabel("Beschriftung2", 30, 80, 80, 20)
	$tab2OK = GUICtrlCreateButton("OK2", 140, 50, 50)

	GUICtrlCreateTabItem("") ; Beendet die Tab Definition

	GUICtrlCreateLabel("Beschriftung3", 20, 130, 80, 20)

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
EndFunc   ;==>Example
