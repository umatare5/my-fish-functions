function atoken --wraps=jq\ -r\ \'.region\ +\ \'\|\'\ +\ .expiresAt\'\ /\(ls\ -rt\ \|\ tail\ -n\ 1\) --wraps=jq\ -r\ \'.region\ +\ \"\|\"\ +\ .expiresAt\'\ /\(ls\ -rt\ \ \|\ tail\ -n\ 1\) --description alias\ atoken=jq\ -r\ \'.region\ +\ \"\|\"\ +\ .expiresAt\'\ /\(ls\ -rt\ \ \|\ tail\ -n\ 1\)
  set AWS_CACHE_DIR ~/.aws/sso/cache
  jq -r '.region + "|" + .expiresAt' /(ls -rt | tail -n 1) $argv;
end
