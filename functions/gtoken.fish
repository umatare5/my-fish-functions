function gtoken --wraps='sqlite3 ~/.config/gcloud/access_tokens.db="SELECT token_expiry,account_id FROM access_tokens;"' --wraps=sqlite3\ \~/.config/gcloud/access_tokens.db\ \'SELECT\ token_expiry,account_id\ FROM\ access_tokens\;\' --description alias\ gtoken=sqlite3\ \~/.config/gcloud/access_tokens.db\ \'SELECT\ token_expiry,account_id\ FROM\ access_tokens\;\'
    sqlite3 ~/.config/gcloud/access_tokens.db 'SELECT token_expiry,account_id FROM access_tokens;' $argv
end
