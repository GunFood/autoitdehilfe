#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <WinAPIConv.au3>
#include <WindowsConstants.au3>

Global $g_idMemo, $g_hStyle, $g_iStyle, $g_idTimeLabel
Global Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idExit, $e_idMNS_CHECKORBMP, $e_idMNS_AUTODISMISS, $e_idMNS_MODELESS, $e_idMNS_NOCHECK, $e_idAbout

Global $g_hGUI, $g_hFile, $g_hHelp, $g_hMain

Example()

Func Example()
	$g_iStyle = $MNS_CHECKORBMP ; Standardmodus

	$g_hGUI = GUICreate("Menu", 500, 300)

	CreateMenus()

	GUICtrlCreateLabel("Nach der Einstellung des Stils auf MNS_MODELESS" & @CRLF & _
			"wird die Uhrzeit kontinuierlich angezeigt, wenn man auf Menü klickt", 20, 2, 390, 60)
	$g_idTimeLabel = GUICtrlCreateLabel("", 400, 2, 160, 40)

	; Erstellt ein Memo Control
	$g_idMemo = GUICtrlCreateEdit("", 2, 30 + 2, 496, 276 - 30)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")

	SetStyles()     ; zum Einstellen von Elementen im Stil des Kontrollmenüs

	GUISetState(@SW_SHOW)

	MemoWrite("beginnend mit Stilen: " & @CRLF & @TAB & ConvStyles())

	; Registriert die Windows Message ID
	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	AdlibRegister("DisplayTime", 1000)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
		Sleep(10)
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example

Func CreateMenus()
	GUISetState(@SW_LOCK)

	; vorherige Menüs entfernen
	_GUICtrlMenu_DestroyMenu($g_hFile)
	_GUICtrlMenu_DestroyMenu($g_hStyle)
	_GUICtrlMenu_DestroyMenu($g_hHelp)
	_GUICtrlMenu_DestroyMenu($g_hMain)

	; Erstellt den Menüpunkt "Datei"
	$g_hFile = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($g_hFile, 0, "&Neu", $e_idNew)
	_GUICtrlMenu_InsertMenuItem($g_hFile, 1, "&Öffnen", $e_idOpen)
	_GUICtrlMenu_InsertMenuItem($g_hFile, 2, "&Speichern", $e_idSave)
	_GUICtrlMenu_InsertMenuItem($g_hFile, 3, "", 0)
	_GUICtrlMenu_InsertMenuItem($g_hFile, 4, "V&erlassen", $e_idExit)

	; Erstellt den Menüpunkt "Bearbeiten"
	$g_hStyle = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($g_hStyle, 0, "MNS_CHECKORBMP", $e_idMNS_CHECKORBMP)
	_GUICtrlMenu_InsertMenuItem($g_hStyle, 1, "MNS_AUTODISMISS", $e_idMNS_AUTODISMISS)
	_GUICtrlMenu_InsertMenuItem($g_hStyle, 2, "MNS_MODELESS", $e_idMNS_MODELESS)
	_GUICtrlMenu_InsertMenuItem($g_hStyle, 3, "MNS_NOCHECK", $e_idMNS_NOCHECK)

	; Erstellt den Menüpunkt "Hilfe"
	$g_hHelp = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($g_hHelp, 0, "&Über", $e_idAbout)

	; Erstellt das Hauptmenü
	$g_hMain = _GUICtrlMenu_CreateMenu($g_iStyle)     ; ..für MNS_MODELESS wird nur dieses "Hauptmenü" benötigt.
	_GUICtrlMenu_InsertMenuItem($g_hMain, 0, "&Datei", 0, $g_hFile)
	_GUICtrlMenu_InsertMenuItem($g_hMain, 1, "&Bearbeiten", 0, $g_hStyle)
	_GUICtrlMenu_InsertMenuItem($g_hMain, 2, "&Hilfe", 0, $g_hHelp)

	; Erstellt das Menü Fenster
	_GUICtrlMenu_SetMenu($g_hGUI, $g_hMain)

	GUISetState(@SW_UNLOCK)
