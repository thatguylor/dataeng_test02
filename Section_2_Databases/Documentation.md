postgres password = somePassword
name = govtech-dataeng-section2
psql -h localhost -p 5432 -U postgres -W 

docker start govtech-dataeng-section2
docker ps -a
docker exec -it 4a16dc022499 bash 
docker exec -it c1c42adfce68 bash 
psql -h localhost -p 5432 -U postgres -W 
enter PW: somePassword
-- In Bash Terminal -- 
$ \c test
$ enter PW:somePassword

-- In Postgres --
test=#\i /sql/sql-commands.sql 

--Docker Build/Run--
Exported Docker Container, So make sure you use docker import [filepath]

//TODO Export nicely to docker 

docker pull thatguylor/postgres:latest
Give ppt some mappings 

Step 1: docker pull thatguylor/govtech:section2
Step 2: docker run --name ChangeAsYouLike -p 5432:5432 -e POSTGRES_PASSWORD=somePassword -d thatguylor/govtech:section2
Step 3: docker ps -a #Verify the container is running and take note of the container id 
Step 4: docker cp 'path/to/sql-commands.sql' <container id>:/
Step 5: docker exec -it <container id> bash 
Step 6: $psql -h localhost -p 5432 -U postgres -W 
Step 7: postgres=#\i /sql-commands.sql 