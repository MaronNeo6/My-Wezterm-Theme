local wezterm = require("wezterm")
act = wezterm.action

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Configuração Básica

config.color_scheme = "Tokyo Night"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.window_background_opacity = 0.7

-- Escurecer Paineis inativos

config.inactive_pane_hsb = {
	saturation = 0.50,
	brightness = 0.25,
}

-- Configuração da Fonte

config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 10.0

-- Configuração das Teclas de atalho

config.keys = {

	-- Ações basicas

	{ key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
	{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "f", mods = "CTRL", action = wezterm.action.ToggleFullScreen },

	-- Ajuste e navegação nos paineis

	{ key = "k", mods = "CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "j", mods = "CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "UpArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "SHIFT", action = act.ActivatePaneDirection("Right") },

	-- Troca entre paineis

	{ key = "8", mods = "CTRL", action = act.PaneSelect },
	{ key = "9", mods = "CTRL", action = act.PaneSelect({ alphabet = "1234567890" }) },
	{ key = "0", mods = "CTRL", action = act.PaneSelect({ mode = "SwapWithActive" }) },

	-- Ajustes do tamanho do painel

	{ key = "UpArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "LeftArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Right", 5 }) },

	-- Copiar e colar

	{ key = "c", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },

	-- Sair do Wezterm

	{ key = 'q', mods = 'CTRL', action = wezterm.action.QuitApplication }
}

-- Configuração da Janela

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE|TITLE"

-- Transparência no MacOS (Descomente caso queira)

-- config.window_background_opacity = 0.3
-- config.macos_window_background_blur = 20

-- Transparência no Windows (Descomente caso queira)

-- config.window_background_opacity = 0.5
-- config.win32_system_backdrop = "Acrylic"

return config
