.PHONY: start start-debug stop clean test help

# $SUDO is an optional shell variable which can be set to "sudo" if needed
# (for example, on an ec2 instance)

help:
	@echo "help 		--- Show this list."
	@echo "start 		--- Run 'docker-compose up --build -d'."
	@echo "start-debug 	--- Run 'docker-compose --log-level DEBUG --verbose up --build -d'."
	@echo "stop 		--- Run 'docker-compose kill/rm/prune'."
	@echo "clean 		--- Remove all docker files and history."
	@echo "test 		--- Run 'npm run headless'."

start:
	@echo "--- Running 'docker-compose up --build -d'..."
	GIT_HASH=`git log --pretty="%h" -n 1` ${SUDO} docker-compose up --build -d

start-debug:
	@echo "--- Running 'docker-compose --log-level DEBUG --verbose up --build -d'..."
	GIT_HASH=`git log --pretty="%h" -n 1` ${SUDO} docker-compose --log-level DEBUG --verbose up --build -d

stop:
	@echo "--- Running 'docker-compose kill/rm/prune'..."
	${SUDO} docker-compose kill
	${SUDO} docker-compose rm -f
	${SUDO} docker system prune --volumes -f

clean:
	@echo "--- Copy and past the following commands..."
	@echo 'docker rm -f $$(docker ps -aq)'
	@echo 'docker rmi -f $$(docker images -q)'
	@echo 'docker system prune --volumes -f'
	@echo 'echo done'

test:
	# change to 'npm run test' after merge with master
	@echo "--- Running 'npm run headless'"
	cd e2e; npm run headless

