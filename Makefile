build:
	docker compose build
rebuild:
	docker compose up -d --build
up:
	docker compose up -d
down:
	docker compose down
destroy:
	docker compose down --rmi all --volumes --remove-orphans
logs:
	docker compose logs -f
ls:
	docker compose ls

############################################
# コンテナに入るコマンド
############################################
blog:
	docker compose exec blog bash
terraform:
	docker compose exec terraform bash

############################################
# 各コンテナのログ
############################################
blog-logs:
	docker compose logs -f blog
terraform-logs:
	docker compose logs -f terraform

############################################
# terraformコマンド
############################################
%-init:
	docker compose exec terraform terraform -chdir=./environments/$* init -backend-config="backend.hcl"
%-plan:
	docker compose exec terraform terraform -chdir=./environments/$* plan
%-apply:
	docker compose exec terraform terraform -chdir=./environments/$* apply
%-refresh:
	docker compose exec terraform terraform -chdir=./environments/$* refresh
%-destroy:
	docker compose exec terraform terraform -chdir=./environments/$* destroy