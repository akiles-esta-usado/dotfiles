#!/usr/bin/env pwsh

param (
    [switch] $dry = $false,
    [switch] $debugEnabled = $true
)

$ErrorActionPreference = "Stop"

$os = `
        $($isWindows) ? "win" : `
        $($isLinux) ? "linux" : `
        $($isMacOS) ? "mac" : `
        $(throw "OS Not supported")

# Which file/dir goes to where based on OS
$config = [ordered]@{
    "wezterm" = [ordered]@{
        "win" = "~/.config/wezterm";
        "linux" = "~/.config/wezterm";
    };
    "helix" = [ordered]@{
        "win" = "~/AppData/Roaming/helix";
        "linux" = "~/.config/helix";
    };
    "presenterm" = [ordered]@{
        "win" = "~/AppData/Roaming/presenterm";
        "linux" = "~/.config/presenterm";
    };
    "SumatraPDF-settings.txt" = [ordered]@{
        "win" = "~/AppData/Local/SumatraPDF/SumatraPDF-settings.txt";
    };
    "zathura" = [ordered]@{
        "linux" = "~/.config/zathura";
    }
}

function log($line, $type) {
    if (-Not $debugEnabled) {
        return
    }

    Switch($type) {
        "Error" {
            Write-Host $line -ForegroundColor Red
        }
        "Warning" {
            Write-Host $line -ForegroundColor Yellow
        }
        default {
            Write-Host $line
        }
    }
}

function logAlways($line) {
    Write-Host $line
}

function logError($line) {
    Write-Host $line -ForegroundColor Red
}

function logWarning($line) {
    log -line $line -type "Warning"
}

function Resolve-PathSafe($path) {
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($path)
}

function linkTool($dotfile) {
    log("[linkTool] $dotfile")

    if (-Not (Test-Path $dotfile)) {
        logError("  $dotfile don't exist")
        return
    }

    if (-Not ($config[$dotfile]) -Or -Not ($config[$dotfile][$os]) ) {
        logError("  $dotfile don't have a target directory for $os")
        return
    }

    log("  dotfiles and target are defined")

    $target_path = $config[$dotfile][$os];

    if (Test-Path $target_path) {
        logError("  Target directory already exists")
        return
    }

    log("  $target_path is available")

    # The target requires a directory to be in
    $target_parent = Split-Path (Resolve-PathSafe $target_path)
    log("  Target parent: $target_parent")
    if (-Not (Test-Path $target_parent)) {
        if ($dry) {
            logAlways("  Creating $($target_parent)")
        }
        else {
            New-Item -ItemType Directory -Path $target_parent
        }
    }

    if ($dry) {
        logAlways("  Linking $dotfile with $target_path")
        return
    }

    # On windows, directory links are junctions
    if ($IsWindows -And (Get-Item $dotfile) -is [System.IO.DirectoryInfo]) {
        New-Item -Path (Resolve-PathSafe $target_path) -ItemType Junction -Value (Get-Item $dotfile)
    } 
    else{
        New-Item -Path (Resolve-PathSafe $target_path) -ItemType SymbolicLink -Value (Get-Item $dotfile)
    }
}

linkTool -dotfile "wezterm"
linkTool -dotfile "helix"
linkTool -dotfile "presenterm"
linkTool -dotfile "SumatraPDF-settings.txt"
linkTool -dotfile "zathura"
