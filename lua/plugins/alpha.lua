return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
[[                                                                                         ]], 
[[   ▄██████▄  ███    █▄     ▄████████    ▄████████ ████████▄   ▄█     ▄████████ ███▄▄▄▄   ]],
[[  ███    ███ ███    ███   ███    ███   ███    ███ ███   ▀███ ███    ███    ███ ███▀▀▀██▄ ]],
[[  ███    █▀  ███    ███   ███    ███   ███    ███ ███    ███ ███▌   ███    ███ ███   ███ ]],
[[ ▄███        ███    ███   ███    ███  ▄███▄▄▄▄██▀ ███    ███ ███▌   ███    ███ ███   ███ ]],
[[▀▀███ ████▄  ███    ███ ▀███████████ ▀▀███▀▀▀▀▀   ███    ███ ███▌ ▀███████████ ███   ███ ]],
[[  ███    ███ ███    ███   ███    ███ ▀███████████ ███    ███ ███    ███    ███ ███   ███ ]],
[[  ███    ███ ███    ███   ███    ███   ███    ███ ███   ▄███ ███    ███    ███ ███   ███ ]],
[[  ████████▀  ████████▀    ███    █▀    ███    ███ ████████▀  █▀     ███    █▀   ▀█   █▀  ]],
[[                                       ███    ███                                        ]]
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", "   New file", ":ene <CR>"),
			dashboard.button("f", "   Find file", ":Telescope find_files <CR>"),
			dashboard.button("r", "   Recently opened", ":Telescope oldfiles <CR>"),
			dashboard.button("q", "   Quit", ":qa<CR>"),
		}
		-- Set footer
		dashboard.section.footer.val = "Onwards and Upwards!"
		-- Apply the dashboard configuration
		alpha.setup(dashboard.opts)
	end,
}
