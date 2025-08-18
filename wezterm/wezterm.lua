local DEBUGGING = false

local os = require "os"
local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

if DEBUGGING then
  config = wezterm.config_builder()
  config:set_strict_mode(true)
end

local start_time = wezterm.time.now()

config.automatically_reload_config = true
config.front_end = "WebGpu"
config.check_for_updates = true

-- DEFAULT PROGRAM
-- ---------------

config.default_prog = {
  'C:/Users/Akiles Viza/AppData/Local/Microsoft/WindowsApps/Microsoft.Powershell_8wekyb3d8bbwe/pwsh.exe',
  '-NoLogo'
}

-- THEME AND COLORS
-------------------

-- config.color_scheme = "AdventureTime"
-- config.color_scheme = "Batman"

config.font = wezterm.font "JetBrains Mono" -- Default
config.font = wezterm.font "Cascadia Mono"
config.font_size = 12                       -- Default

-- config.window_background_opacity = 0.95
-- config.window_decorations = "RESIZE"
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.window_decorations = "NONE"

config.audible_bell = "Disabled"

config.window_padding = {
  left = 0,
  right = 5,
  top = 0,
  bottom = 0,
}

config.enable_scroll_bar = true
config.scrollback_lines = 5000

-- TABS CONFIG
--------------

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
-- config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.switch_to_last_active_tab_when_closing_tab = true


-- Key Bindings
-- ------------

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000, }

