#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>

Example()

Func Example()
	Local $hGui, $hFile, $idEdit, $hHelp, $hMain
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idExit, $e_idCut, $e_idCopy, $e_idPaste, $e_idAbout

	; Erstellt eine GUI
	$hGui = GUICreate("Menu", 400, 300)

	; Erstellt den Menüpunkt Datei
	$hFile = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($hFile, "&Neu", $e_idNew)
	_GUICtrlMenu_AddMenuItem($hFile, "&Öffnen", $e_idOpen)
	_GUICtrlMenu_AddMenuItem($hFile, "&Speichern", $e_idSave)
	_GUICtrlMenu_AddMenuItem($hFile, "", 0)
	_GUICtrlMenu_AddMenuItem($hFile, "&Beenden", $e_idExit)

	; Erstellt den Menüpunkt "Bearbeiten"
	$idEdit = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($idEdit, "&ausschneiden", $e_idCut)
	_GUICtrlMenu_AddMenuItem($idEdit, "K&opieren", $e_idCopy)
	_GUICtrlMenu_AddMenuItem($idEdit, "&Einfügen", $e_idPaste)

	; Erstellt den Menüpunkt Hilfe
	$hHelp = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($hHelp, "&Über", $e_idAbout)

	; Erstellt das Hauptmenü
	$hMain = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($hMain, "&Datei", 0, $hFile)
	_GUICtrlMenu_AddMenuItem($hMain, "&Bearbeiten", 0, $idEdit)
	_GUICtrlMenu_AddMenuItem($hMain, "&Hilfe", 0, $hHelp)

	; Setzt das neue Menü
	_GUICtrlMenu_SetMenu($hGui, $hMain)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
