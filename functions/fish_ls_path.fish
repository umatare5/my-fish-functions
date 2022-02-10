function fish_ls_path --wraps=echo\ \$fish_user_paths\ \|\ tr\ \"\ \"\ \"\\n\"\ \|\ nl --description alias\ fish_ls_path=echo\ \$fish_user_paths\ \|\ tr\ \"\ \"\ \"\\n\"\ \|\ nl
  echo $fish_user_paths | tr " " "\n" | nl $argv; 
end
