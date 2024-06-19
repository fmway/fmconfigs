function add-direnv-flake
set -q argv[1] || return 1
for i in $argv
echo 'use flake "github:the-nix-way/dev-templates?dir='$i'"' | tee --append .envrc
end
end
