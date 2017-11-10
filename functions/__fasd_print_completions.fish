function __fasd_print_completions
  set cmd (commandline -po)
  set -e cmd[1]
  fasd $argv $cmd -l
end
