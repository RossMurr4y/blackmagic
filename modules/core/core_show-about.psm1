function Show-About {
    ###INCLUDE Show-About::About blackmagic

    #Initialize Variables
    $ModuleManifest = $PSScriptRoot + '\blackmagic.psd1'
    $ModuleVersion = (Get-Content $ModuleManifest | Where-Object {$_ -like 'ModuleVersion'}).Substring(17,-1)
    $Content = @"

           (
            )  )
         ____(__(_
        (_________)            
        /         \             
       /           \                       
  _____\   ,   ;(   /______  blackmagic v$ModuleVersion
 ()____'._/(_ /  \__.'____() DEVELOPED BY ROSS MURRAY, 2017
      .'` .'```'. `-.        GITHUB: https://github.com/RossMurr4y
     ().'`       `'.()       LINKEDIN: linkedin.com/in/ross-murray-a390a3136

"@

    Write-Host $Content
}