function stars
  nix shell nixpkgs#{curl,jq,bash} -c bash (echo "curl -fSsL https://api.github.com/users/$argv[1]/starred | jq '.[] | { owner: .owner.login, repo: .name, description: .description, language: .language, stargazers: .stargazers_count, watchers: .watchers_count }'" | psub)
end
