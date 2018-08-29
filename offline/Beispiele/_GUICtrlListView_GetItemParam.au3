#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

; Achtung SetItemParam darf nicht auf Items angewendet werden, welche mit GuiCtrlCreateListViewItem erstellt wurden
; Param ist die ID für Items die mit der Build-in Funktion erstellt wurden

Example_UDF_Created()

Func Example_UDF_Created()
	Local $hGUI, $hListView

	$hGUI = GUICreate("(UDF) ListView: Ermittelt den anwendungsspezifischen Wert eines Items", 550, 300)
	$hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 544, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Setzt den Parameter von Item 2
	_GUICtrlListView_SetItemParam($hListView, 1, 1234)
	; Ermittelt den Parameter von Item 2 und zeigt ihn an
	MsgBox(8256, "Information", "Parameter von Item 2: " & _GUICtrlListView_GetItemParam($hListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_UDF_Created
