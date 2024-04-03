function aichat -d "Run a command with the openai API key set" --wraps aichat
    set -x OPENAI_API_KEY (op item get openai_api_key --fields credential)
    set aichat (which aichat)
    "$aichat" $argv
end
