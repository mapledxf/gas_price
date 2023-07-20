FROM python:3.9-slim-buster

ENV ETH_RPC_URL https://mainnet.infura.io/v3/060bf6931f5147558bb0e88a76270762

EXPOSE 8000
WORKDIR /opt

RUN apt-get update \
    && apt-get install -y git build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mapledxf/gas_price.git \ 
    && cd gas_price \
    && pip install -r requirements.txt

CMD ["gas_price/gasprice.py", "-h0.0.0.0", "-p 8000"]
ENTRYPOINT ["python"]

