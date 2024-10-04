FROM python:3.9-slim


RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app
COPY skin_disease_model.h5 /app/saved_model/skin_disease_model.h5

COPY templates/ /app/templates/

CMD ["python", "app.py"]
