PROJECT_DIR=$(shell pwd)
APP_NAME=alincc/docker-volume-backup
JAR_FILE=./target/$(shell ls -a target/*.jar | xargs -n 1 basename)

image:
	@echo $(JAR_FILE)

	## Build the container
	@docker build \
		--build-arg JAR_FILE=$(JAR_FILE) \
		-t $(APP_NAME) \
		-f Dockerfile \
		.

publish:
	# Push
	@docker push $(APP_NAME)
