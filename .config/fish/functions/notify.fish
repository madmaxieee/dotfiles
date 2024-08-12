function notify -d "send a notification to the desktop"
    argparse --name=notify h/help 'm/message=' 't/title=?' -- "$argv"
    or return
    if set -q _flag_help
        echo "Usage: notify [-h] [-m message] [-t title]"
        return
    end
    set message (string trim -c "\' " "$_flag_message")
    set message (string escape "$message")
    if not set -q _flag_title
        set _flag_title Notification
    else
        set title (string trim "\' " "$_flag_title")
        set title (string escape "$title")
    end
    osascript -e "display notification \"$message\" with title \"$_flag_title\""
end
