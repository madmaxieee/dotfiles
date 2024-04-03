function chatgpt -d "Run a command with the openai API key set" --wraps aichat
    set -x OPENAI_API_KEY (pass openai/aichat)
    aichat $argv
end
