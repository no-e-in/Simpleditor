rebol []


super-on-key: func [face arg] [do-actor/style face 'on-key arg face/style]
insertText-moveCursor-updateFace: func [
    face
    string
    n-move
][
    insert-text-face face string
    move-cursor face 'left n-move false 
    update-text-caret face 
    see-caret face
    show-later face
]   

i-m-u: :insertText-moveCursor-updateFace

count-ch: func [
	string
	char
	/local i
][
	i: 0
	parse string [some [char (++ i)]]
	i
]

count-tab: func [string] [count-ch find-newline string tab]
find-newline: func [string /local ris] [
	either 
		ris: find/reverse string newline 
		[next ris] 
		[head string] ;first line
]  
string-tab: funct [string] [
	n: count-tab string 
	str: make string! add n 1; newline + tabs 
	append str newline
	loop n [append str #"^-"] 
	str
]

eval-line: func [
	face
	/local text-eval result text-loaded
][
	text-eval: copy/part
					find-newline face/state/cursor
					face/state/cursor
	text-loaded: load text-eval 
	either error? result: try text-loaded ["error"] [to-string result]
]
