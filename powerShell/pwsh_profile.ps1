#lvim 

Set-Alias lvim "$Env:USERPROFILE\.local\bin\lvim.ps1"

# eza as ls

Function lsla {
  eza -la 
}
Set-Alias -Name ls -Value lsla


#zoxide as cd

Invoke-Expression (& { (zoxide init powershell --cmd cdd | Out-String) })

#>-- config --<

#fzf colours
$ENV:FZF_DEFAULT_OPTS=@"
--color=bg+:#313244,bg:-1,spinner:#f5e0dc,hl:#f38ba8
--color=fg:-1,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
--border="rounded" --preview-window="border-rounded" --pointer=">" --marker="•"
"@

#fzf colours in zoxide
$ENV:_ZO_FZF_OPTS=@"
--color=bg+:#313244,bg:-1,spinner:#f5e0dc,hl:#f38ba8
--color=fg:-1,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
--border="rounded" --preview-window="border-rounded" --pointer=">" --marker="•"
"@

#venv
Function Open-Env([string]$folder = ".\venv") {

  # Check if the folder exists
  if (Test-Path -PathType Container $folder) {
    # Execute the activate script
    & "$folder\Scripts\activate.ps1"
  } else {
    Write-Host "The folder '$folder' does not exist."
  }
}

Set-Alias -Name venv -Value Open-Env

$global:beforeLoc = "~"

Function GoTo-Env($target) {
  Set-Variable -Name beforeLoc -Value $PWD -Scope Global
  cdd $target
  if(Test-Path -PathType Container ".\venv") {
    Open-Env
  } else {
    if (Test-Path env:VIRTUAL_ENV) {
      deactivate
    }
  }
}

Function Go-Back {
  GoTo-Env $global:beforeLoc
}

Set-Alias -Name cd -Value GoTo-Env -Option AllScope
Set-Alias -Name cdi -Value cddi
Set-Alias -Name b -Value Go-Back
