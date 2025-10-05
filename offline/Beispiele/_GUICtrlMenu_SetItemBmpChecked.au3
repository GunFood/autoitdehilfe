#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <WinAPIGdi.au3>

Example()

Func Example()
	Local $hGui, $hFile, $idEdit, $hHelp, $hMain, $hBmp1, $hBmp2
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idExit, $e_idCut, $e_idCopy, $e_idPaste, $e_idAbout

	; Erstellt eine GUI
	$hGui = GUICreate("Menu", 400, 300)

	; Erstellt den Menüpunkt Datei
	$hFile = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hFile, 0, "&Neu", $e_idNew)
	_GUICtrlMenu_InsertMenuItem($hFile, 1, "&Öffnen", $e_idOpen)
	_GUICtrlMenu_InsertMenuItem($hFile, 2, "&Speichern", $e_idSave)
	_GUICtrlMenu_InsertMenuItem($hFile, 3, "", 0)
	_GUICtrlMenu_InsertMenuItem($hFile, 4, "B&eenden", $e_idExit)

	; Erstellt den Menüpunkt "Bearbeiten"
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

	; Erstellt ein Memo Control
	_MemoCreate(2, 2, 396, 276, 0)
	GUISetState(@SW_SHOW)

	; Setzt das Bitmap je nachdem, ob das Item ausgewählt ist
	$hBmp1 = _WinAPI_CreateSolidBitmap($hGui, 0xFF0000, 11, 11)
	$hBmp2 = _WinAPI_CreateSolidBitmap($hGui, 0x00FF00, 11, 11)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 0, $hBmp1)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 1, $hBmp1)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 2, $hBmp1)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 0, $hBmp2)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 1, $hBmp2)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 2, $hBmp2)

	; Wählt den Menüpunkt 'Öffnen' aus
	_GUICtrlMenu_CheckMenuItem($hFile, 1)

	; Zeigt das die Handles der Bitmaps passen
	_MemoWrite("Handle vom angehakten Item................: 0x" & Hex($hBmp1))
	_MemoWrite("Handle vom abgehakten Item ...............: 0x" & Hex($hBmp2))
	_MemoWrite("Handle vom angehakten Itempunkt 'Öffnen' .: 0x" & Hex(_GUICtrlMenu_GetItemBmpChecked($hFile, 0)))
	_MemoWrite("Handle vom abgehakten Itempunkt 'Öffnen' .: 0x" & Hex(_GUICtrlMenu_GetItemBmpUnchecked($hFile, 0)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
