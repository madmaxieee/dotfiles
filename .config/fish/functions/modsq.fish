function modsq -d "Run a command with the openai API key set" --wraps mods
    set -x OPENAI_API_KEY (op item get openai_api_key --fields credential)
    mods $argv
end
