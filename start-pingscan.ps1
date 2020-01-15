function start-pingscan 
{
    param(
    [CmdletBinding()]
    [Parameter(mandatory = $true)][String]$t,
    [Parameter(mandatory = $true)][string] $s,
    [Parameter(mandatory = $true)][string] $e,
    )

<#
    .Synopsis
       Does a ping sweep with one try and waiting 2.
    .DESCRIPTION
       Does ping -n 1 -w 2 over range of IPs
    
    .EXAMPLE
       start-pingscan -t 127.0.0 -s 1 -e 254  
       would ping all IPs from 127.0.0.1 - 127.0.0.254

    #>    
    


    else 
    {
        foreach ($IP in ($s..$e))
        {
            $pingout = $(ping "$t.$IP" -n 1 -w 2)
            if (($pingout.split()[8]) -eq "Request")
            {}
            else
            {
                Write-Output ($pingout.split()[10]).trim(":")
            }
        }
    }
}

