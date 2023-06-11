#include <Array.au3>
#include <Constants.au3>

; ----------------- Anwendung von gierigen und faulen Wiederholungszeichen
; Das erste * ist gierig. Es wird die längste Stelle gesucht
$aRegExp = StringRegExp("Die Abkürzung 'ISP' heißt 'Internet Service Provider'.", ".*'(.*)'.*", 3)
_ArrayDisplay($aRegExp)

; Durch anhängen eines ? wird es faul und es wird die kürzeste Stelle gesucht
$aRegExp = StringRegExp("Die Abkürzung 'ISP' heißt 'Internet Service Provider'.", ".*?'(.*?)'.*", 3)
_ArrayDisplay($aRegExp)

; Das erste * ist gierig. Es wird die längste Stelle gesucht
$aRegExp = StringRegExp("12-34.abc.def@mail.de", "(.*)\.(.*)*@(.*)\.(.*)", 3)
_ArrayDisplay($aRegExp)

; Durch anhängen eines ? wird es faul und es wird die kürzeste Stelle gesucht
$aRegExp = StringRegExp("12-34.abc.def@mail.de", "(.*?)\.(.*)*@(.*)\.(.*)", 3)
_ArrayDisplay($aRegExp)



