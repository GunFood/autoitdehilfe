#include <MsgBoxConstants.au3>

#comments-start
	MsgBox($MB_SYSTEMMODAL, "", "Das wird nicht angezeigt")
	MsgBox($MB_SYSTEMMODAL, "", "und dies ebenso nicht")
#comments-end

;;; #cs
MsgBox($MB_SYSTEMMODAL, "", "Das wird angezeigt wenn '#cs/#ce' auskommentiert ist.")
;;; #ce
