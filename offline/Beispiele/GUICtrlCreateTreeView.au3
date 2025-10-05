#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>
#include <TreeViewConstants.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit Treeview", 350, 215)

	Local $idTreeview = GUICtrlCreateTreeView(6, 6, 150, 150, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS), $WS_EX_CLIENTEDGE)
	Local $idTVi_General = GUICtrlCreateTreeViewItem("Allgemein", $idTreeview)
	GUICtrlSetColor(-1, 0x0000C0)
	Local $idTVi_Display = GUICtrlCreateTreeViewItem("Anzeige", $idTreeview)
	GUICtrlSetColor(-1, 0x0000C0)
	Local $idTVi_About = GUICtrlCreateTreeViewItem("Über", $idTVi_General)
	Local $idTVi_Comp = GUICtrlCreateTreeViewItem("Computer", $idTVi_General)
	GUICtrlCreateTreeViewItem("Benutzer", $idTVi_General)
	GUICtrlCreateTreeViewItem("Auflösung", $idTVi_Display)
	GUICtrlCreateTreeViewItem("Sonstiges", $idTVi_Display)

	Local $idLbl_Start = GUICtrlCreateLabel("Treeview Demo", 160, 90, 100, 20)
	Local $idLbl_About = GUICtrlCreateLabel("Dieses kleine Skript demonstriert die Benutzung eines Treeview Controls.", 160, 70, 150, 60)
	GUICtrlSetState(-1, $GUI_HIDE) ; Versteckt den "aboutlabel"-Text während der Initialisierung
	Local $idLbl_Compinfo = GUICtrlCreateLabel("Name:" & @TAB & @ComputerName & @CRLF & "OS:" & @TAB & @OSVersion & @CRLF & "SP:" & @TAB & @OSServicePack, 160, 30, 200, 80)
	GUICtrlSetState(-1, $GUI_HIDE) ; Versteckt den "compinfo"-Text während der Initialisierung

	GUICtrlCreateLabel("", 0, 170, 350, 2, $SS_SUNKEN)
	Local $idBtn_Toggle = GUICtrlCreateButton("&Umschalten", 35, 185, 70, 20)
	Local $idBtn_Info = GUICtrlCreateButton("&Info", 105, 185, 70, 20)
	Local $idBtn_State = GUICtrlCreateButton("Auf/Zu", 175, 185, 70, 20)
	Local $idBtn_Cancel = GUICtrlCreateButton("&Abbrechen", 245, 185, 70, 20)

	GUICtrlSetState($idTVi_General, BitOR($GUI_EXPAND, $GUI_DEFBUTTON)) ; Expandiert den "Allgemein"-Tree und stellt ihn im Stil 'fett' dar
	GUICtrlSetState($idTVi_Display, BitOR($GUI_EXPAND, $GUI_DEFBUTTON)) ; Expandiert den "Anzeige"-Tree und stellt ihn im Stil 'fett' dar

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		$idMsg = GUIGetMsg()
		Select
			Case $idMsg = $idBtn_Cancel Or $idMsg = $GUI_EVENT_CLOSE
				ExitLoop

			Case $idMsg = $idBtn_Toggle ; Schriftstil 'Fett' ein/ausschalten
				If BitAND(GUICtrlRead($idTVi_General), $GUI_DEFBUTTON) Then
					GUICtrlSetState($idTVi_General, 0)
					GUICtrlSetState($idTVi_Display, 0)
				Else
					GUICtrlSetState($idTVi_General, $GUI_DEFBUTTON)
					GUICtrlSetState($idTVi_Display, $GUI_DEFBUTTON)
				EndIf

			Case $idMsg = $idBtn_Info
				$idItem = GUICtrlRead($idTreeview) ; Holt die Control-ID des aktuell gewählten Treeview-Items
				If $idItem = 0 Then
					MsgBox($MB_SYSTEMMODAL, "Treeview Demo", "Momentan ist kein Eintrag markiert")
				Else
					$sText = GUICtrlRead($idItem, 1) ; Holt den Text des Treeview-Items
					If $sText == "" Then
						MsgBox($MB_SYSTEMMODAL, "Fehler", "Fehler während der Abfrage des Treeview-Items")
					Else
						MsgBox($MB_SYSTEMMODAL, "Treeview Demo", "Aktuell gewähltes Item ist: " & $sText) ; $advmsg[0] enthält den Text und $advmsg[1] den Statuswert des Treeview-Items
					EndIf
				EndIf

			Case $idMsg = $idBtn_State ; Expandiert oder versteckt den markierten Tree
				$idItem = GUICtrlRead($idTreeview)
				If $idItem > 0 Then
					$hItem = GUICtrlGetHandle($idItem)
					GUICtrlSendMsg($idTreeview, $TVM_EXPAND, $TVE_TOGGLE, $hItem)
				EndIf

				; Die folgenden Items verstecken die anderen Labels (erster und zweiter Parameter) und zeigen anschließend die 'eigenen' Labels (dritter und vierter Parameter)
			Case $idMsg = $idTVi_General
				GUIChangeItems($idLbl_About, $idLbl_Compinfo, $idLbl_Start, $idLbl_Start)

			Case $idMsg = $idTVi_About
				GUICtrlSetState($idLbl_Compinfo, $GUI_HIDE)
				GUIChangeItems($idLbl_Start, $idLbl_Start, $idLbl_About, $idLbl_About)

			Case $idMsg = $idTVi_Comp
				GUIChangeItems($idLbl_Start, $idLbl_About, $idLbl_Compinfo, $idLbl_Compinfo)
		EndSelect
	WEnd

	GUIDelete()
EndFunc   ;==>Example

Func GUIChangeItems($idHidestart, $idHideend, $idShowstart, $idShowend)
	Local $idx

	For $idx = $idHidestart To $idHideend
		GUICtrlSetState($idx, $GUI_HIDE)
	Next
	For $idx = $idShowstart To $idShowend
		GUICtrlSetState($idx, $GUI_SHOW)
	Next
EndFunc   ;==>GUIChangeItems
