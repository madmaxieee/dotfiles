function modsq -d "Run a command with the openai API key set" --wraps mods
    set -x OPENAI_API_KEY (pass openai/mods)
    mods $argv
end
