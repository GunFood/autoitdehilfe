; == Example 2, @HotKeyPressed usage

#include <MsgBoxConstants.au3>

; Um das Skript zu beenden ist Esc zu drücken, Pause/Break zum "Pausieren"

Global $g_bPaused = False

HotKeySet("{PAUSE}", "HotKeyPressed")
HotKeySet("{ESC}", "HotKeyPressed")
HotKeySet("+!d", "HotKeyPressed") ; Shift-Alt-d

While 1
	Sleep(100)
WEnd

Func HotKeyPressed()
	Switch @HotKeyPressed ; Der zuletzt gedrückte HotKey.
		Case "{PAUSE}" ; Die Zeichenfolge ist der {PAUSE} HotKey.
			$g_bPaused = Not $g_bPaused
			While $g_bPaused
				Sleep(100)
				ToolTip('Skript wurde "Pausiert"', 0, 0)
			WEnd
			ToolTip("")

		Case "{ESC}" ; Die Zeichenfolge ist der {ESC} HotKey.
			Exit

		Case "+!d" ; Die Zeichenfolge ist der Shift-Alt-d HotKey.
			MsgBox($MB_SYSTEMMODAL, "", "Dies ist eine Nachricht.")

	EndSwitch
EndFunc   ;==>HotKeyPressed
