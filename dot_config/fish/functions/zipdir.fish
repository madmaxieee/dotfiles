function zipdir --description "zip current working directory"
    zip -r ../(basename (pwd)).zip . -x ".*" -x __MACOSX
end
