#include <GUIConstantsEx.au3>

Global $g_iIDC = -1, $g_iNewIDC = 0
Global $g_aArray = StringSplit("Hand|AppStarting|Arrow|Cross|Help|IBeam|Icon (obsolete)|No|" & _
		"Size (obsolete)|SizeAll|SizeNESW|SizeNS|SizeNWSE|SizeWE|UpArrow|Wait|None", "|", 2) ; Der flag Parameter wurde auf flag = 2 gesetzt, da keine Gesamtanzahl des Arrays notwendig ist

Example()

Func Example()
	HotKeySet("{Esc}", "Increment")

	GUICreate("Drücke Esc um zu erhöhen", 400, 400, 0, 0)

	GUISetState(@SW_SHOW)

	While GUIGetMsg() <> $GUI_EVENT_CLOSE
		If $g_iNewIDC <> $g_iIDC Then
			$g_iIDC = $g_iNewIDC
			GUISetCursor($g_iIDC)
		EndIf
		ToolTip("GUI Cursor #" & $g_iIDC & " (" & $g_aArray[$g_iIDC] & ")")
	WEnd

	GUIDelete()
EndFunc   ;==>Example

Func Increment()
	$g_iNewIDC = $g_iIDC + 1
	If $g_iNewIDC > 15 Then $g_iNewIDC = 0
EndFunc   ;==>Increment
