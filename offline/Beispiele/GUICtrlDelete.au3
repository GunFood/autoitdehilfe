#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("GUI Control löschen", 200, 200, 800, 200)
	Local $idDate = GUICtrlCreateDate("1953/04/25", 10, 10, 185, 20)
	Local $idDel = GUICtrlCreateButton("Control löschen", 50, 50, -1, 20)
	GUISetState(@SW_SHOW)

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion auslöst
	Do
		$idMsg = GUIGetMsg()
		If $idMsg = $idDel Then
			GUICtrlDelete($idDate)
			GUICtrlDelete($idDel)
		EndIf
	Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
