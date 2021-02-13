#Import Assignment Module
import-Module "./Assignment.psm1"

#Replace all occurence of ${REPLACE} in Files
Set-ReplaceString -FilePath "./Files" -OldValue '${REPLACE}' -NewValue "Prachi" -Destination "./Replaced"

#Total cost of all components (Cost and Count)
Get-ComponentCost -FilePath "./Files"

#Display files with property name version
Get-ComponentVersion -FilePath "./Files"

#Display files having Component Value as Database
Get-ComponentValue -FilePath "./Files" -value "Database"