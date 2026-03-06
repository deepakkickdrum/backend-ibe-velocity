IBE VELOCITY BACKEND

# Local Setup

use

```
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

with the .env file placed in root

```
DB_URL=jdbc:postgresql://localhost:5432/{db_name}
DB_USERNAME={db_username}
DB_PASSWORD={db_password}
```

springboot4-dotenv resolves the env vars to the shell, and we can then use them from application.properties
`-Dspring-boot.run.profiles=dev` is required in order to mention the profile

use `docker compose up` to run a local postgresql server if needed
