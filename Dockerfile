# 1. Imagen base: Python 3.12 en su versión liviana 

FROM python:3.12-slim 

# 2. Carpeta de trabajo dentro del contenedor 

WORKDIR /app 

# 3. Copiamos primero las dependencias (aprovecha la cache de Docker) 

COPY requirements.txt . 

RUN pip install --no-cache-dir -r requirements.txt 

# 4. Copiamos el resto del código fuente 

COPY . . 

# 5. Variable de entorno que le dice a Flask cuál es el archivo principal 

ENV FLASK_APP=app.py 

# 6. Puerto que usa la aplicación 

EXPOSE 5000 

# 7. Comando de arranque: escucha en todas las interfaces, no solo localhost 

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"] 