EndFunc   ;==>CreateMenus

; Behandlung beim auswählen eines Menü-Eintrags
Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam
	Switch _WinAPI_LoWord($wParam)
		Case $e_idNew
			MemoWrite("Neu")
		Case $e_idOpen
			MemoWrite("Öffnen")
		Case $e_idSave
			MemoWrite("Speichern")
		Case $e_idExit
			GUIDelete()
			Exit
		Case $e_idMNS_CHECKORBMP
			UpdateStyles($MNS_CHECKORBMP)
		Case $e_idMNS_AUTODISMISS
			UpdateStyles($MNS_AUTODISMISS)
		Case $e_idMNS_MODELESS
			UpdateStyles($MNS_MODELESS)
		Case $e_idMNS_NOCHECK
			UpdateStyles($MNS_NOCHECK)
		Case $e_idAbout
			MemoWrite("Über")
	EndSwitch

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func UpdateStyles($nStyle)
	If BitAND($g_iStyle, $nStyle) Then
		; den Stil zurücksetzen
		$g_iStyle = BitAND($g_iStyle, BitNOT($nStyle))
	Else
		; den Stil festlegen
		$g_iStyle = BitOR($g_iStyle, $nStyle)
	EndIf

	; das Menü mit neuen Stilen neu erstellen, da die Modifikationen von $MNS_MODELESS nicht dynamisch sein können
	CreateMenus()
	MemoWrite("Neustart mit Stils: " & @CRLF & @TAB & ConvStyles())
	SetStyles()
EndFunc   ;==>UpdateStyles

Func ConvStyles()
	Local $sStyle = ""
	If BitAND($g_iStyle, $MNS_CHECKORBMP) Then $sStyle &= " MNS_CHECKORBMP"
	If BitAND($g_iStyle, $MNS_AUTODISMISS) Then $sStyle &= " MNS_AUTODISMISS"
	If BitAND($g_iStyle, $MNS_MODELESS) Then $sStyle &= " MNS_MODELESS"
	If BitAND($g_iStyle, $MNS_NOCHECK) Then $sStyle &= " MNS_NOCHECK"

	If $g_iStyle = 0 Then
		$g_iStyle = $MNS_CHECKORBMP ; Standardmodus
		$sStyle = " MNS_CHECKORBMP"
	EndIf

	Return $sStyle
EndFunc   ;==>ConvStyles

Func SetStyles()
	If BitAND($g_iStyle, $MNS_CHECKORBMP) Then _GUICtrlMenu_SetItemState($g_hStyle, $e_idMNS_CHECKORBMP, $MFS_CHECKED, True, False)
	If BitAND($g_iStyle, $MNS_AUTODISMISS) Then _GUICtrlMenu_SetItemState($g_hStyle, $e_idMNS_AUTODISMISS, $MFS_CHECKED, True, False)
	If BitAND($g_iStyle, $MNS_MODELESS) Then _GUICtrlMenu_SetItemState($g_hStyle, $e_idMNS_MODELESS, $MFS_CHECKED, True, False)
	If BitAND($g_iStyle, $MNS_NOCHECK) Then _GUICtrlMenu_SetItemState($g_hStyle, $e_idMNS_NOCHECK, $MFS_CHECKED, True, False)

	If $g_iStyle = 0 Then
		$g_iStyle = $MNS_CHECKORBMP ; Standardmodus
		_GUICtrlMenu_SetItemState($g_hStyle, $e_idMNS_CHECKORBMP, $MFS_CHECKED, True, False)
	EndIf
EndFunc   ;==>SetStyles

; Anzeige der neuen Zeit im Label.
Func DisplayTime()
	GUICtrlSetData($g_idTimeLabel, "Zeit =   " & @HOUR & ":" & @MIN & ":" & @SEC)
EndFunc   ;==>DisplayTime

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
