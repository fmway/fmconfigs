function generate-completion
argparse 's/save' -- $argv
for cli in $argv
if set res "$($ARGC_COMPLETIONS_ROOT/scripts/generate.sh $cli)"
if set -q _flag_s
echo $res | tee $ARGC_COMPLETIONS_ROOT/completions/"$cli.sh"
argc --argc-completions fish $cli | tee $HOME/.config/fish/completions/"$cli.fish" &>/dev/null
else
echo $res
end
end
end
end
