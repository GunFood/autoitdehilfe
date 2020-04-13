#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

; Achtung: SetItemParam darf nicht im Zusammenhang mit Items verwendet werden, die mit GUICtrlCreateTabItem erstellt wurden
; Param ist die ID für Items welche mit built-in Funktionen erstellt wurden

Example()

Func Example()
	Local $hGui, $idTab

	; Erstellt eine GUI
	$hGui = GUICreate("(Tab-Control: Setzt Itemparameter (UDF)", 400, 300)
	$idTab = _GUICtrlTab_Create($hGui, 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($idTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($idTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($idTab, 2, "Tab 3")

	; Ermittelt/Setzt Parameter für Tab 1
	_GUICtrlTab_SetItemParam($idTab, 0, 1234)
	MsgBox($MB_SYSTEMMODAL, "Information", "Parameter für Tab 1: " & _GUICtrlTab_GetItemParam($idTab, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
