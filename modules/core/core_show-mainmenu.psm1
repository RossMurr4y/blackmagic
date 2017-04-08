function Show-MainMenu {
    [CmdletBinding()]

    # Initialize Variables
    [int]$FunctionCounter = 0
    $Groups = @{}
    $ModulesDirectory = $PSScriptRoot.parent
    $Modules = @(Get-ChildItem -Path $ModulesDirectory | Where-Object {$_ -ine 'core'})

    # Read through all of the Modules and find the Functions tagged as ###INCLUDE 
    # Generate a hash table of Modules, and the Functions within those Modules (Hash with Arrays as Values)
    # Functions will be the Function's cmdlet name and a simplified readable name, seperated by ::
    # EXAMPLE INCLUDE:   ###INCLUDE:Show-MainMenu::Return to the Main Menu
    ForEach ($Module in $Modules) {

        $Functions = @()
        $Functions += (Get-Content -Path $Module.FullName | Where-Object {$_ -like '###INCLUDE:'}).Substring(11)
        $Groups.Add($Module.parent, $Functions)
        Write-Verbose "Groups : $Groups"
    } #endforeach

    #Dynamically generate a menu
    Write-Host ""
    ForEach ($Group in $Groups.Keys) {

        $i = 0
        Write-Host "[ $Group ]"
        ForEach ($FunctionArray in $Groups.Values) {

            ForEach ($Function in $FunctionArray) {

                $SimpleFunction = $Function.Split('::')[1]
                Write-Host "  $FunctionCounter - $SimpleFunction"
                $FunctionCounter ++
                $i++

            } #endforeach
        } #endforeach

        Write-Host ""

    } #endforeach

    # Obtain user input
    Write-Host "Select a Function to perform (0 - $FunctionCounter): "
    [int]$UserInput = Read-Host

    # Invoke the chosen Function
    # Join all the Group Functions into one Array, then get the $UserInput.
    # Split the result, taking only the Function name and Invoke it.
    $InvokedFunction = (($Groups.Values.Join(','))[$UserInput]).Split('::')[0]
    & $InvokedFunction

    # Pause after each function ends. 
    # On key press, clear screen
    Pause
    Clear-Host

    # Invoke Self
    & $MyInvocation.MyCommand

} #endfunction