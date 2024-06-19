if status is-interactive
  set fish_greeting # Disable greeting
  starship init fish | source
  printf '\e[5 q'
end

