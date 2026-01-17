function yeetpad
    if test (count $argv) -eq 0
        $BROWSER https://yeetpad.org
    else
        set -l query (string join " " $argv | string escape --style=url)
        echo $query
        $BROWSER "http://yeetpad.org/?q=$query"
    end
end
