# Detect fasd
if type -q fasd
  # Hook into fish preexec event
  function __fasd_run -e fish_preexec
    # disown is an >2.6.0 feature
    switch $FISH_VERSION
      case 2.0.\* 2.1.\* 2.2.\* 2.3.\* 2.4.\* 2.5.\*
        command fasd --proc (command fasd --sanitize "$argv" | tr -s ' ' \n) > "/dev/null" 2>&1 &
      case \*
        command fasd --proc (command fasd --sanitize "$argv" | tr -s ' ' \n) > "/dev/null" 2>&1 &; disown
    end
  end
else
  echo "🍒  Please install 'fasd' first!"
end
