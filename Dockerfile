# Name of the file always has to be Dockerfile

# This basic docker image has python 3.9 and a skeleton linux OS
FROM python:3.9-slim

# Name of the directory where the app will be stored
WORKDIR /docker_streamlit_proj1

COPY artefacts/requirements.txt .

RUN pip3 install -r requirements.txt

# Copy everything from current directory to the directory in the container
COPY . /docker_streamlit_proj1/

# python -m flask --app app.py run --host=0.0.0.0 --port=8000
# streamlit run app.py --server.port=8501 --server.address=0.0.0.0
EXPOSE 8501

# CMD ["python", "-m", "flask", "--app", "app.py", "run", "--host=0.0.0.0", "--port=8000"]
# CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]