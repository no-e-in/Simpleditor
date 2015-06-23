rebol []

area-code-keys: [
	#"[" [i-m-u code-text "[]" 1]
	#"]" [
		either 
			(back code-text/state/cursor) = "^-"
			[
				arg/key:  #"^H"
				super-on-key face arg 
				i-m-u code-text "]" 0
			]
			[super-on-key face arg]
		]
	#"$"  [i-m-u code-text "func [] []" 4]
	#"^M" [i-m-u code-text string-tab code-text/state/cursor 0]
	#"^E" [i-m-u code-text eval-line code-text 0]
	#"^S" [write file-editor face/facets/text-edit call "r3-64-v-d.exe text-pr.r3"]
	F5    [print "ciao"]
]
