$Env:GLAMOUR_STYLE = "$HOME/.config/glamour/mocha.json"

New-Item -Path $HOME\.config\glamour\mocha.json -ItemType HardLink -Value $PWD\..\glamour\mocha.json
