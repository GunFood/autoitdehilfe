; verwendet die UDF

#include <GuiAVI.au3>
#include <GUIConstantsEx.au3>

_Beispiel_External()

Func _Beispiel_External()
	Local $hGui, $hAVI

	; Erstellt eine GUI
	$hGui = GUICreate("AVI: Spulen (Extern)", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGui, @SystemDir & "\Shell32.dll", 160, 10, 10)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
		Sleep(100)
		; Spult zu einem Zufallsframe des AVI Clips
		_GUICtrlAVI_Seek($hAVI, Random(1, 30, 1))
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schließt den AVI Clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>_Beispiel_External
