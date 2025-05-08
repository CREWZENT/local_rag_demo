# Private GPT with Ollama

This project sets up a local RAG (Retrieval-Augmented Generation) system using Private GPT with Ollama for the LLM and embeddings.

## Setup with Docker Compose

1. Make sure you have Docker and Docker Compose installed on your system.

2. Create necessary directories:
   ```bash
   mkdir -p data models
   ```

3. Build and start the containers:
   ```bash
   docker-compose up -d --build
   ```

4. Pull the llama2 model (first time only):
   ```bash
   docker-compose exec ollama ollama pull llama2
   ```

The server will start at `http://localhost:8001`

## API Endpoints

Private GPT provides several endpoints:

### Ingest Documents
- **POST** `/api/v1/ingest/file`
- Upload a file to be processed and added to the vector store
- Use form-data with key "file"

### Query
- **POST** `/api/v1/chat/completions`
- Ask questions about the uploaded documents
- Example request body:
  ```json
  {
    "messages": [
      {
        "role": "user",
        "content": "What is the main topic of the document?"
      }
    ]
  }
  ```

### List Documents
- **GET** `/api/v1/documents`
- List all ingested documents

## Example Usage

1. Upload a document:
   ```bash
   curl -X POST -F "file=@your_document.pdf" http://localhost:8001/api/v1/ingest/file
   ```

2. Query the system:
   ```bash
   curl -X POST http://localhost:8001/api/v1/chat/completions \
     -H "Content-Type: application/json" \
     -d '{"messages":[{"role":"user","content":"What is the main topic of the document?"}]}'
   ```

3. List documents:
   ```bash
   curl http://localhost:8001/api/v1/documents
   ``` 