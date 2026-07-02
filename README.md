# Blog API

<p align="center">
  <img src="./docs/banner.png" alt="Blog API Banner" width="100%" />
</p>

<p align="center">
  API REST desenvolvida com <strong>NestJS</strong>, <strong>Prisma ORM</strong>, <strong>PostgreSQL</strong> e <strong>Docker</strong>, utilizando autenticação JWT, controle de permissões (RBAC), documentação automática com Swagger e pipeline de CI/CD.
</p>

<p align="center">

![TypeScript](https://img.shields.io/badge/TypeScript-5.x-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![NestJS](https://img.shields.io/badge/NestJS-11.x-E0234E?style=for-the-badge&logo=nestjs&logoColor=white)
![Prisma](https://img.shields.io/badge/Prisma-ORM-2D3748?style=for-the-badge&logo=prisma)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![License](https://img.shields.io/github/license/seu-usuario/blog-api?style=for-the-badge)

</p>

---

# 📖 Índice

- [Sobre](#-sobre)
- [Demonstração](#-demonstração)
- [Tecnologias](#-tecnologias)
- [Arquitetura](#-arquitetura)
- [Modelo de Dados](#-modelo-de-dados)
- [Funcionalidades](#-funcionalidades)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Instalação](#-instalação)
- [Variáveis de Ambiente](#-variáveis-de-ambiente)
- [Docker](#-docker)
- [Swagger](#-swagger)
- [Scripts](#-scripts)
- [Deploy](#-deploy)
- [CI/CD](#-cicd)
- [Segurança](#-segurança)
- [Roadmap](#-roadmap)
- [Licença](#-licença)

---

# 📌 Sobre

Esta API simula um sistema completo de gerenciamento de blog utilizando as principais tecnologias do ecossistema Node.js.

O projeto foi desenvolvido seguindo boas práticas de arquitetura, separação de responsabilidades, validação de dados, autenticação JWT e containerização com Docker.

Entre os principais recursos estão:

- Autenticação JWT
- Controle de acesso por Roles (RBAC)
- CRUD completo
- Paginação
- Filtros
- Relacionamentos complexos
- Prisma ORM
- Swagger
- Docker
- CI/CD

---

# 🎥 Demonstração

## Swagger

> Substitua pela imagem do seu projeto.

<p align="center">
<img src="./docs/swagger.png" width="900">
</p>

---

# 🚀 Tecnologias

## Backend

- NestJS
- TypeScript
- Prisma ORM
- PostgreSQL
- Docker

## Autenticação

- JWT
- Passport
- Bcrypt

## Documentação

- Swagger / OpenAPI

## Qualidade

- ESLint
- Prettier
- Class Validator
- Class Transformer

## DevOps

- Docker
- Docker Compose
- GitHub Actions

---

# 🏗 Arquitetura

```text
                Client

                   │

                   ▼

            NestJS Controllers

                   │

                   ▼

            NestJS Services

                   │

                   ▼

               Prisma ORM

                   │

                   ▼

              PostgreSQL
```

---

# 🗄 Modelo de Dados

```text
User
├── Posts (1:N)
└── Comments (1:N)

Category
└── Posts (1:N)

Post
├── User (N:1)
├── Category (N:1)
└── Comments (1:N)

Comment
├── User (N:1)
└── Post (N:1)
```

---

# ✨ Funcionalidades

## 🔐 Autenticação

- Cadastro de usuários
- Login
- JWT
- Hash de senha
- Guards
- Roles
- Perfil do usuário

---

## 👤 Usuários

- Criar usuário
- Listar usuários
- Buscar usuário
- Atualizar usuário
- Remover usuário

---

## 📝 Posts

- Criar post
- Atualizar post
- Remover post
- Buscar por slug
- Buscar por ID
- Paginação
- Pesquisa
- Filtro por categoria
- Filtro por autor
- Filtro por publicação

---

## 📂 Categorias

- CRUD completo

---

## 💬 Comentários

- CRUD completo

---

## 📚 Documentação

- Swagger automático

---

## 🐳 Docker

- API
- PostgreSQL
- Docker Compose

---

## ⚙️ Infraestrutura

- Prisma Migrations
- Prisma Seed
- CI/CD
- ESLint
- Prettier

---

# 📁 Estrutura do Projeto

```text
src
├── auth
│   ├── decorators
│   ├── dto
│   ├── enums
│   ├── guards
│   ├── strategies
│   ├── auth.controller.ts
│   ├── auth.service.ts
│   └── auth.module.ts
│
├── users
│
├── posts
│
├── comments
│
├── categories
│
├── prisma
│
├── common
│
├── app.module.ts
└── main.ts
```

---

# 🚀 Instalação

## Clonar projeto

```bash
git clone https://github.com/seu-usuario/blog-api.git

cd blog-api
```

---

## Instalar dependências

```bash
pnpm install
```

---

## Configurar ambiente

```bash
cp .env.example .env
```

---

## Executar Docker

```bash
docker compose up -d
```

---

## Gerar Prisma Client

```bash
pnpm prisma generate
```

---

## Executar migrations

```bash
pnpm prisma migrate deploy
```

---

## Popular banco

```bash
pnpm prisma db seed
```

---

## Executar aplicação

```bash
pnpm start:dev
```

---

# 🔧 Variáveis de Ambiente

```env
DATABASE_URL=

JWT_SECRET=

PORT=3000

NODE_ENV=development
```

---

# 🐳 Docker

Subir containers

```bash
docker compose up -d
```

Ver logs

```bash
docker compose logs -f
```

Parar containers

```bash
docker compose down
```

Rebuild

```bash
docker compose up -d --build
```

Entrar no container

```bash
docker compose exec app sh
```

---

# 📖 Swagger

Após iniciar a aplicação:

```
http://localhost:3000/api
```

---

# 📌 Principais Endpoints

## Auth

```http
POST /auth/register

POST /auth/login

GET /auth/profile
```

---

## Users

```http
GET /users

GET /users/:id

POST /users

PATCH /users/:id

DELETE /users/:id
```

---

## Posts

```http
GET /posts

GET /posts/:id

GET /posts/slug/:slug

POST /posts

PATCH /posts/:id

DELETE /posts/:id
```

---

## Categories

```http
GET /categories

POST /categories

PATCH /categories/:id

DELETE /categories/:id
```

---

## Comments

```http
GET /comments

POST /comments

PATCH /comments/:id

DELETE /comments/:id
```

---

# 📜 Scripts

## Desenvolvimento

```bash
pnpm start:dev

pnpm start:debug
```

---

## Produção

```bash
pnpm build

pnpm start:prod
```

---

## Testes

```bash
pnpm test

pnpm test:e2e

pnpm test:watch

pnpm test:cov
```

---

## Prisma

```bash
pnpm prisma generate

pnpm prisma migrate dev

pnpm prisma migrate deploy

pnpm prisma db seed

pnpm prisma studio
```

---

## Qualidade

```bash
pnpm lint

pnpm format
```

---

# 🚀 Deploy

Pode ser executado em:

- Render
- Railway
- Fly.io
- DigitalOcean
- AWS
- Azure

### Build Docker

```bash
docker build -t blog-api .
```

Executar

```bash
docker run \
-p 3000:3000 \
-e DATABASE_URL=... \
-e JWT_SECRET=... \
blog-api
```

---

# 🔄 CI/CD

Pipeline automatizada para:

- Instalação das dependências
- Lint
- Build
- Testes
- Deploy

---

# 🔒 Segurança

- JWT Authentication
- Password Hash (bcrypt)
- Role Based Access Control
- DTO Validation
- Guards
- Prisma ORM
- Proteção contra SQL Injection
- Validação automática de requisições

---

# 🛣 Roadmap

- [x] Autenticação JWT
- [x] CRUD Usuários
- [x] CRUD Posts
- [x] CRUD Categorias
- [x] CRUD Comentários
- [x] Swagger
- [x] Docker
- [x] Prisma
- [x] Seed
- [x] CI/CD
- [ ] Refresh Token
- [ ] Upload de Imagens
- [ ] Cache com Redis
- [ ] Testes E2E completos
- [ ] Observabilidade
- [ ] Rate Limiting

---

# 🤝 Contribuindo

1. Faça um Fork

2. Crie uma branch

```bash
git checkout -b feature/nova-feature
```

3. Commit

```bash
git commit -m "feat: nova funcionalidade"
```

4. Push

```bash
git push origin feature/nova-feature
```

5. Abra um Pull Request.

---

# 📄 Licença

Este projeto está licenciado sob a licença **MIT**.

---

<p align="center">

Desenvolvido com ❤️ utilizando **NestJS**, **Prisma ORM**, **PostgreSQL** e **Docker**.

</p>
