docker-build:
	docker-compose build

copy-data:
	docker cp ./app data.${BRANCH_NAME}.localhost:/

composer:
	docker-compose run composer install

phpcs-ci:
	docker-compose run php /app/vendor/squizlabs/php_codesniffer/scripts/phpcs --report=checkstyle --report-file=/app/build/checkstyle.xml --standard=PSR2 --extensions=php /app/src/

phpcs:
	docker-compose run php /app/vendor/squizlabs/php_codesniffer/scripts/phpcs --standard=PSR2 --extensions=php /app/src/

copy-data-from-docker:
	docker cp data.${BRANCH_NAME}.localhost:/ ./app
