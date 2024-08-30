ENVIRONMENT := test.env

include $(ENVIRONMENT)
export


help:
	@echo "\n#### $(ALKIS_PG_IMAGE):$(ALKIS_PG_TAG) ####\n"
	@echo "Available targets:\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "\n"

build: ## Build the docker image
	@docker build -t $(ALKIS_PG_IMAGE):$(ALKIS_PG_TAG) .

run: ## Run the docker-compose service
	@docker-compose up -d $(ALKIS_PG_IMAGE)

stop: ## Stop the docker-compose service
	@docker-compose stop $(ALKIS_PG_IMAGE)

shell: ## Start a shell in the running container
	@docker exec -it $(ALKIS_PG_IMAGE) bash

clean: ## Remove running containers, images, volumes and networks
	@docker-compose down -v --remove-orphans
	@docker rmi $(ALKIS_PG_IMAGE):$(ALKIS_PG_TAG)

.PHONY: help build run stop shell clean