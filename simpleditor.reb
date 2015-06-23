rebol []
do %r3-gui.r3
do %functions-keys.reb
do %keys.reb
do %aspect.reb
view/options compose/deep/only [
    area-code: area (to-string read file-editor)
		800x500
		options [detab: true text-style: 'font-editor bg-color: (code-text-bg-color)]
		on-key [
			code-text: face/names/text-box
			either find [key word] arg/type [
				switch/default  
					arg/key 
					(area-code-keys) 
					[super-on-key face arg]   ;switch/default 
			] [
				super-on-key face arg
			]   
		]
	output: area
	command: field
] [;options
	title: "Simpleditor"
]
