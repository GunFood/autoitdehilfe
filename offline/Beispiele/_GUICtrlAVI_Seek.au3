; verwendet die AutoIt-Funktion

#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>

_Example_Internal()

Func _Example_Internal()
	; Erstellt eine GUI
	GUICreate("AVI: Spulen (Intern)", 300, 100)
	Local $idAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
		Sleep(100)
		; Spult zu einem Zufallsframe des AVI Clips
		_GUICtrlAVI_Seek($idAVI, Random(1, 30, 1))
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($idAVI)

	GUIDelete()
EndFunc   ;==>_Example_Internal
