function nonce
    node -e "console.log((Math.random() * Date.now()).toString(36).replace('.',''))"
end
