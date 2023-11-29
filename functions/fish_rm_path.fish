function fish_rm_path --wraps='set --erase --universal fish_user_paths[$argv]' --wraps='set --erase --universal fish_user_paths[$argv] && fish_ls_path' --wraps='set --erase --universal fish_user_paths' --description 'alias fish_rm_path=set --erase --universal fish_user_paths[$argv]'
    set --erase --universal fish_user_paths[$argv] $argv
end
