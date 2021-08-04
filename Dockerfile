# Build with:
# docker build --tag=concourseopen/ethgasstation-backend .
# Run with:
# docker run -it --rm concourseopen/ethgasstation-backend
# Or for interactive shell:
# docker run -it --rm concourseopen/ethgasstation-backend bash
FROM python:3.6-slim

WORKDIR /app
RUN apt update && apt install --no-install-recommends --yes \
    build-essential
COPY requirements.txt /app
RUN pip install -r requirements.txt
COPY . /app
RUN ln -sfn /app/settings.docker.conf /etc/ethgasstation.conf
CMD python /app/ethgasstation.py
