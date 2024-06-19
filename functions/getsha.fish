function getsha
  for url in $argv
    set fetch "{ fetchurl }:
fetchurl {
  url = \"$url\";
}"
    if string match -rq '^github:(?<owner>[^\s/]+)/(?<repo>[^\s/]+)(?:/(?<rev>.+))?$' -- $url
      set fetch "{ fetchFromGitHub }:
fetchFromGitHub {
  owner = \"$owner\";
  repo = \"$repo\";"
  set -q rev && not [ -z "$rev" ] && set fetch $fetch"
  rev = \"$rev\";"
  set fetch $fetch"
}"
    end
    set -q DEBUG && echo $fetch
    set -q NOTHING || nix-prefetch --option extra-experimental-features flakes $fetch
  end
end
