local wezterm = require "wezterm"
local act = wezterm.action

-- Leader   { { } }
-- Alt      { h j k l z}
-- Ctrl-Alt { h j k l }
local function addPaneKeyBindings(config_keys)
  local splitVertical   = act.SplitVertical   { domain = 'CurrentPaneDomain' }
  local splitHorizontal = act.SplitHorizontal { domain = 'CurrentPaneDomain' }

  -- Create panes
  table.insert(config_keys, { key = '{', mods = 'LEADER', action = splitVertical })
  table.insert(config_keys, { key = '}', mods = 'LEADER', action = splitHorizontal })

  -- Enter zen mode with ALT z
  table.insert(config_keys, { key = 'z', mods = 'ALT', action = act.TogglePaneZoomState })

  -- Change panes
  table.insert(config_keys, { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' })
  table.insert(config_keys, { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' })
  table.insert(config_keys, { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' })
  table.insert(config_keys, { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' })
  table.insert(config_keys, { key = 'p', mods = 'ALT', action = act.ActivatePaneDirection('Prev'), })
  table.insert(config_keys, { key = 'n', mods = 'ALT', action = act.ActivatePaneDirection('Next'), })

  -- Adjust size with C-Alt h j k l
  table.insert(config_keys, { key = 'h', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Left',  3 } })
  table.insert(config_keys, { key = 'l', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Right', 3 } })
  table.insert(config_keys, { key = 'k', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Up',    3 } })
  table.insert(config_keys, { key = 'j', mods = 'ALT|CTRL', action = act.AdjustPaneSize { 'Down',  3 } })

  -- Resize Pane Mode
  local activateResizePanesMode = act.ActivateKeyTable {
    name = "resize_panes",
    one_shot = false,
    timeout_milliseconds = 1000,
  }
  table.insert(config_keys, { key = 'r', mods = 'LEADER', action = activateResizePanesMode })

  -- Swap pane position
  -- table.insert(config_keys, { key = '{', mods = 'LEADER', action = act.PaneSelect { mode = "SwapWithActiveKeepFocus" } })
end

-- C    {f - + 0 r l p n }
local function addWindowKeyBindings(config_keys)
  -- Fullscreen
  table.insert(config_keys, { key = 'Enter', mods = 'CTRL', action = act.ToggleFullScreen })

  -- Decrease, increase and restore font size with C - + 0
  table.insert(config_keys, { key = '-', mods = 'CTRL', action = act.DecreaseFontSize })
  table.insert(config_keys, { key = '+', mods = 'CTRL', action = act.IncreaseFontSize })
  table.insert(config_keys, { key = '0', mods = 'CTRL', action = act.ResetFontSize })

  -- Hide window
  -- table.insert(config_keys, { key = 'M', mods = 'CTRL', action = act.Hide })

  -- Reload config with C|S r
  table.insert(config_keys, { key = 'r', mods = 'CTRL', action = act.ReloadConfiguration })

  -- Debug overlay
  table.insert(config_keys, { key = 'l', mods = 'CTRL', action = act.ShowDebugOverlay })

  -- Command Palette
  table.insert(config_keys, { key = 'p', mods = 'CTRL', action = act.ActivateCommandPalette })

  -- Create window
  table.insert(config_keys, { key = 'n', mods = 'CTRL', action = act.SpawnWindow })
end

-- Alt        { repag avpag f }
-- Ctrl-Shift { C V }
-- Shift      { Ins }
-- Ctrl       { Ins k x u space}
local function addContentKeyBindings(config_keys)
  -- Scrol by page
  table.insert(config_keys, { key = 'PageDown', mods = 'ALT', action = act.ScrollByPage(.5) })
  table.insert(config_keys, { key = 'PageUp', mods = 'ALT', action = act.ScrollByPage(-.5) })

  -- Copy and paste from clipboard
  table.insert(config_keys, { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo    'Clipboard' })
  table.insert(config_keys, { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' })

  -- Copy and paste from primary selection (local)
  table.insert(config_keys, { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection' })
  table.insert(config_keys, { key = 'Insert', mods = 'CTRL',  action = act.CopyTo 'PrimarySelection' })

  -- Search text
  local currentSelectionOrEmptyString = act.Search 'CurrentSelectionOrEmptyString'
  table.insert(config_keys, { key = 'f', mods = 'ALT', action = currentSelectionOrEmptyString })

  -- Clear scrollback buffer
  table.insert(config_keys, { key = 'k', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' })

  -- Copy mode
  table.insert(config_keys, { key = 'x', mods = 'CTRL', action = act.ActivateCopyMode })
  
  -- Emoji panel
  local clipboardAndPrimarySelection = act.CharSelect { copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' }
  table.insert(config_keys, { key = 'u', mods = 'CTRL', action = clipboardAndPrimarySelection })

  -- QuickSelect mode
  table.insert(config_keys, { key = 'phys:Space', mods = 'CTRL', action = act.QuickSelect })
end

-- C {t w '{' '}' }
-- ALT { 1..9 '{' '}' }
local function addTabKeyBindings(config_keys)
  -- Tab Navigator
  table.insert(config_keys, { key = 't', mods = 'LEADER', action = act.ShowTabNavigator })

  -- Open new tab with C+S t
  table.insert(config_keys, { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' })
  
  -- Close current tab with C+S w
  table.insert(config_keys, { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab { confirm = true } })

  -- Move tabs
  table.insert(config_keys, { key = '{',   mods = 'CTRL',  action = act.MoveTabRelative(-1) })
  table.insert(config_keys, { key = '}', mods = 'CTRL',  action = act.MoveTabRelative(1) })

  -- Relative change tab
  table.insert(config_keys, { key = '}', mods = 'ALT', action = act.ActivateTabRelative(1) })
  table.insert(config_keys, { key = '{', mods = 'ALT', action = act.ActivateTabRelative(-1) })

  -- Changes to tab with ALT { 1 ... 9 }
  table.insert(config_keys, { key = '1', mods = 'ALT', action = act.ActivateTab(0) })
  table.insert(config_keys, { key = '2', mods = 'ALT', action = act.ActivateTab(1) })
  table.insert(config_keys, { key = '3', mods = 'ALT', action = act.ActivateTab(2) })
  table.insert(config_keys, { key = '4', mods = 'ALT', action = act.ActivateTab(3) })
  table.insert(config_keys, { key = '5', mods = 'ALT', action = act.ActivateTab(4) })
  table.insert(config_keys, { key = '6', mods = 'ALT', action = act.ActivateTab(5) })
  table.insert(config_keys, { key = '7', mods = 'ALT', action = act.ActivateTab(6) })
  table.insert(config_keys, { key = '8', mods = 'ALT', action = act.ActivateTab(7) })
  table.insert(config_keys, { key = '9', mods = 'ALT', action = act.ActivateTab(-1) })

  -- Change tab name
  local promptTabNameCallback = act.PromptInputLine {
    description = "Enter new name for tab",
    action = wezterm.action_callback(
      function(window, pane, line)
        if line then window:active_tab():set_title(line) end
      end
    )
  }
  table.insert(config_keys, { key = ',', mods = 'CTRL',       action = promptTabNameCallback })
end

local function addSessionKeyBindings(config_keys)
  -- Workspace Selector
  table.insert(config_keys, { key = 's', mods = 'LEADER', action = act.ShowLauncherArgs { flags = "WORKSPACES" }, })

  -- Change session name
  local promptSessionNameCallback = act.PromptInputLine {
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
  table.insert(config_keys, { key = '$', mods = 'LEADER|SHIFT', action = promptSessionNameCallback})

  -- Attach to / detach from domains
  table.insert(config_keys, { key = 'a', mods = 'LEADER', action = act.AttachDomain "unix", })
  table.insert(config_keys, { key = 'd', mods = 'LEADER', action = act.DetachDomain { DomainName = "unix" }, })
end

local module = {}

function module.apply_to_config(config)

    config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000, }
    config.disable_default_key_bindings = true

    addWindowKeyBindings(config.keys)
    addContentKeyBindings(config.keys)
    addTabKeyBindings(config.keys)
    addPaneKeyBindings(config.keys)

    -- Session vs Domain vs Workspace vs Tab vs Pane
    addSessionKeyBindings(config.keys)
end

return module