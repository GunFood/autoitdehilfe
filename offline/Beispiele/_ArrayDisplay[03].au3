#include <Array.au3>

;verwendet ein Array welches durch StringSplit() zur�ckgegeben wurde)
$avArray = StringSplit(WinGetClassList("", ""), @LF)
_ArrayDisplay($avArray, "$avArray mit allen Klassen in den Fenstern")

