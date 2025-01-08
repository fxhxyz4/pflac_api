## API Documentation - v1

### GET ```/debug/```

#### Debug endpoint to fetch database configuration details.

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

### GET ```/table_physical/?age_group=40&gender=man```

#

### GET ```/table_scoring/```

#### Retrieve data from the table_scoring table with optional filters.
#### Query Parameters:
```sql
    id (int, optional): Filter by score_count.
    exercise_number (int, optional): Filter by the exercise number. Requires the gender parameter.
    gender (str, optional): Filter by gender (man or woman). Requires the exercise_number parameter.
```
### Example Request:

### GET ```/table_scoring/?id=1```
### GET ```/table_scoring/?exercise_number=20&gender=man```

#

### GET ```/table_standarts/```

#### Retrieve data from the table_standarts table with optional filters.
#### Query Parameters:
```sql
    id (int, optional): Filter by id.
    category (int, optional): Filter by category.
    age_group (int, optional): Filter by age_group.
    score (int, optional): Filter by score.
    rating_5 (str, optional): Filter by rating_5.
    rating_4 (str, optional): Filter by rating_4.
    rating_3 (str, optional): Filter by rating_3.
```
### Example Request:

### GET ```/table_standarts/?category=2&age_group=25```