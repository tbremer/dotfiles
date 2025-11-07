function docker-dead 
	# stop all containers
	docker stop (docker ps -a -q)

	# remove all containers
	docker rm (docker ps -a -q)

	# remove all images
	docker rmi (docker images -a -q)

	# Remove all volumes
	docker volume rm (docker volume ls -f dangling=true -q)
end