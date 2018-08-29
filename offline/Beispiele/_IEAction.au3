#include <IE.au3>

; Öffnet das "form" - Beispiel im Standardbrowser.
; Nun wird ein Klick auf den Submit-Button simuliert, welcher anhand seiner Beschriftung erkannt wurde.
; Diese Technik ist sinnvoll, weil sehr viele Input-Controls über JavaScript gesteuert werden, bei welchen eine standardmäßige "onClick" Ereignisübergabe mit _IEFormSubmit() nicht immer dass gewünschte Ergebnis hervorruft.

Local $oIE = _IE_Example("form")
Local $oSubmit = _IEGetObjByName($oIE, "submitExample")
_IEAction($oSubmit, "click")
_IELoadWait($oIE)
