#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>
#include <WindowsNotifsConstants.au3>

Example()

Func Example()
	; Aktiviert den Gui OnEvent Mode
	Opt("GUIOnEventMode", 1)

	; Erstellt eine einfache Gui
	Local $hWnd = GUICreate("DllCallAddress Beispiel")

	; Beim schliessen des Fensters, OnClose aufrufen
	GUISetOnEvent($GUI_EVENT_CLOSE, "OnClose")

	; Zeigt die Gui
	GUISetState(@SW_SHOWNORMAL, $hWnd)

	; Holt den Pointer zur Windows-Funktion WindowProc().
	Local $pWndProc = _WinAPI_GetWindowLong($hWnd, $GWL_WNDPROC)

	; Teilt dem User mit was passieren wird
	MsgBox($MB_SYSTEMMODAL, "DllCallAddress Beispiel Nachricht", "Wenn auf OK geklickt wird, wird das Fenster geschlossen.")

	; Explizit wird ein WM_CLOSE Event generiert und direkt zur WindowProc() weitergegeben.
	; Das sollte in keiner echten Applikation so sein (lieber _SendMessage() nutzen) aber
	; es demonstriert wie man die Funktion nutzt

	DllCallAddress("LRESULT", $pWndProc, "HWND", $hWnd, "UINT", $WM_CLOSE, "WPARAM", 0, "LPARAM", 0)
EndFunc   ;==>Example

Func OnClose()
	GUIDelete(@GUI_WinHandle)
	MsgBox($MB_SYSTEMMODAL, "DllCallAddress Beispiel Nachricht", "Schliess-Event empfangen. Das Test-Fenster sollte jetzt geschlossen sein")
EndFunc   ;==>OnClose
