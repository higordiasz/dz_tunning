fx_version "bodacious"
game "gta5"

ui_page "web/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client/*",
	"data/*"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server/*"
}

files {
	"web/*",
	"web/**/*"
}
