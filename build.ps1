# Builds the website: wraps src\physics-bench.html into a complete web page at index.html (the file GitHub Pages serves)
# Run from this folder:  powershell -ExecutionPolicy Bypass -File build.ps1
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$src  = [System.IO.File]::ReadAllText("$here\src\physics-bench.html")
$head = @'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="description" content="Visualizing the Physics: interactive simulations for Physics I, Physics II and everyday technology.">
<style>
  :root{color-scheme:light; padding-top:env(safe-area-inset-top,0px); padding-bottom:env(safe-area-inset-bottom,0px)}
  body{margin:0}
  img{max-width:100%}
  [hidden]{display:none!important}
</style>
'@
# the page's own <title>, font links and <style> sit at the top of the source and belong in <head>
$split = $src.IndexOf('<div class="wrap">')
$out = $head + $src.Substring(0, $split) + "`n</head>`n<body>`n" + $src.Substring($split) + "`n</body>`n</html>`n"
[System.IO.File]::WriteAllText("$here\index.html", $out, (New-Object System.Text.UTF8Encoding $false))
Write-Output "Built index.html ($([math]::Round($out.Length/1KB)) KB)"
