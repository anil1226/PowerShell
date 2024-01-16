param (
    [Parameter(Mandatory)]
    [int]
    $Count 
)

function Get-Primes {
    param (
        [Parameter(Mandatory)]
        [int]
        $Count
    )

    $result= @()
    $total = 0

    for ($i = 2; $i -lt $Count; $i++) {
        $primes = [ordered]@{}
        $isPrime = $true

        for ($j = 2; $j -le 7; $j++) {
            
            if (($i % $j -eq 0) -and ($i -ne $j) ) {
                
                $isPrime = $false
            }
        }

        if ($isPrime) {
            $total++
            $primes.Add('Number',$i)
            $primes.Add('Count',$total)

            $bar = new-object -type psobject -property $primes
            $result += $bar
            
        }
      
    }
    return $result
    
}

Get-Primes -Count $Count 