format PE gui
entry start

include "win32a.inc"

section '.data' data readable writeable
	caption db "Hello world!", 0
	message db "Test message", 0

section '.code' code readable executable
	start:
		push MB_OK
		push caption
		push message
		push 0
		call [MessageBoxA]

		push 0
		call [ExitProcess]

section '.idata' import data readable writeable
	library kernel32, 'kernel32.dll',\
		user32, 'user32.dll'


	import kernel32,\
		ExitProcess, 'ExitProcess'

	import user32,\
		MessageBoxA, 'MessageBoxA'