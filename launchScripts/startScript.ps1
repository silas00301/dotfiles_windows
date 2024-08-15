#>-- Config --<

#komorebi.ps1 location
$komo_ps1_loc = "$HOME/komorebi.ps1"
#yasb main.py location
$yasb_main_loc = "$HOME/Applications/yasb/src/main.py"

$Env:GLAMOUR_STYLE = ".config/glamour/mocha.json"


#>-- Logic --<
komorebic.exe start -a
pwsh $komo_ps1_loc
Start-Process whkd -WindowStyle hidden
Start-Process python -ArgumentList $yasb_main_loc -WindowStyle hidden
