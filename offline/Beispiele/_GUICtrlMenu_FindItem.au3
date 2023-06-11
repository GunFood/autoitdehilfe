#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hFile, $idEdit, $hHelp, $hMain, $iIndex
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idExit, $e_idCut, $e_idCopy, $e_idPaste, $e_idAbout

	; Erstellt eine GUI
	$hGui = GUICreate("Menu", 400, 300)
	GUISetState(@SW_SHOW)

	; Erstellt den Menüpunkt Datei
	$hFile = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hFile, 0, "&Neu", $e_idNew)
	_GUICtrlMenu_InsertMenuItem($hFile, 1, "&Öffnen", $e_idOpen)
	_GUICtrlMenu_InsertMenuItem($hFile, 2, "&Speichern", $e_idSave)
	_GUICtrlMenu_InsertMenuItem($hFile, 3, "", 0)
	_GUICtrlMenu_InsertMenuItem($hFile, 4, "B&eenden", $e_idExit)

	; Erstellt den Menüpunkt Bearbeiten
	$idEdit = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($idEdit, 0, "&Ausschneiden", $e_idCut)
	_GUICtrlMenu_InsertMenuItem($idEdit, 1, "K&opieren", $e_idCopy)
	_GUICtrlMenu_InsertMenuItem($idEdit, 2, "&Einfügen", $e_idPaste)

	; Erstellt den Menüpunkt Hilfe
	$hHelp = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hHelp, 0, "&Über", $e_idAbout)

	; Erstellt das Hauptmenü
	$hMain = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hMain, 0, "&Datei", 0, $hFile)
	_GUICtrlMenu_InsertMenuItem($hMain, 1, "&Bearbeiten", 0, $idEdit)
	_GUICtrlMenu_InsertMenuItem($hMain, 2, "&Hilfe", 0, $hHelp)

	; Setzt das neue Menü
	_GUICtrlMenu_SetMenu($hGui, $hMain)

	; Ermittelt ein Menu-Item anhand seines Textes
	$iIndex = _GUICtrlMenu_FindItem($hMain, "Hilfe")
	MsgBox($MB_SYSTEMMODAL, "Information", "Index des Menüpunktes 'Hilfe': " & $iIndex)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
