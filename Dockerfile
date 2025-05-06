FROM zylonai/private-gpt:0.6.2-ollama

USER root

# Install PyTorch CPU version
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Switch back to the worker user
USER worker 