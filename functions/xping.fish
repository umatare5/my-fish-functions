function xping --description alias\ xping=ping\ argv\ \|\ xargs\ -I\ \{\}\ date\ +\'\%Y/\%m/\%d\ \%T\>\ \{\}\'
 command ping $argv | xargs -I {} date +'%Y/%m/%d %T> {}';
end
