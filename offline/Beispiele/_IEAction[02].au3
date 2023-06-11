;Ähnlich wie Beispiel 1, nur dass hier dem gewünschten Element der Fokus übergeben
;              wird und dann über ControlSend() Enter gesendet.
;              Verwende diese Technik, wenn Skripte im Browser verhindern,
;              dass AutoIt das Ende der Aktion mitbekommt und das Skript fortgesetzt wird.

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oSubmit = _IEGetObjByName($oIE, "submitExample")
Local $hwnd = _IEPropertyGet($oIE, "hwnd")
_IEAction($oSubmit, "focus")
ControlSend($hwnd, "", "[CLASS:Internet Explorer_Server; INSTANCE:1]", "{Enter}")

; Wartet bis das Explorerfenster im Vordergrund ist, und klickt dann auf OK.
WinWait("Windows Internet Explorer", "ExampleFormSubmitted")
Sleep(2000)

ControlClick("Windows Internet Explorer", "ExampleFormSubmitted", "[CLASS:Button; TEXT:OK; Instance:1;]")
Sleep(2000)

_IEQuit($oIE)
