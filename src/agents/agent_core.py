from langchain.agents import initialize_agent, Tool
from langchain.llms import OpenAI
from src.rag_pipeline.retriever import get_context
from src.config.settings import settings

def create_ai_agent():
    llm = OpenAI(temperature=0, openai_api_key=settings.OPENAI_API_KEY)
    tools = [
        Tool(
            name="RAG Search",
            func=lambda q: get_context(q),
            description="Retrieve relevant documents using RAG"
        )
    ]
    return initialize_agent(tools, llm, agent="zero-shot-react-description", verbose=True)
