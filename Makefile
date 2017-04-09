docker-build:
	docker-compose build

copy-data:
	docker cp app data.${BRANCH_NAME}.localhost:/app

composer:
	docker-compose run composer install

phpcs-ci:
	docker-compose run php /app/vendor/squizlabs/php_codesniffer/scripts/phpcs --report=checkstyle --report-file=/app/build/checkstyle.xml /app/src/
