function chatgpt -d "Run a command with the openai API key set" --wraps aichat
    set -x OPENAI_API_KEY (op item get openai_api_key --fields credential)
    command aichat $argv
end
