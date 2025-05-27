setup:
	@docker build --progress=plain -f Containerfile -t spx .

destroy:
	-@docker rm -fv spx

up: HTTP_PORT = "80"
up:
	@docker run --rm -d --name spx \
		-p 127.0.0.1:$(HTTP_PORT):80 \
		spx
	@docker logs -f spx

down:
	-@docker stop spx

shell:
	@docker exec -it spx /bin/sh

test:
	@$(CURDIR)/tests/index.sh
