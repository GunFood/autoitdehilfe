#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <TreeViewConstants.au3>
#include <StaticConstants.au3>

Opt('MustDeclareVars', 1)

Example()

Func Example()
	Local $treeview, $generalitem, $displayitem, $aboutitem, $compitem
	Local $useritem, $resitem, $otheritem, $startlabel, $aboutlabel, $compinfo
	Local $togglebutton, $infobutton, $statebutton, $cancelbutton
	Local $msg, $item, $hItem, $text

	GUICreate("Meine GUI mit Baumansicht", 350, 215)

	$treeview = GUICtrlCreateTreeView(6, 6, 150, 140, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS), $WS_EX_CLIENTEDGE)
	$generalitem = GUICtrlCreateTreeViewItem("Allgemein", $treeview)
	GUICtrlSetColor(-1, 0x0000C0)
	$displayitem = GUICtrlCreateTreeViewItem("Anzeige", $treeview)
	GUICtrlSetColor(-1, 0x0000C0)
	$aboutitem = GUICtrlCreateTreeViewItem("&Uuml;ber", $generalitem)
	$compitem = GUICtrlCreateTreeViewItem("Computer", $generalitem)
	$useritem = GUICtrlCreateTreeViewItem("Benutzer", $generalitem)
	$resitem = GUICtrlCreateTreeViewItem("Aufl&ouml;sung", $displayitem)
	$otheritem = GUICtrlCreateTreeViewItem("Sonstiges", $displayitem)

	$startlabel = GUICtrlCreateLabel("Baumansicht Demo", 160, 90, 100, 20)
	$aboutlabel = GUICtrlCreateLabel("Dieses kleine Script demonstriert die Benutzung eines Baumansicht Steuerelements.", 160, 70, 150, 60)
	GUICtrlSetState(-1, $GUI_HIDE) ; Versteckt den "aboutlabel"-Text w&auml;hrend der Initialisierung
	$compinfo = GUICtrlCreateLabel("Name:" & @TAB & @ComputerName & @LF & "OS:" & @TAB & @OSVersion & @LF & "SP:" & @TAB & @OSServicePack, 160, 30, 200, 80)
	GUICtrlSetState(-1, $GUI_HIDE) ; Versteckt den "compinfo"-Text w&auml;hrend der Initialisierung

	GUICtrlCreateLabel("", 0, 170, 350, 2, $SS_SUNKEN)
	$togglebutton = GUICtrlCreateButton("&Umschalten", 35, 185, 70, 20)
	$infobutton = GUICtrlCreateButton("&Info", 105, 185, 70, 20)
	$statebutton = GUICtrlCreateButton("Auf/Zu", 175, 185, 70, 20)
	$cancelbutton = GUICtrlCreateButton("&Abbrechen", 245, 185, 70, 20)

	GUICtrlSetState($generalitem, BitOR($GUI_EXPAND, $GUI_DEFBUTTON)) ; Expandiert den "Allgemein"-Zweig und zeichnet ihn fett
	GUICtrlSetState($displayitem, BitOR($GUI_EXPAND, $GUI_DEFBUTTON)) ; Expandiert den "Anzeige"-Zweig und zeichnet ihn fett

	GUISetState()
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $cancelbutton Or $msg = $GUI_EVENT_CLOSE
				ExitLoop

			Case $msg = $togglebutton ; Schriftstil 'Fett' ein/ausschalten
				If BitAND(GUICtrlRead($generalitem), $GUI_DEFBUTTON) Then
					GUICtrlSetState($generalitem, 0)
					GUICtrlSetState($displayitem, 0)
				Else
					GUICtrlSetState($generalitem, $GUI_DEFBUTTON)
					GUICtrlSetState($displayitem, $GUI_DEFBUTTON)
				EndIf

			Case $msg = $infobutton
				$item = GUICtrlRead($treeview) ; Hole die Control-ID des aktuell gew&auml;hlten Baumansicht-Elements
				If $item = 0 Then
					MsgBox(64, "Baumansicht Demo", "Momentan ist kein Eintrag markiert")
				Else
					$text = GUICtrlRead($item, 1) ; Hole den Text des Baumansicht-Elements
					If $text == "" Then
						MsgBox(16, "Fehler", "Fehler w&auml;hrend der Abfrage des Baumansicht-Elements")
					Else
						MsgBox(64, "Baumansicht Demo", "Aktuell gew&auml;hltes Element ist: " & $text) ; $advmsg[0] enth&auml;lt den Text und $advmsg[1] den Statuswert des Baumansicht-Elements
					EndIf
				EndIf

			Case $msg = $statebutton ; Expandiert oder versteckt den markierten Zweig
				$item = GUICtrlRead($treeview)
				If $item > 0 Then
					$hItem = GUICtrlGetHandle($item)
					GUICtrlSendMsg($treeview, $TVM_EXPAND, $TVE_TOGGLE, $hItem)
				EndIf

				; Die folgenden Elemente verstecken die anderen Labels (erster und zweiter Parameter) und zeigen anschlie&szlig;end die 'eigenen' Labels (dritter und vierter Parameter)
			Case $msg = $generalitem
				GUIChangeItems($aboutlabel, $compinfo, $startlabel, $startlabel)

			Case $msg = $aboutitem
				GUICtrlSetState($compinfo, $GUI_HIDE)
				GUIChangeItems($startlabel, $startlabel, $aboutlabel, $aboutlabel)

			Case $msg = $compitem
				GUIChangeItems($startlabel, $aboutlabel, $compinfo, $compinfo)
		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example

Func GUIChangeItems($hidestart, $hideend, $showstart, $showend)
	Local $idx

	For $idx = $hidestart To $hideend
		GUICtrlSetState($idx, $GUI_HIDE)
	Next
	For $idx = $showstart To $showend
		GUICtrlSetState($idx, $GUI_SHOW)
	Next
EndFunc   ;==>GUIChangeItems
