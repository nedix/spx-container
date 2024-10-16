setup:
	@docker build --progress=plain -f Containerfile -t spx .

up:
	@docker run --rm -p 8080:80 --name spx -d \
		spx
