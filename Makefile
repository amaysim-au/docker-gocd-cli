test:
	docker compose -f docker-compose.test.yml run --rm --build sut
.PHONY: test
