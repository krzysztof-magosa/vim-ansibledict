# Vim Ansible Dict
Simple Vim plugin including dictionary with all options from Ansible, to be used as primitive completion mechanism.

# Installation
If you are [Vim Plug](https://github.com/junegunn/vim-plug) user, use below snippet to get plugin installed.   
Otherwise consult manual of your plugin manager to see how to install plugins.
```
Plug 'krzysztof-magosa/vim-ansibledict'
```

# Available commands
Load dictionary for specific version:
```
LoadAnsibleDict <version> " e.g. stable-2.8
```

Load default dictionary (i.e. newest supported version)
```
LoadDefaultAnsibleDict
```

# Usage
There is no simple and reliable way to detect whether specific YAML is Ansible file.
Ansible has no dedicated file extensions and directory structure differs from company to company.
I leave implementation of detection to you, below snippet may be used as an example.

```
" What sits in 'ansible' belongs to Ansible
au BufRead,BufNewFile */ansible/*.yml LoadDefaultAnsibleDict
```

Now you can complete Ansible keywords by <kbd>Ctrl+X</kbd> <kbd>Ctrl+K</kbd>.  
To have keywords available in <kbd>Ctrl+N</kbd>/<kbd>Ctrl+P</kbd> you need to enable it explicitly:
```
set complete+=k
```

# Supported Ansible versions
Consult [dicts](dicts) directory to see available versions.  
Do not specify `.txt` extension.
