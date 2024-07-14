function devbox
  if set -q argv[1]
    and [ "$argv[1]" = "services" ]
    echo devbox "'"{$argv}"'" | bash
  else
    command devbox $argv
  end
end
