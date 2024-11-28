from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import OperationalError

# Correct the DATABASE_URL with URL encoded password
DATABASE_URL = "postgresql://postgres:Divyansh%406@db:5432/postgres"  # Correct URL encoding for special characters

# Create the database engine
engine = create_engine(DATABASE_URL)

# Create a configured "Session" class
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Base class for model classes
Base = declarative_base()

# Function to test the database connection
def test_db_connection():
    try:
        # Test the connection
        with engine.connect() as connection:
            print("Connection to the database is successful!")
    except OperationalError as e:
        print(f"Failed to connect to the database: {e}")

# Call the test function to check if the connection works
test_db_connection()
