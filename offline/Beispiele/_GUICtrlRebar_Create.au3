#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <GuiEdit.au3>
#include <GuiReBar.au3>
#include <GuiToolbar.au3>
#include <WinAPIConstants.au3>
#include <WindowsConstants.au3>

Global $hReBar

Example()

Func Example()
	Local $hGui, $idBtnExit, $hToolbar, $hCombo, $hDTP, $idInput
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $idHelp

	$hGui = GUICreate("Rebar", 400, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hGui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	; Erstellt eine Toolbar
	$hToolbar = _GUICtrlToolbar_Create($hGui, BitOR($TBSTYLE_FLAT, $CCS_NORESIZE, $CCS_NOPARENTALIGN))

	; Fügt der Toolbar die Standard-Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt der Toolbar einige Standard-Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; Erstellt eine Combobox
	$hCombo = _GUICtrlComboBox_Create($hGui, "", 0, 0, 120)

	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Erstellt ein DTP (Kalender-Control)
	$hDTP = _GUICtrlDTP_Create($hGui, 0, 0, 190)

	; Erstellt eine Inputbox
;~ 	$idInput = GUICtrlCreateInput("Eingabebox", 0, 0, 120, 20)
	$idInput = _GUICtrlEdit_Create($hGui, "Eingabebox", 0, 0, 120, 20)


	; Voreinstellung für _AddBand ist anhängen

	; Fügt eine neue Gruppe mit der Combobox in die Rebar ein
	_GUICtrlRebar_AddBand($hReBar, $hCombo, 120, 200, "Dir *.exe")

	; Fügt am Ende der Rebar eine neue Gruppe mit dem DTP (Kalender-Control) ein
	_GUICtrlRebar_AddBand($hReBar, $hDTP, 120)

	; Fügt eine Gruppe mit der Toolbar am Anfang der Rebar ein
	_GUICtrlRebar_AddToolBarBand($hReBar, $hToolbar, "", 0)

	; Fügt am Ende der Rebar eine Gruppe mit dem Input-Control ein
;~ 	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($idInput), 120, 200, "Name:")
	_GUICtrlRebar_AddBand($hReBar, $idInput, 120, 200, "Name:")

	$idBtnExit = GUICtrlCreateButton("Beenden", 150, 360, 100, 25)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idBtnExit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR
	Local $tAUTOBREAK, $tAUTOSIZE, $tNMREBAR, $tCHEVRON, $tCHILDSIZE, $tOBJECTNOTIFY

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hReBar
			Switch $iCode
				Case $RBN_AUTOBREAK
					; Meldet dem Parent der ReBar, dass ein Umbruch in der Leiste erscheinen soll. Der Parent entscheidet, ob der Umbruch ausgeführt wird.
					$tAUTOBREAK = DllStructCreate($tagNMREBARAUTOBREAK, $lParam)
					_DebugPrint("$RBN_AUTOBREAK" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tAUTOBREAK, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tAUTOBREAK, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tAUTOBREAK, "Code") & @CRLF & _
							"->uBand:" & @TAB & DllStructGetData($tAUTOBREAK, "uBand") & @CRLF & _
							"->wID:" & @TAB & DllStructGetData($tAUTOBREAK, "wID") & @CRLF & _
							"->lParam:" & @TAB & DllStructGetData($tAUTOBREAK, "lParam") & @CRLF & _
							"->uMsg: " & @TAB & DllStructGetData($tAUTOBREAK, "uMsg") & @CRLF & _
							"->fStyleCurrent:" & DllStructGetData($tAUTOBREAK, "fStyleCurrent") & @CRLF & _
							"->fAutoBreak:" & @TAB & DllStructGetData($tAUTOBREAK, "fAutoBreak"))
					; Rückgabewert wird nicht benutzt
				Case $RBN_AUTOSIZE
					; Wird vom Rebar-Control gesendet, wenn es mit $RBS_AUTOSIZE erstellt wurde und sich die Größe ändert
					$tAUTOSIZE = DllStructCreate($tagNMRBAUTOSIZE, $lParam)
					_DebugPrint("$RBN_AUTOSIZE" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tAUTOSIZE, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tAUTOSIZE, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tAUTOSIZE, "Code") & @CRLF & _
							"->fChanged:" & @TAB & DllStructGetData($tAUTOSIZE, "fChanged") & @CRLF & _
							"->TargetLeft:" & @TAB & DllStructGetData($tAUTOSIZE, "TargetLeft") & @CRLF & _
							"->TargetTop:" & @TAB & DllStructGetData($tAUTOSIZE, "TargetTop") & @CRLF & _
							"->TargetRight:" & @TAB & DllStructGetData($tAUTOSIZE, "TargetRight") & @CRLF & _
							"->TargetBottom:" & @TAB & DllStructGetData($tAUTOSIZE, "TargetBottom") & @CRLF & _
							"->ActualLeft:" & @TAB & DllStructGetData($tAUTOSIZE, "ActualLeft") & @CRLF & _
							"->ActualTop:" & @TAB & DllStructGetData($tAUTOSIZE, "ActualTop") & @CRLF & _
							"->ActualRight:" & @TAB & DllStructGetData($tAUTOSIZE, "ActualRight") & @CRLF & _
							"->ActualBottom:" & @TAB & DllStructGetData($tAUTOSIZE, "ActualBottom"))
					; Rückgabewert wird nicht benutzt
				Case $RBN_BEGINDRAG
					; Wird vom Rebar-Control gesendet, wenn der Benutzer die Rebar zieht
					$tNMREBAR = DllStructCreate($tagNMREBAR, $lParam)
					_DebugPrint("$RBN_BEGINDRAG" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tNMREBAR, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tNMREBAR, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tNMREBAR, "Code") & @CRLF & _
							"->dwMask:" & @TAB & DllStructGetData($tNMREBAR, "dwMask") & @CRLF & _
							"->uBand:" & @TAB & DllStructGetData($tNMREBAR, "uBand") & @CRLF & _
							"->fStyle:" & @TAB & DllStructGetData($tNMREBAR, "fStyle") & @CRLF & _
							"->wID:" & @TAB & DllStructGetData($tNMREBAR, "wID") & @CRLF & _
							"->lParam:" & @TAB & DllStructGetData($tNMREBAR, "lParam"))
					Return 0 ; Um der Rebar zu erlauben, die Zieh-Operation fortzusetzen
