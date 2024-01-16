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

    $primes = ""
    $total = 0

    for ($i = 2; $i -lt $Count; $i++) {
        $isPrime = $true

        for ($j = 2; $j -le 7; $j++) {
            
            if (($i % $j -eq 0) -and ($i -ne $j) ) {
                
                $isPrime = $false
            }
        }

        if ($isPrime) {
            $primes+= "$i `n"
            $total++
        }
    }
    return [PSCustomObject]@{
        PrimeNumbers = $primes
        Total = $total
    }
}

Get-Primes -Count $Count 