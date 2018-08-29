#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $aXY, $idListView

	GUICreate("ListView: Berechnet die ungefähre Größe", 400, 300)
	$idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalte hinzufügen
	_GUICtrlListView_InsertColumn($idListView, 0, "Spalte 1", 60)

	; Fügt die Items hinzu
	For $iI = 0 To 9
		_GUICtrlListView_AddItem($idListView, "Zeile " & $iI)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Berechne nun die ungefähre Größe, welche für die Darstellung einer gegebenen Anzahl von Items notwendig ist")
	; Neuaufbau des Listviews
	$aXY = _GUICtrlListView_ApproximateViewRect($idListView)
	_WinAPI_SetWindowPos(GUICtrlGetHandle($idListView), 0, 2, 2, $aXY[0] + 5, $aXY[1], $SWP_NOZORDER); Die +5 ist eine Sicherheitszugabe
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