;~ 					Return 1 ; <> 0, um die Zieh-Operation abzubrechen
				Case $RBN_CHEVRONPUSHED
					; Wird vom Rebar-Control gesendet, wenn ein Eckwinkel gedrückt wird
					; Wenn eine Anwendung diese Nachricht empfängt, ist sie für die Anzeige eines Popup-Menüs mit Einträgen für jedes nicht angezeigte Werkzeug der Palette verantwortlich.
					; Mit Hilfe des rc-Mitglieds der NMREBARCHEVRON-Struktur kann die korrekte Position für das Popup-Menü ermittelt werden.
					$tCHEVRON = DllStructCreate($tagNMREBARCHEVRON, $lParam)
					_DebugPrint("$RBN_CHEVRONPUSHED" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tCHEVRON, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tCHEVRON, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tCHEVRON, "Code") & @CRLF & _
							"->uBand:" & @TAB & DllStructGetData($tCHEVRON, "uBand") & @CRLF & _
							"->wID:" & @TAB & DllStructGetData($tCHEVRON, "wID") & @CRLF & _
							"->lParam:" & @TAB & DllStructGetData($tCHEVRON, "lParam") & @CRLF & _
							"->Left: " & @TAB & DllStructGetData($tCHEVRON, "Left") & @CRLF & _
							"->Top:" & @TAB & DllStructGetData($tCHEVRON, "Top") & @CRLF & _
							"->Right:" & @TAB & DllStructGetData($tCHEVRON, "Right") & @CRLF & _
							"->lParamNM:" & @TAB & DllStructGetData($tCHEVRON, "lParamNM"))
					; Rückgabewert wird nicht benutzt
				Case $RBN_CHILDSIZE
					; Wird vom Rebar-Control gesendet, wenn die Größe eines Child-Fensters der Gruppe geändert wird
					$tCHILDSIZE = DllStructCreate($tagNMREBARCHILDSIZE, $lParam)
					_DebugPrint("$RBN_CHILDSIZE" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tCHILDSIZE, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tCHILDSIZE, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tCHILDSIZE, "Code") & @CRLF & _
							"->uBand:" & @TAB & DllStructGetData($tCHILDSIZE, "uBand") & @CRLF & _
							"->wID:" & @TAB & DllStructGetData($tCHILDSIZE, "wID") & @CRLF & _
							"->CLeft:" & @TAB & DllStructGetData($tCHILDSIZE, "CLeft") & @CRLF & _
							"->CTop: " & @TAB & DllStructGetData($tCHILDSIZE, "CTop") & @CRLF & _
							"->CRight:" & @TAB & DllStructGetData($tCHILDSIZE, "CRight") & @CRLF & _
							"->CBottom:" & @TAB & DllStructGetData($tCHILDSIZE, "CBottom") & @CRLF & _
							"->BLeft:" & @TAB & DllStructGetData($tCHILDSIZE, "BandLeft") & @CRLF & _
							"->BTop: " & @TAB & DllStructGetData($tCHILDSIZE, "BTop") & @CRLF & _
							"->BRight:" & @TAB & DllStructGetData($tCHILDSIZE, "BRight") & @CRLF & _
							"->BBottom:" & @TAB & DllStructGetData($tCHILDSIZE, "BBottom"))
					; Rückgabewert wird nicht benutzt
				Case $RBN_DELETEDBAND
					; Wird vom Rebar-Control gesendet, nachdem eine Gruppe gelöscht wurde
					$tNMREBAR = DllStructCreate($tagNMREBAR, $lParam)
					_DebugPrint("$RBN_DELETEDBAND" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tNMREBAR, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tNMREBAR, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tNMREBAR, "Code") & @CRLF & _
							"->dwMask:" & @TAB & DllStructGetData($tNMREBAR, "dwMask") & @CRLF & _
							"->uBand:" & @TAB & DllStructGetData($tNMREBAR, "uBand") & @CRLF & _
							"->fStyle:" & @TAB & DllStructGetData($tNMREBAR, "fStyle") & @CRLF & _
							"->wID:" & @TAB & DllStructGetData($tNMREBAR, "wID") & @CRLF & _
							"->lParam:" & @TAB & DllStructGetData($tNMREBAR, "lParam"))
					; Rückgabewert wird nicht benutzt
				Case $RBN_DELETINGBAND
					; Wird vom Rebar-Control gesendet, wenn eine Gruppe gerade gelöscht wird
					$tNMREBAR = DllStructCreate($tagNMREBAR, $lParam)
					_DebugPrint("$RBN_DELETINGBAND" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tNMREBAR, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tNMREBAR, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tNMREBAR, "Code") & @CRLF & _
							"->dwMask:" & @TAB & DllStructGetData($tNMREBAR, "dwMask") & @CRLF & _
							"->uBand:" & @TAB & DllStructGetData($tNMREBAR, "uBand") & @CRLF & _
							"->fStyle:" & @TAB & DllStructGetData($tNMREBAR, "fStyle") & @CRLF & _
							"->wID:" & @TAB & DllStructGetData($tNMREBAR, "wID") & @CRLF & _
							"->lParam:" & @TAB & DllStructGetData($tNMREBAR, "lParam"))
					; Rückgabewert wird nicht benutzt
				Case $RBN_ENDDRAG
					; Wird vom Rebar-Control gesendet, wenn der Benutzer das Ziehen einer Gruppe stoppt
					$tNMREBAR = DllStructCreate($tagNMREBAR, $lParam)
					_DebugPrint("$RBN_ENDDRAG" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tNMREBAR, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tNMREBAR, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tNMREBAR, "Code") & @CRLF & _
							"->dwMask:" & @TAB & DllStructGetData($tNMREBAR, "dwMask") & @CRLF & _
							"->uBand:" & @TAB & DllStructGetData($tNMREBAR, "uBand") & @CRLF & _
							"->fStyle:" & @TAB & DllStructGetData($tNMREBAR, "fStyle") & @CRLF & _
							"->wID:" & @TAB & DllStructGetData($tNMREBAR, "wID") & @CRLF & _
							"->lParam:" & @TAB & DllStructGetData($tNMREBAR, "lParam"))
					; Rückgabewert wird nicht benutzt
				Case $RBN_GETOBJECT
					; Wird vom Rebar-Control gesendet, das mit dem Stil $RBS_REGISTERDROP erstellt wurde, wenn ein Objekt über eine Gruppe gezogen wird
					$tOBJECTNOTIFY = DllStructCreate($tagNMOBJECTNOTIFY, $lParam)
					_DebugPrint("$RBN_GETOBJECT" & @CRLF & "->hWndFrom:" & @TAB & DllStructGetData($tOBJECTNOTIFY, "hWndFrom") & @CRLF & _
							"->IDFrom:" & @TAB & DllStructGetData($tOBJECTNOTIFY, "IDFrom") & @CRLF & _
							"->Code: " & @TAB & DllStructGetData($tOBJECTNOTIFY, "Code") & @CRLF & _
							"->Item: " & @TAB & DllStructGetData($tOBJECTNOTIFY, "Item") & @CRLF & _
							"->piid: " & @TAB & DllStructGetData($tOBJECTNOTIFY, "piid") & @CRLF & _
							"->pObject:" & @TAB & DllStructGetData($tOBJECTNOTIFY, "pObject") & @CRLF & _
							"->Result:" & @TAB & DllStructGetData($tOBJECTNOTIFY, "Result"))
					; Rückgabewert wird nicht benutzt
				Case $RBN_HEIGHTCHANGE
					; Wird vom Rebar-Control gesendet, wenn seine Höhe geändert wurde
					; Rebar-Controls mit dem Stil $CCS_VERT senden diese Nachricht, wenn die Breite geändert wurde
					_DebugPrint("$RBN_HEIGHTCHANGE" & @CRLF & "->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"->Code: " & @TAB & $iCode)
					; Rückgabewert wird nicht benutzt
				Case $RBN_LAYOUTCHANGED
					; Wird vom Rebar-Control gesendet, wenn der Benutzer das Layout der Gruppen ändert
					_DebugPrint("$RBN_LAYOUTCHANGED" & @CRLF & "->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"->Code: " & @TAB & $iCode)
					; Rückgabewert wird nicht benutzt
				Case $RBN_MINMAX
					; Wird vom Rebar-Control gesendet, bevor eine Gruppe maximiert oder minimiert wird
					_DebugPrint("$RBN_MINMAX" & @CRLF & "->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"->Code: " & @TAB & $iCode)
;~ 					Return 1 ; <> 0, um die Änderung zu verhindern
					Return 0 ; Erlaubt die Änderung
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $sLine = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"->Zeile " & StringFormat("%03d", $sLine) & ":" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
