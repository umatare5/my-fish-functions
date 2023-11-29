function rnd --wraps=head\ /dev/urandom\ \|\ env\ LC_ALL=C\ tr\ -dc\ \"A-Za-z0-9_!@\#^\&\*\\-^\%+=\"\ \|\ fold\ -w\ 24\ \|\ head\ -n --wraps=head\ /dev/urandom\ \|\ env\ LC_ALL=C\ tr\ -dc\ \"A-Za-z0-9_!@\#^\&\*\\-^\%+=\"\ \|\ fold\ -w\ 24\ \|\ head\ -n\ 5 --description alias\ rnd=head\ /dev/urandom\ \|\ env\ LC_ALL=C\ tr\ -dc\ \"A-Za-z0-9_!@\#^\&\*\\-^\%+=\"\ \|\ fold\ -w\ 24\ \|\ head\ -n\ 5
    head /dev/urandom | env LC_ALL=C tr -dc "A-Za-z0-9_!@#^&*\-^%+=" | fold -w 24 | head -n 1 $argv
end
