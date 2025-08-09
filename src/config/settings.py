import os
from dotenv import load_dotenv
load_dotenv()
class Settings:
    OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
    HF_API_KEY = os.getenv("HF_API_KEY")
    DB_URL = os.getenv("DB_URL")
    PINECONE_API_KEY = os.getenv("PINECONE_API_KEY")
    PINECONE_ENV = os.getenv("PINECONE_ENV")
settings = Settings()
