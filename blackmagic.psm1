function Blackmagic {
    [CmdletBinding()]
    Param(
        [switch]$ColorBlind
    )
    
    # Initialize Variables
    $ModuleDir = $PSScriptRoot + "\modules"

    # Import all sub-Modules
    $modules = @(Get-ChildItem -path $ModuleDir -recurse | Where-Object {$_.Extension -eq ".psm1"})

    Foreach($module in $modules){

        Import-Module $module.FullName -DisableNameChecking

    } #endforeach

    Clear-Host
    Show-MainMenu

} #endfunction