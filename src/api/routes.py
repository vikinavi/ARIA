from fastapi import APIRouter
from src.agents.agent_core import create_ai_agent
from src.memory.short_term import ShortTermMemory
router = APIRouter()
agent = create_ai_agent()
memory = ShortTermMemory()

@router.post("/ask")
def ask_agent(query: str):
    memory.add_message("user", query)
    response = agent.run(query)
    memory.add_message("agent", response)
    return {"response": response, "memory": memory.get_context()}
