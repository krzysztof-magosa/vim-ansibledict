if exists('g:loaded_ansible_dict')
  finish
endif
let g:loaded_ansible_dict = 1

command! -nargs=1 LoadAnsibleDict call ansibledict#load(<q-args>)
command! -nargs=0 LoadDefaultAnsibleDict call ansibledict#load("stable-2.10")