-- Uses ALT and CTRL|ALT with { 2 3 h j k l z}
function addPaneKeyBindings(config_keys)
  local splitVertical = act.SplitVertical { domain = 'CurrentPaneDomain' }
  local splitHorizontal = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
  -- table.insert(config_keys, { key = '2', mods = 'ALT|CTRL', action = splitVertical })
  -- table.insert(config_keys, { key = '3', mods = 'ALT|CTRL', action = splitHorizontal })
  -- table.insert(config_keys, { key = '-', mods = 'LEADER', action = splitVertical })
  -- table.insert(config_keys, { key = '|', mods = 'LEADER', action = splitHorizontal })
  table.insert(config_keys, { key = '{', mods = 'LEADER', action = splitVertical })
  table.insert(config_keys, { key = '}', mods = 'LEADER', action = splitHorizontal })
  -- Split vertical and horizontal with C|Alt 2 3
  -- table.insert(config_keys, { key = '2', mods = 'ALT|SHIFT', action = splitVertical })
  -- table.insert(config_keys, { key = '2', mods = 'ALT|SHIFT', action = splitVertical })
  -- table.insert(config_keys, { key = '\"', mods = 'ALT|CTRL', action = splitVertical })
  -- table.insert(config_keys, { key = '\"', mods = 'SHIFT|ALT|CTRL', action = splitVertical })
  -- table.insert(config_keys, { key = '\'', mods = 'SHIFT|ALT|CTRL', action = splitVertical })
  -- table.insert(config_keys, { key = '%', mods = 'ALT|CTRL', action = splitHorizontal })
  -- table.insert(config_keys, { key = '%', mods = 'SHIFT|ALT|CTRL', action = splitHorizontal })
  -- table.insert(config_keys, { key = '5', mods = 'SHIFT|ALT|CTRL', action = splitHorizontal })

  -- Enter zen mode with ALT z
  table.insert(config_keys, { key = 'z', mods = 'ALT', action = act.TogglePaneZoomState })
  table.insert(config_keys, { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState })

  -- table.insert(config_keys, { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState })
  -- table.insert(config_keys, { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState })
  -- table.insert(config_keys, { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState })

  -- Change panes with Alt h j k l
  table.insert(config_keys, { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' })
  table.insert(config_keys, { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' })
  table.insert(config_keys, { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' })
  table.insert(config_keys, { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' })

  -- Change panes with S+C arrows
  -- table.insert(config_keys, { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' })
  -- table.insert(config_keys, { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' })
  -- table.insert(config_keys, { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' })
  -- table.insert(config_keys, { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' })

  -- Change panes with Alt arrows
  -- table.insert(config_keys, { key = 'LeftArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Left' })
  -- table.insert(config_keys, { key = 'RightArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Right' })
  -- table.insert(config_keys, { key = 'UpArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Up' })
  -- table.insert(config_keys, { key = 'DownArrow', mods = 'ALT', action = act.ActivatePaneDirection 'Down' })

  -- Adjust size with C-Alt h j k l
  table.insert(config_keys, { key = 'h', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Left', 5 } })
  table.insert(config_keys, { key = 'l', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Right', 5 } })
  table.insert(config_keys, { key = 'k', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Up', 5 } })
  table.insert(config_keys, { key = 'j', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Down', 5 } })

  -- Adjust size with S-C-Alt arrows
  -- table.insert(config_keys, { key = 'LeftArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Left', 1 } })
  -- table.insert(config_keys, { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Right', 1 } })
  -- table.insert(config_keys, { key = 'UpArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Up', 1 } })
  -- table.insert(config_keys, { key = 'DownArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize { 'Down', 1 } })
end

-- Uses A enter, C {- + 0} and C|S { m r l p n }
function addWindowKeyBindings(config_keys)
  -- Fullscreen with A enter
  -- table.insert(config_keys, { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen })
  table.insert(config_keys, { key = 'f', mods = 'LEADER', action = act.ToggleFullScreen })

  -- Decrease, increase and restore font size with C - + 0
  -- table.insert(config_keys, { key = '-', mods = 'CTRL', action = act.DecreaseFontSize })
  -- table.insert(config_keys, { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize })
  -- table.insert(config_keys, { key = '-', mods = 'SUPER', action = act.DecreaseFontSize })
  -- table.insert(config_keys, { key = '_', mods = 'CTRL', action = act.DecreaseFontSize })
  -- table.insert(config_keys, { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize })
  -- table.insert(config_keys, { key = '+', mods = 'CTRL', action = act.IncreaseFontSize })
  -- table.insert(config_keys, { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize })
  -- table.insert(config_keys, { key = '=', mods = 'CTRL', action = act.IncreaseFontSize })
  -- table.insert(config_keys, { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize })
  -- table.insert(config_keys, { key = '=', mods = 'SUPER', action = act.IncreaseFontSize })
  -- table.insert(config_keys, { key = ')', mods = 'CTRL', action = act.ResetFontSize })
  -- table.insert(config_keys, { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize })
  -- table.insert(config_keys, { key = '0', mods = 'CTRL', action = act.ResetFontSize })
  -- table.insert(config_keys, { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize })
  -- table.insert(config_keys, { key = '0', mods = 'SUPER', action = act.ResetFontSize })

  -- Hide window with C|S m
  -- table.insert(config_keys, { key = 'M', mods = 'CTRL', action = act.Hide })
  -- table.insert(config_keys, { key = 'M', mods = 'SHIFT|CTRL', action = act.Hide })
  -- table.insert(config_keys, { key = 'm', mods = 'SHIFT|CTRL', action = act.Hide })
  -- table.insert(config_keys, { key = 'm', mods = 'SUPER', action = act.Hide })

  -- Reload config with C|S r
  -- table.insert(config_keys, { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration })
  -- table.insert(config_keys, { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration })
  -- table.insert(config_keys, { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration })
  -- table.insert(config_keys, { key = 'r', mods = 'SUPER', action = act.ReloadConfiguration })

  -- Debug overlay with C|S l
  -- table.insert(config_keys, { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay })
  -- table.insert(config_keys, { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay })
  -- table.insert(config_keys, { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay })

  -- Command Palette with C|S p
  -- table.insert(config_keys, { key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette })
  -- table.insert(config_keys, { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette })
  -- table.insert(config_keys, { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette })

  -- New window with C|S n
  -- table.insert(config_keys, { key = 'N', mods = 'CTRL', action = act.SpawnWindow })
  -- table.insert(config_keys, { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow })
  -- table.insert(config_keys, { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow })
  -- table.insert(config_keys, { key = 'n', mods = 'SUPER', action = act.SpawnWindow })
end

-- Uses C { v c f k x u space } and S {repag avpag}
function addContentKeyBindings(config_keys)
  -- Scrol by page with S repag avpag
  -- table.insert(config_keys, { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) })
  -- table.insert(config_keys, { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) })

  -- Paste from clipboard with C v
  -- table.insert(config_keys, { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' })
  -- table.insert(config_keys, { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' })
  -- table.insert(config_keys, { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' })
  -- table.insert(config_keys, { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' })
  -- table.insert(config_keys, { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection' })
  -- table.insert(config_keys, { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' })

  -- Copy to clipboard with C c
  -- table.insert(config_keys, { key = 'C', mods = 'CTRL', action = act.CopyTo 'Clipboard' })
  -- table.insert(config_keys, { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' })
  -- table.insert(config_keys, { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' })
  -- table.insert(config_keys, { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' })
  -- table.insert(config_keys, { key = 'Insert', mods = 'CTRL', action = act.CopyTo 'PrimarySelection' })
  -- table.insert(config_keys, { key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' })

  -- Search text with C f
  local currentSelectionOrEmptyString = act.Search 'CurrentSelectionOrEmptyString'
  -- table.insert(config_keys, { key = 'F', mods = 'CTRL', action = currentSelectionOrEmptyString })
  -- table.insert(config_keys, { key = 'F', mods = 'SHIFT|CTRL', action = currentSelectionOrEmptyString })
  -- table.insert(config_keys, { key = 'f', mods = 'SHIFT|CTRL', action = currentSelectionOrEmptyString })
  -- table.insert(config_keys, { key = 'f', mods = 'SUPER', action = currentSelectionOrEmptyString })

  -- Clear scrollback buffer with C k
  table.insert(config_keys, { key = 'k', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' })
  -- table.insert(config_keys, { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' })
  -- table.insert(config_keys, { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' })
  -- table.insert(config_keys, { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' })
  -- table.insert(config_keys, { key = 'k', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackOnly' })

  -- Enter copy mode with C x
  table.insert(config_keys, { key = 'x', mods = 'CTRL', action = act.ActivateCopyMode })
  -- table.insert(config_keys, { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode })
  -- table.insert(config_keys, { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode })
  -- table.insert(config_keys, { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode })

  -- Open emoji panel with C u
  local clipboardAndPrimarySelection = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' }
  table.insert(config_keys, { key = 'u', mods = 'CTRL', action = clipboardAndPrimarySelection })
  -- table.insert(config_keys, { key = 'U', mods = 'CTRL', action = clipboardAndPrimarySelection })
  -- table.insert(config_keys, { key = 'U', mods = 'SHIFT|CTRL', action = clipboardAndPrimarySelection })
  -- table.insert(config_keys, { key = 'u', mods = 'SHIFT|CTRL', action = clipboardAndPrimarySelection })

  -- Enter quickSelect mode with C space
  table.insert(config_keys, { key = 'phys:Space', mods = 'CTRL', action = act.QuickSelect })
  -- table.insert(config_keys, { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect })
end

-- Uses C|S {t s repag avpag tab 1 2 3 ...}, C tab
function addTabKeyBindings(config_keys)
  -- Open new tab with C+S t
  table.insert(config_keys, { key = 't', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' })
  -- { key = 'T',        mods = 'CTRL',        action = act.SpawnTab 'CurrentPaneDomain' },
  -- { key = 'T',        mods = 'SHIFT|CTRL',  action = act.SpawnTab 'CurrentPaneDomain' },
  -- { key = 't',        mods = 'SHIFT|CTRL',  action = act.SpawnTab 'CurrentPaneDomain' },
  -- { key = 't',        mods = 'SUPER',       action = act.SpawnTab 'CurrentPaneDomain' },

  -- Close current tab with C+S w
  table.insert(config_keys, { key = 'w', mods = 'LEADER', action = act.CloseCurrentTab { confirm = true } })
  -- { key = 'W',        mods = 'CTRL',        action = act.CloseCurrentTab { confirm = true } },
  -- { key = 'w',        mods = 'SUPER',       action = act.CloseCurrentTab { confirm = true } },
  -- { key = 'W',        mods = 'SHIFT|CTRL',  action = act.CloseCurrentTab { confirm = true } },
  -- { key = 'w',        mods = 'SHIFT|CTRL',  action = act.CloseCurrentTab { confirm = true } },

  -- Changes in linear manner with C+S repag avpag
  -- { key = 'PageUp',   mods = 'SHIFT|CTRL',  action = act.MoveTabRelative(-1) },
  -- { key = 'PageDown', mods = 'SHIFT|CTRL',  action = act.MoveTabRelative(1) },

  -- Changes in circular manner with C tab and C+S tab
  table.insert(config_keys, { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) })
  table.insert(config_keys, { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) })
  table.insert(config_keys, { key = 'n', mods = 'ALT', action = act.ActivateTabRelative(1) })
  table.insert(config_keys, { key = 'p', mods = 'ALT', action = act.ActivateTabRelative(-1) })
  -- { key = 'Tab',      mods = 'CTRL',        action = act.ActivateTabRelative(1) },
  -- { key = ']',        mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
  -- { key = '}',        mods = 'SUPER',       action = act.ActivateTabRelative(1) },
  -- { key = '}',        mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
  -- { key = 'PageDown', mods = 'CTRL',        action = act.ActivateTabRelative(1) },
  -- { key = '[',        mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
  -- { key = 'Tab',      mods = 'SHIFT|CTRL',  action = act.ActivateTabRelative(-1) },
  -- { key = '{',        mods = 'SUPER',       action = act.ActivateTabRelative(-1) },
  -- { key = '{',        mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
  -- { key = 'PageUp',   mods = 'CTRL',        action = act.ActivateTabRelative(-1) },

  -- Changes to specific tab with CTRL+SHIFT 1234
  table.insert(config_keys, { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) })
  table.insert(config_keys, { key = '"', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) })
  table.insert(config_keys, { key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) })
  table.insert(config_keys, { key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) })
  table.insert(config_keys, { key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) })
  table.insert(config_keys, { key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) })
  table.insert(config_keys, { key = '/', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) })
  table.insert(config_keys, { key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) })
  table.insert(config_keys, { key = ')', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) })

  table.insert(config_keys, { key = '1', mods = 'ALT', action = act.ActivateTab(0) })
  table.insert(config_keys, { key = '2', mods = 'ALT', action = act.ActivateTab(1) })
  table.insert(config_keys, { key = '3', mods = 'ALT', action = act.ActivateTab(2) })
  table.insert(config_keys, { key = '4', mods = 'ALT', action = act.ActivateTab(3) })
  table.insert(config_keys, { key = '5', mods = 'ALT', action = act.ActivateTab(4) })
  table.insert(config_keys, { key = '6', mods = 'ALT', action = act.ActivateTab(5) })
  table.insert(config_keys, { key = '7', mods = 'ALT', action = act.ActivateTab(6) })
  table.insert(config_keys, { key = '8', mods = 'ALT', action = act.ActivateTab(7) })
  table.insert(config_keys, { key = '9', mods = 'ALT', action = act.ActivateTab(-1) })

  -- table.insert(config_keys, { key = '!',        mods = 'CTRL',        action = act.ActivateTab(0) })
  -- table.insert(config_keys, { key = '#',        mods = 'CTRL',        action = act.ActivateTab(2) })
  -- table.insert(config_keys, { key = '$',        mods = 'CTRL',        action = act.ActivateTab(3) })
  -- table.insert(config_keys, { key = '%',        mods = 'CTRL',        action = act.ActivateTab(4) })
  -- table.insert(config_keys, { key = '&',        mods = 'CTRL',        action = act.ActivateTab(6) })
  -- table.insert(config_keys, { key = '(',        mods = 'CTRL',        action = act.ActivateTab(-1) })
  -- table.insert(config_keys, { key = '*',        mods = 'CTRL',        action = act.ActivateTab(7) })
  -- table.insert(config_keys, { key = '@',        mods = 'CTRL',        action = act.ActivateTab(1) })
  -- table.insert(config_keys, { key = '^',        mods = 'CTRL',        action = act.ActivateTab(5) })

  -- table.insert(config_keys, { key = '1',        mods = 'SUPER',       action = act.ActivateTab(0) })
  -- table.insert(config_keys, { key = '2',        mods = 'SUPER',       action = act.ActivateTab(1) })
  -- table.insert(config_keys, { key = '3',        mods = 'SUPER',       action = act.ActivateTab(2) })
  -- table.insert(config_keys, { key = '4',        mods = 'SUPER',       action = act.ActivateTab(3) })
  -- table.insert(config_keys, { key = '5',        mods = 'SUPER',       action = act.ActivateTab(4) })
  -- table.insert(config_keys, { key = '6',        mods = 'SUPER',       action = act.ActivateTab(5) })
  -- table.insert(config_keys, { key = '7',        mods = 'SUPER',       action = act.ActivateTab(6) })
  -- table.insert(config_keys, { key = '8',        mods = 'SUPER',       action = act.ActivateTab(7) })
  -- table.insert(config_keys, { key = '9',        mods = 'SUPER',       action = act.ActivateTab(-1) })

  -- table.insert(config_keys, { key = '1',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(0) })
  -- table.insert(config_keys, { key = '2',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(1) })
  -- table.insert(config_keys, { key = '3',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(2) })
  -- table.insert(config_keys, { key = '4',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(3) })
  -- table.insert(config_keys, { key = '5',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(4) })
  -- table.insert(config_keys, { key = '6',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(5) })
  -- table.insert(config_keys, { key = '7',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(6) })
  -- table.insert(config_keys, { key = '8',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(7) })
  -- table.insert(config_keys, { key = '9',        mods = 'SHIFT|CTRL',  action = act.ActivateTab(-1) })
end

function getLeaderKeybindings()
  return {
    { key = 'c', mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
    { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
    {
      key = ',',
      mods = 'LEADER',
      action = act.PromptInputLine {
        description = "Enter new name for tab",
        action = wezterm.action_callback(
          function(window, pane, line)
            if line then window:active_tab():set_title(line) end
          end
        )
      }
    },
    {
      key = '$',
      mods = 'LEADER|SHIFT',
      action = act.PromptInputLine {
        description = "Enter new name for session",
        action = wezterm.action_callback(
          function(window, pane, line)
            if line then
              mux.rename_workspace(
                window:mux_window():get_workspace(),
                line
              )
            end
          end
        )
      }
    },
    { key = 'w', mods = 'LEADER', action = act.ShowTabNavigator },
    { key = '{', mods = 'LEADER', action = act.PaneSelect { mode = "SwapWithActiveKeepFocus" } },
    { key = ';', mods = 'LEADER', action = act.ActivatePaneDirection('Prev'), },
    { key = 'o', mods = 'LEADER', action = act.ActivatePaneDirection('Next'), },
    { key = 's', mods = 'LEADER', action = act.ShowLauncherArgs { flags = "WORKSPACES" }, },
    { key = 'a', mods = 'LEADER', action = act.AttachDomain "unix", },
    { key = 'd', mods = 'LEADER', action = act.DetachDomain { DomainName = "unix" }, },
    {
      key = 'r',
      mods = 'LEADER',
      action = act.ActivateKeyTable {
        name = "resize_panes",
        one_shot = false,
        timeout_milliseconds = 1000,
      },
    },
  }
end

config.disable_default_key_bindings = false
config.keys = {
  -- table.unpack(getLeaderKeybindings()),
}

addWindowKeyBindings(config.keys)
addTabKeyBindings(config.keys)
addPaneKeyBindings(config.keys)
addContentKeyBindings(config.keys)

config.pane_focus_follows_mouse = false

config.unix_domains = {
  {
    name = "unix",
  }
}

config.key_tables = {
  copy_mode = {
    { key = 'Tab',        mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'Tab',        mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'Enter',      mods = 'NONE',  action = act.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape',     mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 'Space',      mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = '$',          mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '$',          mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = ',',          mods = 'NONE',  action = act.CopyMode 'JumpReverse' },
    { key = '0',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = ';',          mods = 'NONE',  action = act.CopyMode 'JumpAgain' },
    { key = 'F',          mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'F',          mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = 'G',          mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G',          mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'H',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportTop' },
    { key = 'H',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'L',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'L',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'M',          mods = 'NONE',  action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'M',          mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'O',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O',          mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'T',          mods = 'NONE',  action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'T',          mods = 'SHIFT', action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = 'V',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = 'V',          mods = 'SHIFT', action = act.CopyMode { SetSelectionMode = 'Line' } },
    { key = '^',          mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = '^',          mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b',          mods = 'NONE',  action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',          mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b',          mods = 'CTRL',  action = act.CopyMode 'PageUp' },
    { key = 'c',          mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'd',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = (0.5) } },
    { key = 'e',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'f',          mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = false } } },
    { key = 'f',          mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
    { key = 'f',          mods = 'CTRL',  action = act.CopyMode 'PageDown' },
    { key = 'g',          mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'g',          mods = 'CTRL',  action = act.CopyMode 'Close' },
    { key = 'h',          mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'j',          mods = 'NONE',  action = act.CopyMode 'MoveDown' },
    { key = 'k',          mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'l',          mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'm',          mods = 'ALT',   action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'o',          mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'q',          mods = 'NONE',  action = act.CopyMode 'Close' },
    { key = 't',          mods = 'NONE',  action = act.CopyMode { JumpForward = { prev_char = true } } },
    { key = 'u',          mods = 'CTRL',  action = act.CopyMode { MoveByPage = (-0.5) } },
    { key = 'v',          mods = 'NONE',  action = act.CopyMode { SetSelectionMode = 'Cell' } },
    { key = 'v',          mods = 'CTRL',  action = act.CopyMode { SetSelectionMode = 'Block' } },
    { key = 'w',          mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },
    { key = 'y',          mods = 'NONE',  action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } } },
    { key = 'PageUp',     mods = 'NONE',  action = act.CopyMode 'PageUp' },
    { key = 'PageDown',   mods = 'NONE',  action = act.CopyMode 'PageDown' },
    { key = 'End',        mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = 'Home',       mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },
    { key = 'LeftArrow',  mods = 'NONE',  action = act.CopyMode 'MoveLeft' },
    { key = 'LeftArrow',  mods = 'ALT',   action = act.CopyMode 'MoveBackwardWord' },
    { key = 'RightArrow', mods = 'NONE',  action = act.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'ALT',   action = act.CopyMode 'MoveForwardWord' },
    { key = 'UpArrow',    mods = 'NONE',  action = act.CopyMode 'MoveUp' },
    { key = 'DownArrow',  mods = 'NONE',  action = act.CopyMode 'MoveDown' },
  },

  search_mode = {
    { key = 'Enter',     mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'Escape',    mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'n',         mods = 'CTRL', action = act.CopyMode 'NextMatch' },
    { key = 'p',         mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
    { key = 'r',         mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
    { key = 'u',         mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
    { key = 'PageUp',    mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
    { key = 'PageDown',  mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
    { key = 'UpArrow',   mods = 'NONE', action = act.CopyMode 'PriorMatch' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
  },

  resize_panes = {
    { key = 'h', action = act.AdjustPaneSize { 'Left', 5 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 5 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 5 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 5 } },
  }
}

config.default_gui_startup_args = { "connect", "unix" }

local end_time = wezterm.time.now()

print("Elapsed time: " .. tonumber(end_time:format("%s%.f")) - tonumber(start_time:format("%s%.f")))
-- print(os.difftime(wezterm.time.now(), start_time)
-- print(os.difftime(wezterm.time.now(), start_time))

return config

-- Review this code https://gist.github.com/alexpls/83d7af23426c8928402d6d79e72f9401
