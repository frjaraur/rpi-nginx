build:
	docker build -t frjaraur/rpi-nginx .

run:
	@make clean >/dev/null
	@docker run -d -v $(PWD)/html:/html -P --name rpi-nginx frjaraur/rpi-nginx >/dev/null
	@docker port rpi-nginx

clean:
	@docker rm -fv rpi-nginx 2>/dev/null || true 
