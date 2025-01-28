from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from fastapi import FastAPI, HTTPException
from dotenv import load_dotenv
from typing import Optional
import pymysql
import ssl
import os

load_dotenv()

app = FastAPI()

# app.mount("/public", StaticFiles(directory="public"), name="static")

DB_CONFIG = {
    "host": os.getenv("DB_SERVER"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASS"),
    "database": os.getenv("DB_NAME"),
    "port": int(os.getenv("DB_PORT")),
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
        ssl_ca="./ca.pem"
)

# @app.get("/")
# def read_root():
#     return FileResponse("./public/index.html")

@app.get("/status/")
def read_root():
    return {"status": "API 200"}

@app.get("/last_change/")
def get_last_change():
    try:
        conn = get_db_connection()
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM last_change")
            result = cursor.fetchall()
        conn.close()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/table_physical/")
def get_table_scoring(id: Optional[int] = None, age_group: Optional[int] = None, gender: Optional[str] = None,
                      exercise_number: Optional[int] = None, exercise_name: Optional[str] = None):
    try:
        conn = get_db_connection()
        with conn.cursor() as cursor:
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

            cursor.execute(query, params)
            result = cursor.fetchall()
        conn.close()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/table_standarts/")
def get_table_standarts(
    id: int = None,
    category: int = None,
    age_group: int = None,
    score: int = None,
    rating_5: str = None,
    rating_4: str = None,
    rating_3: str = None
):
    query = "SELECT * FROM table_standarts WHERE 1"
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

    try:
        conn = get_db_connection()
        with conn.cursor() as cursor:
            cursor.execute(query, params)
            result = cursor.fetchall()
        conn.close()
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/table_scoring/")
def get_table_scoring(gender: str, exercise_num: int, result: float):
    if gender == 'man':
        column_name = f"exercise_man_{exercise_num}"
    elif gender == 'woman':
        column_name = f"exercise_woman_{exercise_num}"
    else:
        raise HTTPException(status_code=400, detail="Invalid gender specified")

    query = f"""
        SELECT score_count
        FROM table_scoring
        WHERE {column_name} BETWEEN %s AND %s
    """
    params = [result - 0.01, result + 0.01]

    try:
        conn = get_db_connection()
        with conn.cursor() as cursor:
            cursor.execute(query, params)
            result = cursor.fetchall()
        conn.close()

        if not result:
            return {"message": "No data found matching your criteria"}

        return result

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
