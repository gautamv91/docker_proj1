# Name of the file always has to be Dockerfile

# This basic docker image has python 3.9 and a skeleton linux OS
# FROM python:3.9-slim

# Name of the directory where the app will be stored
# WORKDIR /docker_streamlit_proj1

# COPY artefacts/requirements.txt .

# RUN pip3 install -r requirements.txt

# Copy everything from current directory to the directory in the container
# COPY . /docker_streamlit_proj1/

# python -m flask --app app.py run --host=0.0.0.0 --port=8000
# streamlit run app.py --server.port=8501 --server.address=0.0.0.0
# EXPOSE 8501

# CMD ["python", "-m", "flask", "--app", "app.py", "run", "--host=0.0.0.0", "--port=8000"]
# CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
# ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]

FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# RUN git clone https://github.com/streamlit/streamlit-example.git .
RUN git clone https://github.com/gautamv91/docker_proj1.git .

RUN pip3 install -r .artefacts/requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]