#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>

Example()

Func Example()
	Local $hGui, $hFile, $idEdit, $hHelp, $hMain
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idExit, $e_idCut, $e_idCopy, $e_idPaste, $e_idAbout

	; Erstellt eine GUI
	$hGui = GUICreate("Menu", 400, 300)

	; Erstellt den Menüpunkt "Datei"
	$hFile = _GUICtrlMenu_CreateMenu()
	InsertItem($hFile, 0, "&Neu", $e_idNew)
	InsertItem($hFile, 1, "&öffnen", $e_idOpen)
	InsertItem($hFile, 2, "&Speichern", $e_idSave)
	InsertItem($hFile, 3, "", 0)
	InsertItem($hFile, 4, "B&earbeiten", $e_idExit)

	; Erstellt den Menüpunkt "Bearbeiten"
	$idEdit = _GUICtrlMenu_CreateMenu()
	InsertItem($idEdit, 0, "&Ausschneiden", $e_idCut)
	InsertItem($idEdit, 1, "K&opieren", $e_idCopy)
	InsertItem($idEdit, 2, "&Einfügen", $e_idPaste)

	; Erstellt den Menüpunkt "Hilfe"
	$hHelp = _GUICtrlMenu_CreateMenu()
	InsertItem($hHelp, 0, "&Über", $e_idAbout)

	; Erstellt das Hauptmenü
	$hMain = _GUICtrlMenu_CreateMenu()
	InsertItem($hMain, 0, "&Datei", 0, $hFile)
	InsertItem($hMain, 1, "&Bearbeiten", 0, $idEdit)
	InsertItem($hMain, 2, "&Hilfe", 0, $hHelp)

	; Setzt das neue Menü
	_GUICtrlMenu_SetMenu($hGui, $hMain)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Fügt ein Menü Item ein (der schwere Weg)
Func InsertItem($hMenu, $iIndex, $sText, $iCmdID = 0, $hSubMenu = 0)
	Local $tMenu, $tText

	$tMenu = DllStructCreate($tagMENUITEMINFO)
	DllStructSetData($tMenu, "Size", DllStructGetSize($tMenu))
	DllStructSetData($tMenu, "Mask", BitOR($MIIM_ID, $MIIM_STRING, $MIIM_SUBMENU))
	DllStructSetData($tMenu, "ID", $iCmdID)
	DllStructSetData($tMenu, "SubMenu", $hSubMenu)
	If $sText = "" Then
		DllStructSetData($tMenu, "Mask", $MIIM_FTYPE)
		DllStructSetData($tMenu, "Type", $MFT_SEPARATOR)
	Else
		DllStructSetData($tMenu, "Mask", BitOR($MIIM_ID, $MIIM_STRING, $MIIM_SUBMENU))
		$tText = DllStructCreate("wchar Text[" & StringLen($sText) + 1 & "]")
		DllStructSetData($tText, "Text", $sText)
		DllStructSetData($tMenu, "TypeData", DllStructGetPtr($tText))
	EndIf
	_GUICtrlMenu_InsertMenuItemEx($hMenu, $iIndex, $tMenu)
EndFunc   ;==>InsertItem
