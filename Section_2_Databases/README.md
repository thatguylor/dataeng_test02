
# Section 2 Documentation - Databases
- PPT of DB Schema is in this directory
- SQL execution of DDL is in this directory 
- Dockerfile is in this directory
- Please contact me at chanyaokuan@gmail.com if you are having trouble building the container following these steps.

# How to Build? - Very Impt (Two Ways)
    1. Pull from docker hub 
        1. Step 1: docker pull thatguylor/govtech:section2 
        2. Step 2: docker run --name ChangeAsYouLike -p 5432:5432 -e POSTGRES_PASSWORD=somePassword -d thatguylor/govtech:section2
        3. Step 3: docker ps -a #Verify the container is running and take note of the container id#
        4. Step 4: docker cp 'path/to/sql-commands.sql' <container id>:/ 
        5. Step 5: docker exec -it <container id> bash 
        6. Step 6: $psql -h localhost -p 5432 -U postgres -W ## In Bash Shell ## 
        7. Step 7: postgres=#\i /sql-commands.sql ## In Postgres CLI ## 
        8. If all goes well, you will see the two SQL Queries generated in your terminal. (Refer to PPT slide deck for executing of SQL Queries 1 and 2)
        9. You can generate your own SQL queries from CLI as well. 

    2. Build from Dockerfile **(Do Not Recommend)**
        1. Build container from dockerfile 
        2. This method has led to known errors, do not recommend this installation of docker image 