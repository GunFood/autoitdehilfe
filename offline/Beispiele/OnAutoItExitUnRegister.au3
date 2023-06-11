#include <MsgBoxConstants.au3>

OnAutoItExitRegister("MyTestFunc")
OnAutoItExitRegister("MyTestFunc2")

Sleep(1000)

OnAutoItExitUnRegister("MyTestFunc")

Func MyTestFunc()
	MsgBox($MB_SYSTEMMODAL, "Exit Code 1", 'Exit Nachricht von MyTestFunc()')
EndFunc   ;==>MyTestFunc

Func MyTestFunc2()
	MsgBox($MB_SYSTEMMODAL, "Exit Code 2", 'Exit Nachricht von MyTestFunc()')
EndFunc   ;==>MyTestFunc2
