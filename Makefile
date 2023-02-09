setup:
	@docker build . -t spx

up: detach =
up:
	@docker run --rm $(if $(detach),-d,) -p 1234:80 --name spx \
		spx
