FROM python:3.13.5-alpine3.22

#Referencia da qual pasta está a aplicação
WORKDIR /app;

#Copia as dependências
COPY requirements.txt .
#Diz ao pip para não guardar arquivos temporários (cache) da instalação
RUN pip install --no-cache-dir -r requirements.txt

#Copia todo o diretório 
COPY . .

#Expõe a porta que irá rodar a aplicação
EXPOSE 8000

#Comando para ser executado no prompt
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
