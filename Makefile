include .env

.PHONY: build-paper
build-paper:
	$(foreach version, $(PAPER_BUILD_VERSIONS), ./build-paper.sh $(version))

.PHONY: build-velocity
build-velocity:
	$(foreach version, $(VELOCITY_BUILD_VERSIONS), ./build-velocity.sh $(version))

.PHONY: build
build: build-paper build-velocity

.PHONY: start
start:
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose down --remove-orphans

.PHONY: restart
restart: stop start

.PHONY: logs
logs:
	@docker-compose logs
