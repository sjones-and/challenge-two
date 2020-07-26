$maxLen = 32
$words = ((Get-Content "./input.txt") -replace "\s+", " ").Replace("-", "- ").Split(" ", [StringSplitOptions]::RemoveEmptyEntries) | %{$_ -replace '([^-])$', '$1 '}
$line = [string]::Empty
$output = @()

foreach($word in $words) {
  if(($line.Length + $word.Length) -gt $maxLen) {
    $output += $line
    $line = [string]::Empty
  }

  $line+=$word
}

$output += $line

$output

($output | ?{$_.Length -eq 32}).Length
