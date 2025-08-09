from sqlalchemy import create_engine
from src.config.settings import settings
engine = create_engine(settings.DB_URL)
def get_connection():
    return engine.connect()
