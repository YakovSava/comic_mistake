; Inspired by my girlfriend. Karina, I love you

; MIT License

; Copyright (c) 2023 Yakov Savelev

; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:

; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.

; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.


format PE gui
entry start

include "win32a.inc"

section '.data' data readable writeable
	caption db "Error", 0
	message db "This is a strange error!", 0

section '.code' code readable executable
	start:
		mov ebx, 5

		repeat_loop:
			push ebx
			push (MB_ICONERROR or MB_OKCANCEL)
			push caption
			push message
			push 0
			call [MessageBoxA]

			sub ebx, 1
			cmp ebx, 0
			jne repeat_loop

		endprog:
			push 0
			call [ExitProcess]

section '.idata' import data readable writeable
	library kernel32, 'kernel32.dll',\
		user32, 'user32.dll'


	import kernel32,\
		ExitProcess, 'ExitProcess'

	import user32,\
		MessageBoxA, 'MessageBoxA'