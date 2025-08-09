from fastapi import FastAPI
from src.api.routes import router
app = FastAPI(title="AI Agent with RAG & Memory")
app.include_router(router)
