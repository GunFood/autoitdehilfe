#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

; Warnung: SetItemParam ist nicht bei einem mit GuiCtrlCreateListViewItem erzeugtem Item zu verwenden!
; Der Parameter ist die Control-ID des Items

Example()

Func Example()
	Global $hGUI, $iI, $hListView

	; Erstellt eine GUI
	$hGUI = GUICreate("(UDF) ListView: Sucht ein Item mit einem bestimmten Parameter", 550, 300)
	$hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 544, 268)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 100
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Setzt den Parameterwert 1234 für das 50. Item
	_GUICtrlListView_SetItemParam($hListView, 49, 1234)

	; Sucht das Item mit dem Parameter 1234
	$iI = _GUICtrlListView_FindParam($hListView, 1234)
	MsgBox($MB_SYSTEMMODAL, "Information", "Index des Zielitems: " & $iI)
	_GUICtrlListView_EnsureVisible($hListView, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
