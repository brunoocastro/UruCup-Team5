ARG := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
$(eval $(ARG):;@true)

build:
	xhost +si:localuser:root &&	docker build . -t urucup/ssl

down: 
	docker-compose down 

up: 
	bash docker/run-grsim.sh $(ARG)

perms:
	sudo chown -hR ${USER}:${USER} .

access:
	docker exec -it $(ARG) bash