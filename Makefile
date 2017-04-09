composer:
	docker-compose run composer install

phpcs-ci:
	docker-compose run php /app/vendor/squizlabs/php_codesniffer/scripts/phpcs --report=checkstyle --report-file=/app/build/checkstyle.xml /app/src/


