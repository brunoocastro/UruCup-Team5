build:
	xhost +si:localuser:root &&	docker build . -t urucup/ssl

openTerminal:
	docker run -it urucup-team5-ros /bin/bash

down: 
	docker-compose down 

up: 
	docker-compose up 

upWithBuild: 
	docker-compose up -d --no-deps --build ros

