-- Static colorscheme for non-Omarchy machines (e.g. macOS).
-- On Linux this file is ignored by chezmoi so Omarchy keeps its live
-- symlink at ~/.config/omarchy/current/theme/neovim.lua.
-- Change the colorscheme below to whatever you like on macOS.
return {
	{ "rebelot/kanagawa.nvim" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "kanagawa",
		},
	},
}
