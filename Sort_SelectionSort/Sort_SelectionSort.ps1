# -- Sort_SelectionSort.ps1

# Initial
$WIDTH = $Host.UI.RawUI.WindowSize.Width
$MAX_SIZE = 20
#[int[$MAX_SIZE]]$arrInt = @()
$arrInt = New-Object int[] $MAX_SIZE
for( $i = 0; $i -lt $MAX_SIZE; $i += 1){
  $tmp = Get-Random
  $tmp = $tmp % ( $WIDTH - 5 )
  $arrInt[$i] = $tmp
}

# Print Input
function printArr{
  param(
    [int[]]$arr,
    [int]$wkIndex = 0 #
  )
  foreach($i in $arr){
    $tmp = ("{0,3}" -f $i)
    if( $i -eq $wkIndex ){
      Write-Host -NoNewLine [$tmp]
      Write-Host ("#" * $i)
    } else {
      Write-Host -NoNewLine [$tmp]
      Write-Host ("#" * $i)
    }
  }
  Write-Host ""
}

# main
Clear-Host
Write-Host ("|" * $WIDTH)
printArr -arr $arrInt
Write-Host ("|" * $WIDTH)
$len = $arrInt.Length
for( $i = 0; $i -lt $len - 1; $i += 1 ){
  for( $j = 0; $j -lt $len - $i - 1; $j += 1 ){
    if( $arrInt[$j] -gt $arrInt[$j + 1] ){
#
#echo $tmp $arrInt[$j] $arrInt[$j + 1]
#Read-Host "Press Enter to continue..."
#
      $tmp = $arrInt[$j]
      $arrInt[$j] = $arrInt[$j + 1]
      $arrInt[$j + 1] = $tmp
#
#echo $tmp $arrInt[$j] $arrInt[$j + 1]
#Read-Host "Press Enter to continue..."
#
      Clear-Host
      Write-Host ("|" * $WIDTH)
      printArr -arr $arrInt -wkIndex $j
      Write-Host ("|" * $WIDTH)
      Start-Sleep -Milliseconds 100
    }
  }
}

# End of file
