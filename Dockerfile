FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
RUN addgroup --system app && adduser --system --ingroup app app
RUN mkdir -p //SEAN-CLOUD/Quartermaster && chown -R app:app //SEAN-CLOUD/Quartermaster
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY quartermaster.py .
USER app
VOLUME ["//SEAN-CLOUD/Quartermaster"]
CMD ["python","-u","quartermaster.py"]
