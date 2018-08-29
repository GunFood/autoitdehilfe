; Wartet bis kein Prozess mehr von notepad.exe existiert
ProcessWaitClose("notepad.exe")

; Wartet,bis der spezielle Prozess ($iPid) von der notepad.exe durch den Benutzer geschlossen wurde.
Local $iPID = Run("notepad.exe")
ProcessWaitClose($iPID)
