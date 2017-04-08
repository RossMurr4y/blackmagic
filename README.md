# blackmagic
A dynamic PowerShell menu for auto-loading and simple execution of any provided Powershell Module Functions.

# Core Functions
The following 'core' functions are contained 

# System Requirements

# Design Scope
blackmagic on its own does very little. It's itended purpose is to be combined with other PowerShell modules that perform simple, repeatable System Administration tasks. When stored in the 'Modules' directory and any subfolder therein, Functions within those modules will be autoloaded into a menu whereby they can be triggered at will. Upon those Functions completion the Menu will be displayed once more.

blackmagic should be developed in such a way that 'core' or 'critical' Functions -such as Logging or other shared components - are stored within their own easily identified modules. This way new Functions can utilise them and users of blackmagic can safely remove unwanted Modules without impacting the performance of blackmagic propper.

blackmagic should be written in such a way that a new module developer can easily identify how to write a Function that will display within the menu, whilst also being able to author supporting Functions that will **not** appear within the menu. Additionally, blackmagic should provide an option for Module authors to specific a 'menu-readable' variant to the Function name, making the tool more friendly to non-developers. For example a Function called Get-CurrentMachineUser should be able to be displayed as 'Find Logged On User' in the menu. This should be optional, and not require extreme string manipulation or non-standard Function names to achieve. It must remain very easily understood upon reading.

The blackmagic menu should be pleasant to look at, and not overly cluttered. It should launch with the alias 'blackmagic' from PowerShell, and have an optional switch for colorblind mode. Lauching blackmagic several times with the same sub-modules should cause the menu to appear the same each time (numbering/order won't change) and launch quickly. It should be entirely self-contained.

blackmagic should include an auto-update feature, that pulls the latest 'core' repository (this one) from Github. A feature to seek out new sub-modules from the publishers Github repository specifically designed for use with blackmagic should be included, allowing simple installation / upgrade of a select set of sub-modules. A developer should be capable of specifying additional Github accounts to search for modules.

Logging of all tasks performed is to be present.

No asumption as to the role / job title of the operator or module developers is to be made to ensure maximum utility.