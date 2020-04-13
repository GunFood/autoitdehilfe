#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIConv.au3>
#include <WinAPILangConstants.au3>

#Auto#AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

Example()

Func Example()
	Local $iLocale, $idListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Set Locale", 400, 296)
	$idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	$iLocale = _WinAPI_MAKELCID(_WinAPI_MAKELANGID($LANG_ENGLISH, $SUBLANG_ENGLISH_US), $SORT_DEFAULT)

	MsgBox(8256, "Information", "Bisherige Spracheinstellung: " & _GUICtrlListBox_SetLocale($idListBox, $iLocale))

	$iLocale = _WinAPI_MAKELCID(_WinAPI_MAKELANGID($LANG_GERMAN, $SUBLANG_GERMAN), $SORT_DEFAULT)

	MsgBox(8256, "Information", "Aktuelle Spracheinstellung: " & _GUICtrlListBox_SetLocale($idListBox, $iLocale))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
