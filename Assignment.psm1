function Set-ReplaceString {
    param (
        [String]$FilePath,
        [String]$OldValue,
        [String]$NewValue,
        [String]$Destination
    )

    $Files = Get-ChildItem $FilePath
    
    foreach ($file in $Files) {
        $FileContent = Get-Content $file -Raw

        if ($FileContent.Contains($OldValue)) {
            $NewContent = $FileContent.Replace($OldValue, $NewValue)
            $DestinationFile = $Destination + "/Replaced_" + $file.Name
            $NewContent | Out-File(New-Item $DestinationFile -Force) 
        }
    }
    Write-Host "Replaced all occurences successfully and moved to path $DestinationFile"
}

function Get-ComponentCost {
    param (
        [String]$FilePath
    )
    $Files = Get-ChildItem $FilePath
    $Total = 0
    foreach ($file in $Files) {
        $FileContent = Get-Content $file -Raw | ConvertFrom-JSON

        if ($FileContent.Cost -and $FileContent.Count) {
            $TotalCost = $FileContent.Cost * $FileContent.Count
            $Total = $Total + $TotalCost
        } 
        
    }
    Write-Host "The total value is:" $Total 
}

function Get-ComponentVersion {
    param (
        [String]$FilePath
    )
    $Files = Get-ChildItem $FilePath
    $Count = 0
    $FileNames = @()
    foreach ($file in $Files) {
        $FileContent = Get-Content $file -Raw | ConvertFrom-JSON

        if ($FileContent.Version) {
            $Count = $Count + 1
            $FileNames += $File.Name        
        }
    }  
    Write-Host "Total count of files having version:" $Count " and name of files: " $FileNames 
}

function Get-ComponentValue {
    param (
        [String]$FilePath,
        [String]$Value
    )
    $Files = Get-ChildItem $FilePath
    $FileNames = @()
    foreach ($file in $Files) {
        $FileContent = Get-Content $file -Raw | ConvertFrom-JSON
        if ($FileContent.Component -eq $Value) {
            $FileNames += $File.Name
        }
    }
    Write-Host "The files with component as database: "$FileNames
}

