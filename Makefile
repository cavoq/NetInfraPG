ENVIRONMENT := dev.env

include $(ENVIRONMENT)
export


help:
	@echo "\n#### $(IMAGE):$(TAG) ####\n"
	@echo "Available targets:\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "\n"

build: ## Build the docker image
	@docker build -t $(IMAGE):$(TAG) .

run: ## Run the docker-compose service
	@docker-compose up -d $(IMAGE)

stop: ## Stop the docker-compose service
	@docker-compose stop $(IMAGE)

shell: ## Start a shell in the running container
	@docker exec -it $(IMAGE) bash

clean: ## Remove running containers, images, volumes and networks
	@docker-compose down -v --remove-orphans
	@docker rmi $(IMAGE):$(TAG)

init-db: ## Initialize the database
	@docker-compose exec -T $(IMAGE) bash /netinfra_pg/scripts/init_db.sh

drop-db: ## Drop the database
	@docker-compose exec -T $(IMAGE) bash /netinfra_pg/scripts/drop_db.sh

print-db: ## Print the database
	@docker-compose exec -T $(IMAGE) bash /netinfra_pg/scripts/print_db.sh

check-db: init-db print-db drop-db ## Check by initializing, printing and dropping the database

.PHONY: help build run stop shell clean init-db drop-db print-db test-db
