#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $iY, $idListView

	GUICreate("ListView: Berechnet die ungefähre Höhe", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalte hinzufügen
	_GUICtrlListView_InsertColumn($idListView, 0, "Spalte 1", 80)

	; Fügt die Items hinzu
	For $iI = 0 To 9
		_GUICtrlListView_AddItem($idListView, "Zeile " & $iI)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Berechne nun die ungefähre Höhe für die Anzeige der Einträge.")
	; Neuaufbau des Listviews
	$iY = _GUICtrlListView_ApproximateViewHeight($idListView)
	_WinAPI_SetWindowPos(GUICtrlGetHandle($idListView), 0, 2, 2, 394, $iY, $SWP_NOZORDER)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
