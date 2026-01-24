#use a lighweight python image 
FROM python:3.11-slim

#set working directory inside container
WORKDIR /app

#copy dependency file first (for caching)
COPY requirements.txt .

#Installs dependencies
RUN pip install --no-cache-dir -r requirements.txt
# here i think that command should be COPY app/. Because the app.py is inside the app folder
#to build image in container we use docker build -t filename-flask

#Copy application code
COPY app/ .       

#Expose applicaiton Port
EXPOSE 5000

#This run the application
CMD ["python", "app.py"]
