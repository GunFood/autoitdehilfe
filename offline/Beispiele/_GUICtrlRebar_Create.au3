#include "Extras\WM_NOTIFY.au3"

#include <AutoItConstants.au3>
#include <GuiComboBox.au3>
#include <GUIConstantsEx.au3>
#include <GuiDateTimePicker.au3>
#include <GuiEdit.au3>
#include <GuiReBar.au3>
#include <GuiToolbar.au3>
#include <StructureConstants.au3>
#include <WinAPIConstants.au3>
#include <WindowsStylesConstants.au3>

Global $hReBar

Example()

Func Example()
	Local $hGui = GUICreate("Rebar: Erstellen (v" & @AutoItVersion & ")", 400, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	_WM_NOTIFY_Register()

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hGui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	; Erstellt eine Toolbar
	Local $hToolbar = _GUICtrlToolbar_Create($hGui, BitOR($TBSTYLE_FLAT, $CCS_NORESIZE, $CCS_NOPARENTALIGN))

	; Fügt der Toolbar die Standard-Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; Fügt der Toolbar einige Standard-Buttons hinzu
	Local Enum $e_idNew = 1000, $e_idOpen, $e_idSave, $e_idHelp
	_GUICtrlToolbar_AddButton($hToolbar, $e_idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $e_idHelp, $STD_HELP)

	; Erstellt eine Combobox
	Local $hCombo = _GUICtrlComboBox_Create($hGui, "", 0, 0, 120)

	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Erstellt ein DTP (Kalender-Control)
	Local $hDTP = _GUICtrlDTP_Create($hGui, 0, 0, 190)

	; Erstellt eine Inputbox
;~ 	$idInput = GUICtrlCreateInput("Eingabebox", 0, 0, 120, 20)
	Local $hInput = _GUICtrlEdit_Create($hGui, "Eingabebox", 0, 0, 120, 20)

	; Voreinstellung für _AddBand ist anhängen

	; Fügt eine neue Gruppe mit der Combobox in die Rebar ein
	_GUICtrlRebar_AddBand($hReBar, $hCombo, 120, 200, "Dir *.exe")

	; Fügt am Ende der Rebar eine neue Gruppe mit dem DTP (Kalender-Control) ein
	_GUICtrlRebar_AddBand($hReBar, $hDTP, 120)

	; Fügt eine Gruppe mit der Toolbar am Anfang der Rebar ein
	_GUICtrlRebar_AddToolBarBand($hReBar, $hToolbar, "", 0)

	; Fügt am Ende der Rebar eine Gruppe mit dem Input-Control ein
;~ 	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($idInput), 120, 200, "Name:")
	_GUICtrlRebar_AddBand($hReBar, $hInput, 120, 200, "Name:")

	Local $idBtn_Exit = GUICtrlCreateButton("Beenden", 150, 360, 100, 25)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idBtn_Exit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hReBar
			Switch $iCode
				Case $RBN_AUTOBREAK
					; Meldet dem Parent der ReBar, dass ein Umbruch in der Leiste erscheinen soll. Der Parent entscheidet, ob der Umbruch ausgeführt wird.
					_WM_NOTIFY_DebugEvent("$RBN_AUTOBREAK", $tagNMREBARAUTOBREAK, $lParam, "IDFrom,,uBand,wID,lParam,uMsg,fStyleCurrent,fAutoBreak")
					; Rückgabewert wird nicht benutzt
				Case $RBN_AUTOSIZE
					; Wird vom Rebar-Control gesendet, wenn es mit $RBS_AUTOSIZE erstellt wurde und sich die Größe ändert
					_WM_NOTIFY_DebugEvent("$RBN_AUTOSIZE", $tagNMRBAUTOSIZE, $lParam, "IDFrom,,fChanged,TargetLeft,TargetTop,TargetRight,TargetBottom,,ActualLeft,ActualTop,ActualRight,ActualBottom")
					; Rückgabewert wird nicht benutzt
				Case $RBN_BEGINDRAG
					; Wird vom Rebar-Control gesendet, wenn der Benutzer die Rebar zieht
					_WM_NOTIFY_DebugEvent("$RBN_BEGINDRAG", $tagNMREBAR, $lParam, "IDFrom,,dwMask,uBand,fStyle,wID,lParam")
					Return 0 ; Um der Rebar zu erlauben, die Zieh-Operation fortzusetzen
