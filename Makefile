docker-build:
	docker-compose build

copy-data:
	docker cp ./app data.${BRANCH_NAME}.localhost:/

composer:
	docker-compose run composer install

phpcs-ci:
	docker-compose run php /app/vendor/bin/phpcs --report=checkstyle --report-file=/app/build/logs/phpcs.xml --standard=PSR2 --extensions=php /app/src/

phpcs:
	docker-compose run php /app/vendor/bin/phpcs --standard=PSR2 --extensions=php /app/src/

phpmd-ci:
	docker-compose run composer vendor/bin/phpmd /app/src xml cleancode,codesize,unusedcode,naming --reportfile /app/build/logs/pmd.xml

copy-build-data:
	docker cp data.${BRANCH_NAME}.localhost:/app/build ./app/
