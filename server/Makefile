postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:alpine

redis:
	docker run --name redis -d -p 6379:6379 redis:alpine redis-server --save 60 1
	
createdb:
	docker exec -it postgres createdb --username=root --owner=root vision_director

dropdb:
	docker exec -it postgres dropdb vision_director

recreate:
	make dropdb && make createdb

# Used for hosting on a Raspberry Pi
publish:
	dotnet publish -r linux-arm --self-contained true