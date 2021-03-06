#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListView

	GUICreate("ListView: Ermittelt die Textfarbe", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt die Farben
	_GUICtrlListView_SetBkColor($idListView, $CLR_MONEYGREEN)
	_GUICtrlListView_SetTextColor($idListView, $CLR_BLACK)
	_GUICtrlListView_SetTextBkColor($idListView, $CLR_MONEYGREEN)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($idListView, "Items", 100)

	; Fügt die Items hinzu
	_GUICtrlListView_BeginUpdate($idListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($idListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($idListView)

	; Zeigt die Farben
	MsgBox($MB_SYSTEMMODAL, "Information", "Hintergrundfarbe ....: " & _GUICtrlListView_GetBkColor($idListView) & @CRLF & _
			"Textfarbe .............: " & _GUICtrlListView_GetTextColor($idListView) & @CRLF & _
			"Texthintergrundfarbe: " & _GUICtrlListView_GetTextBkColor($idListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
