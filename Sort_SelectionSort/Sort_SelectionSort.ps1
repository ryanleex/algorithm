# -- Sort_SelectionSort.ps1

# Initial
$WIDTH = $Host.UI.RawUI.WindowSize.Width
$MAX_SIZE = 40
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
$min_idx = 0
for( $i = 0; $i -lt $len - 1; $i += 1 ){
  $min_idx = $i
  for( $j = $i + 1; $j -lt $len; $j += 1 ){
    if( $arrInt[$j] -lt $arrInt[$min_idx] ){
      $min_idx = $j
    }
  }
  $tmp = $arrInt[$i]
  $arrInt[$i] = $arrInt[$min_idx]
  $arrInt[$min_idx] = $tmp

  printArr -arr $arrInt
  Start-Sleep -Milliseconds 100
}

# End of file
