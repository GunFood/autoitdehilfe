#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt die Sprach-ID", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Zeigt die Gebietsschema-Einstellung, den Ländercode und die Sprach-Identifizierer an
	MsgBox($MB_SYSTEMMODAL, "Information", _
			"Gebietsschema ...: " & _GUICtrlListBox_GetLocale($idListBox) & @CRLF & _
			"Ländercode ......: " & _GUICtrlListBox_GetLocaleCountry($idListBox) & @CRLF & _
			"Sprach-ID........: " & _GUICtrlListBox_GetLocaleLang($idListBox) & @CRLF & _
			"Primäre Sprach-ID: " & _GUICtrlListBox_GetLocalePrimLang($idListBox) & @CRLF & _
			"Sub-Sprach-ID ...: " & _GUICtrlListBox_GetLocaleSubLang($idListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
