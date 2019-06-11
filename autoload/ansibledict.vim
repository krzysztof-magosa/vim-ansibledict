let s:dicts_path = expand('<sfile>:p:h:h') . "/dicts"

function! ansibledict#load(version)
  let &l:dictionary.="," . s:dicts_path . "/" . a:version . ".txt"
endfunction
