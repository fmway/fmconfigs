function excuse
if [ (count $argv) -lt 2 ] && [ $argv[1] != 'me,' ]
return 1
end
command doas $argv[2..-1]
end
