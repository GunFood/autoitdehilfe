#include <IE.au3>

; Erstellt ein Browserfenster und stellt jede der möglichen Beispielseiten dar.
; Die zurückgegebene Objektvariable kann als Objektvariable behandelt werden, die von _IECreate oder _IEAttach zurückgegeben wurde.

Local $oIE_basic = _IE_Example("basic")
Local $oIE_form = _IE_Example("form")
Local $oIE_table = _IE_Example("table")
Local $oIE_frameset = _IE_Example("frameset")
Local $oIE_iframe = _IE_Example("iframe")
