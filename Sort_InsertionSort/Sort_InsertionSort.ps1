# -- Sort_InsertionSort.ps1

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
  Clear-Host
  Write-Host ("-" * $WIDTH)
  foreach($i in $arr){
    $tmp = ("{0,3}" -f $i)
      Write-Host -NoNewLine [$tmp]
      Write-Host ("#" * $i)
  }
  Write-Host ("-" * $WIDTH)
}

# main
printArr -arr $arrInt

$len = $arrInt.Length
$key = 0
for( $i = 1; $i -lt $len; $i += 1 ){
  $key = $arrInt[$i]
  $j = $i - 1
  while( ( $j -ge 0 ) -and ( $arrInt[$j] -gt $key ) ){
    $arrInt[$j + 1] = $arrInt[$j]
    $j = $j - 1
  }
  $arrInt[$j + 1] = $key

  printArr -arr $arrInt
  Start-Sleep -Milliseconds 100
}

# End of file
