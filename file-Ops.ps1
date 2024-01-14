[CmdletBinding()]
    param (
        
        [Parameter(Mandatory)]
        [string]
        $Path,
        [Parameter(Mandatory)]
        [int[]]
        $Nums
        
    )

function Read-File {
    [CmdletBinding()]
    param (
        
        [Parameter(Mandatory)]
        [string]
        $Path
        
    )
    
    begin {
        #$filecontent = [System.IO.File]::
    }
    
    process {
        if (Test-Path -Path $Path) {
            $fileContent = Get-Content -Path $Path
            Write-Output $fileContent

            if (-Not [string]::IsNullOrEmpty(($fileContent | Select-String  "provide")) ) {
                Write-Output "Contains provide"
            }else {
                Write-Output "does not Contains provide"
            }
        }
        
    }
    
    end {
        
    }
}

function Write-File {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Path,
        [Parameter(Mandatory,ValueFromPipeline)]
        $Num
    )
    
    begin {
        
        $fileContentOut = "**************** `n"
    }
    
    process {
        Out-File -InputObject $fileContentOut -FilePath $Path  -Append
        for ($i = 1; $i -lt 11; $i++) {
            $fileContentOut = ""+$Num+" X "+$i+" = "+ $Num * $i+" "
            Out-File -InputObject $fileContentOut -FilePath $Path  -Append
            #$fileContentOut = ""
        }
        #$fileContentOut += "###########"
        
    }
    
    end {
         "###########" |  Out-File  -FilePath $Path  -Append
    }
}

Read-File -Path $Path
$Nums |   Write-File  -Path $Path



