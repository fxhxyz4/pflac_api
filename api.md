## API Documentation - v2

### GET ```/status/```
#### Return server status

#

### GET ```/last_change/```

#### Retrieve all records from the last_change table.

#

### GET ```/table_physical/```

#### Retrieve data from the table_physical table with optional filters.
#### Query Parameters:
```sql
    id (int, optional): Filter by id.
    age_group (int, optional): Filter by age_group.
    gender (str, optional): Filter by gender (e.g., man, woman).
    exercise_number (int, optional): Filter by exercise_number.
    exercise_name (str, optional): Filter by exercise_name.
```
### Example Request:

### GET ```/table_physical/```
### GET ```/table_physical/?id=1```
### GET ```/table_physical/?age_group=40```
### GET ```/table_physical/?gender=man```
### GET ```/table_physical/?exercise_number=14```
### GET ```/table_physical/?exercise_name=Підтягування на перекладині```
### GET ```/table_physical/?id=1&?age_group=40&?gender=man&?exercise_number=14&?exercise_name=Підтягування на перекладині```

#

### GET ```/table_scoring/```

#### Retrieve data from the table_scoring table with optional filters.
#### Query Parameters:
```sql
    id (int, optional): Filter by score_count.
    exercise_number (int, required): Filter by the exercise number. Requires the gender parameter.
    gender (str, required): Filter by gender (man or woman). Requires the exercise_number parameter.
    result (float, required): Filter by result. Requires the exercise_number & gender  parameter.
```
### Example Request:
### _gender & exercise_num & result is a required params_
### GET ```/table_scoring/?gender=man&exercise_num=25&result=13.85```

#

### GET ```/table_standarts/```

#### Retrieve data from the table_standarts table with optional filters.
#### Query Parameters:
```sql
    id (int, optional): Filter by id.
    category (int, optional): Filter by category.
    age_group (int, optional): Filter by age_group.
    score (int, optional): Filter by score.
```
### Example Request:

### GET ```/table_standarts/?id=1```
### GET ```/table_standarts/?category=2```
### GET ```/table_standarts/?age_group=25```
### GET ```/table_standarts/?score=85```
### GET ```/table_standarts/?id=1&?category=2&?age_group=25&?score=85```
