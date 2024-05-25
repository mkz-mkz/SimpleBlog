# Pull official base Python Docker image
FROM python:3.10.6

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

RUN mkdir /app/static && mkdir /app/media

COPY requirements.txt requirements.txt
# Install dependencies FIXME
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the Django projectcode/
COPY mysite .

EXPOSE 8000

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]
