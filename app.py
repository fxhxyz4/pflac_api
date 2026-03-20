from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi import FastAPI, HTTPException
from dotenv import load_dotenv
from typing import Optional
import pymysql
import os

load_dotenv()

app = FastAPI()

DB_CONFIG = {
    "host": os.getenv("DB_SERVER"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASS"),
    "database": os.getenv("DB_NAME"),
    "port": int(os.getenv("DB_PORT")),
}

VALID_COLUMNS = {
    ("man", 25), ("man", 14), ("man", 20), ("man", 21),
    ("man", 1),  ("man", 2),  ("man", 3),
    ("woman", 20), ("woman", 21),
    ("woman", 1),  ("woman", 2),  ("woman", 3),
}

def get_db_connection():
    return pymysql.connect(
        host=DB_CONFIG["host"],
        user=DB_CONFIG["user"],
        password=DB_CONFIG["password"],
        database=DB_CONFIG["database"],
        port=DB_CONFIG["port"],
        cursorclass=pymysql.cursors.DictCursor,
        charset="utf8mb4",
        ssl_ca=os.path.join(os.path.dirname(__file__), "ca.pem")
    )

@app.get("/status/")
def get_status():
    return {"status": "API 200"}

@app.get("/last_change/")
def get_last_change():
    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM last_change")
            result = cursor.fetchall()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

@app.get("/table_physical/")
def get_table_physical(
    id: Optional[int] = None,
    age_group: Optional[int] = None,
    gender: Optional[str] = None,
    exercise_number: Optional[int] = None,
    exercise_name: Optional[str] = None
):
    query = "SELECT * FROM table_physical WHERE 1=1"
    params = []

    if id is not None:
        query += " AND id = %s"
        params.append(id)
    if age_group is not None:
        query += " AND age_group = %s"
        params.append(age_group)
    if gender is not None:
        query += " AND gender = %s"
        params.append(gender)
    if exercise_number is not None:
        query += " AND exercise_number = %s"
        params.append(exercise_number)
    if exercise_name is not None:
        query += " AND exercise_name = %s"
        params.append(exercise_name)

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute(query, params)
            result = cursor.fetchall()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

@app.get("/table_standarts/")
def get_table_standarts(
    id: Optional[int] = None,
    category: Optional[int] = None,
    age_group: Optional[int] = None,
    score: Optional[int] = None,
):
    query = "SELECT * FROM table_standarts WHERE 1=1"
    params = []

    if id is not None:
        query += " AND id = %s"
        params.append(id)
    if category is not None:
        query += " AND category = %s"
        params.append(category)
    if age_group is not None:
        query += " AND age_group = %s"
        params.append(age_group)
    if score is not None:
        query += " AND score = %s"
        params.append(score)

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute(query, params)
            result = cursor.fetchall()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()

@app.get("/table_scoring/")
def get_table_scoring(gender: str, exercise_num: int, score_result: float):
    if (gender, exercise_num) not in VALID_COLUMNS:
        raise HTTPException(
            status_code=400,
            detail=f"Invalid combination: gender='{gender}', exercise_num={exercise_num}"
        )

    column_name = f"exercise_{gender}_{exercise_num}"
    query = f"SELECT score_count FROM table_scoring WHERE {column_name} BETWEEN %s AND %s"
    params = [score_result - 0.01, score_result + 0.01]

    conn = get_db_connection()
    try:
        with conn.cursor() as cursor:
            cursor.execute(query, params)
            result = cursor.fetchall()
        if not result:
            return {"message": "No data found"}
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        conn.close()