;~ 					Return 1 ; <> 0, um die Zieh-Operation abzubrechen
				Case $RBN_CHEVRONPUSHED
					; Wird vom Rebar-Control gesendet, wenn ein Eckwinkel gedrückt wird
					; Wenn eine Anwendung diese Nachricht empfängt, ist sie für die Anzeige eines Popup-Menüs mit Einträgen für jedes nicht angezeigte Werkzeug der Palette verantwortlich.
					; Mit Hilfe des rc-Mitglieds der NMREBARCHEVRON-Struktur kann die korrekte Position für das Popup-Menü ermittelt werden.
					_WM_NOTIFY_DebugEvent("$RBN_CHEVRONPUSHED", $tagNMREBARCHEVRON, $lParam, "IDFrom,,uBand,wID,lParam,Left,Top,Right,lParamNM")
					; Rückgabewert wird nicht benutzt
				Case $RBN_CHILDSIZE
					; Wird vom Rebar-Control gesendet, wenn die Größe eines Child-Fensters der Gruppe geändert wird
					_WM_NOTIFY_DebugEvent("$RBN_CHILDSIZE", $tagNMREBARCHILDSIZE, $lParam, "IDFrom,,uBand,wID,CLeft,CTop,CRight,CBottom,BandLeft,,BTop,BRight,BBottom")
					; Rückgabewert wird nicht benutzt
				Case $RBN_DELETEDBAND
					; Wird vom Rebar-Control gesendet, nachdem eine Gruppe gelöscht wurde
					_WM_NOTIFY_DebugEvent("$RBN_DELETEDBAND", $tagNMREBAR, $lParam, "IDFrom,,dwMask,uBand,fStyle,wID,lParam")
					; Rückgabewert wird nicht benutzt
				Case $RBN_DELETINGBAND
					; Wird vom Rebar-Control gesendet, wenn eine Gruppe gerade gelöscht wird
					_WM_NOTIFY_DebugEvent("$RBN_DELETINGBAND", $tagNMREBAR, $lParam, "IDFrom,,dwMask,uBand,fStyle,wID,lParam")
					; Rückgabewert wird nicht benutzt
				Case $RBN_ENDDRAG
					; Wird vom Rebar-Control gesendet, wenn der Benutzer das Ziehen einer Gruppe stoppt
					_WM_NOTIFY_DebugEvent("$RBN_ENDDRAG", $tagNMREBAR, $lParam, "IDFrom,,dwMask,uBand,fStyle,wID,lParam")
					; Rückgabewert wird nicht benutzt
				Case $RBN_GETOBJECT
					; Wird vom Rebar-Control gesendet, das mit dem Stil $RBS_REGISTERDROP erstellt wurde, wenn ein Objekt über eine Gruppe gezogen wird
					_WM_NOTIFY_DebugEvent("$RBN_GETOBJECT", $tagNMOBJECTNOTIFY, $lParam, "IDFrom,,Item,piid,pObject,Result")
					; Rückgabewert wird nicht benutzt
				Case $RBN_HEIGHTCHANGE
					; Wird vom Rebar-Control gesendet, wenn seine Höhe geändert wurde
					; Rebar-Controls mit dem Stil $CCS_VERT senden diese Nachricht, wenn die Breite geändert wurde
					_WM_NOTIFY_DebugEvent("$RBN_HEIGHTCHANGE", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Rückgabewert wird nicht benutzt
				Case $RBN_LAYOUTCHANGED
					; Wird vom Rebar-Control gesendet, wenn der Benutzer das Layout der Gruppen ändert
					_WM_NOTIFY_DebugEvent("$RBN_LAYOUTCHANGED", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Rückgabewert wird nicht benutzt
				Case $RBN_MINMAX
					; Wird vom Rebar-Control gesendet, bevor eine Gruppe maximiert oder minimiert wird
					_WM_NOTIFY_DebugEvent("$RBN_MINMAX", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Return 1 ; <> 0, um die Änderung zu verhindern
					Return 0 ; Erlaubt die Änderung
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
