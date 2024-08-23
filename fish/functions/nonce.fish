function nonce 
	node -e "console.log((Math.random() * Date.now()).toString(16).split('.')[0])"
end