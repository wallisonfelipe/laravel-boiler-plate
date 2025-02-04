
# Laravel Boiler Plate para 🇧🇷

Esse projeto tem como objetivo fornecer um ponto de partida para desenvolvimento de novas aplicações Laravel.


## Requisitos

- Docker


## Instalando o projeto

Clone o projeto

```bash
  git clone https://github.com/wallisonfelipe/laravel-boiler-plate.git
```

Entre na pasta
```
cd laravel-boiler-plate
```

Crie um arquivo .env
```
cp .env.example .env
```

Suba o container
```
docker compose up -d --build
```

Gere sua chave de aplicação
```
docker exec -t api php artisan key:generate
```


Rode as migrations
```
docker exec -t api php artisan migrate --seed
```

Gere sua chave JWT
```
docker exec -t api pphp artisan jwt:secret
```

Gere sua chave JWT
```
sudo chmod +x artisan
```

Se deu tudo certo, ao abrir o endereço abaixo, sua aplicação deve ser exibida
```
http://localhost:8000
```

Caso queira rodar todos os comandos de uma vez
```
git clone https://github.com/wallisonfelipe/laravel-boiler-plate.git && \
cd laravel-boiler-plate && cp .env.example .env && \
docker compose up -d --build && \
docker exec -t api php artisan key:generate && \
sleep 2 && \
docker exec -t api php artisan migrate --seed && \
sleep 2 && \
docker exec -t api php artisan jwt:secret && \
sudo chmod +x artisan && \
open "http://localhost:8000"
```



## Tarefas

| Items              | Done?                                                |
| ------------------ | ---------------------------------------------------------------- |
| Docker       |  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ |
| Banco de dados     | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ |
| Setup JWT           | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ |
| Setup para suporte PT-BR           | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;✅ |

