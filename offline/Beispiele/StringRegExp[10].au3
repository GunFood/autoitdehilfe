#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von gierigen und faulen Wiederholungszeichen
; Das erste * ist gierig. Es wird die l�ngste Stelle gesucht
$aRegExp = StringRegExp("Die Abk�rzung 'ISP' hei�t 'Internet Service Provider'.", ".*'(.*)'.*", 3)
_ArrayDisplay($aRegExp)

; Durch anh�ngen eines ? wird es faul und es wird die k�rzeste Stelle gesucht
$aRegExp = StringRegExp("Die Abk�rzung 'ISP' hei�t 'Internet Service Provider'.", ".*?'(.*?)'.*", 3)
_ArrayDisplay($aRegExp)

; Das erste * ist gierig. Es wird die l�ngste Stelle gesucht
$aRegExp = StringRegExp("12-34.abc.def@mail.de", "(.*)\.(.*)*@(.*)\.(.*)", 3)
_ArrayDisplay($aRegExp)

; Durch anh�ngen eines ? wird es faul und es wird die k�rzeste Stelle gesucht
$aRegExp = StringRegExp("12-34.abc.def@mail.de", "(.*?)\.(.*)*@(.*)\.(.*)", 3)
_ArrayDisplay($aRegExp)



