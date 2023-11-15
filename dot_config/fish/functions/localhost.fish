function localhost --description 'open localhost:<port> in browser'
    open http://localhost:"$argv[1]"
end
