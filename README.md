# Blog API - NestJS + Prisma + Docker

[![CI/CD Pipeline](https://github.com/seu-usuario/nest-prisma-docker/workflows/CI/CD%20Pipeline/badge.svg)](https://github.com/seu-usuario/nest-prisma-docker/actions)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.7-blue)](https://www.typescriptlang.org/)
[![NestJS](https://img.shields.io/badge/NestJS-11.0-red)](https://nestjs.com/)
[![Prisma](https://img.shields.io/badge/Prisma-4.16-green)](https://www.prisma.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> API REST completa para gerenciamento de blog com autenticação JWT, sistema de roles e relacionamentos complexos.

## 📋 Sobre o Projeto

Este projeto é uma API REST moderna e escalável construída com as melhores práticas do mercado. Simula uma aplicação de blog do mundo real com:

- Sistema completo de autenticação e autorização
- CRUD de usuários, posts, categorias e comentários
- Relacionamentos complexos entre entidades
- Filtros avançados e paginação
- Documentação interativa com Swagger
- CI/CD com GitHub Actions
- Containerização com Docker

## 🚀 Stack Tecnológica

- **[NestJS](https://nestjs.com/)** - Framework Node.js progressivo
- **[Prisma](https://www.prisma.io/)** - ORM moderno para TypeScript
- **[PostgreSQL](https://www.postgresql.org/)** - Banco de dados relacional
- **[Docker](https://www.docker.com/)** - Containerização
- **[JWT](https://jwt.io/)** - Autenticação com tokens
- **[Bcrypt](https://github.com/kelektiv/node.bcrypt.js)** - Hash de senhas
- **[Passport](http://www.passportjs.org/)** - Middleware de autenticação
- **[Swagger/OpenAPI](https://swagger.io/)** - Documentação interativa da API
- **[TypeScript](https://www.typescriptlang.org/)** - Superset tipado do JavaScript

## ✨ Funcionalidades

### Autenticação & Autorização

- ✅ Registro e login de usuários
- ✅ Autenticação JWT
- ✅ Sistema de roles (ADMIN e CLIENT)
- ✅ Guards para proteção de rotas
- ✅ Validação de permissões

### Blog

- ✅ CRUD completo de posts
- ✅ Sistema de categorias
- ✅ Comentários em posts
- ✅ Filtros avançados (busca, categoria, autor, publicado)
- ✅ Paginação de resultados
- ✅ Geração automática de slugs
- ✅ Permissões por autor

### Infraestrutura

- ✅ Documentação Swagger interativa
- ✅ Migrations do Prisma
- ✅ Seeds de dados para desenvolvimento
- ✅ Docker Compose para ambiente completo
- ✅ CI/CD com GitHub Actions
- ✅ Validação de dados com class-validator

## 📊 Modelo de Dados

```
User (Usuário)
├── Posts (1:N)
└── Comments (1:N)

Category (Categoria)
└── Posts (1:N)

Post (Post)
├── Author (N:1) → User
├── Category (N:1) → Category
└── Comments (1:N)

Comment (Comentário)
├── Post (N:1) → Post
└── Author (N:1) → User
```

## 🏁 Início Rápido

### Pré-requisitos

- [Docker](https://www.docker.com/get-started) e [Docker Compose](https://docs.docker.com/compose/)
- [Node.js 20+](https://nodejs.org/) (opcional, para desenvolvimento local)
- [pnpm](https://pnpm.io/) (opcional)

### Instalação e Execução

1. **Clone o repositório**

```bash
git clone https://github.com/seu-usuario/nest-prisma-docker.git
cd nest-prisma-docker
```

2. **Configure as variáveis de ambiente**

```bash
cp .env.example .env
# Edite o .env com suas configurações
```

3. **Inicie com Docker**

```bash
# Inicia todos os containers
docker-compose up -d

# Aplica as migrations
docker-compose exec app pnpm prisma migrate deploy

# Gera o Prisma Client
docker-compose exec app pnpm prisma generate

# Popula o banco com dados de teste
docker-compose exec app pnpm prisma:seed
```

4. **Acesse a aplicação**

- API: http://localhost:3000
- Swagger: http://localhost:3000/api

### Credenciais de Teste (após seed)

- **Admin:** `admin@example.com` / `admin123`
- **User:** `user@example.com` / `user123`

## 📚 Documentação da API

Acesse a documentação interativa completa em: **http://localhost:3000/api**

### Principais Endpoints

#### Autenticação

```http
POST   /auth/register      # Registrar novo usuário
POST   /auth/login         # Fazer login
GET    /auth/profile       # Obter perfil (autenticado)
GET    /auth/admin-only    # Rota exclusiva admin
```

#### Posts

```http
GET    /posts              # Listar posts (com filtros)
GET    /posts/:id          # Obter post por ID
GET    /posts/slug/:slug   # Obter post por slug
POST   /posts              # Criar post (autenticado)
PUT  /posts/:id          # Atualizar post (autor ou admin)
DELETE /posts/:id          # Deletar post (autor ou admin)
```

#### Categorias

```http
GET    /categories         # Listar categorias
GET    /categories/:id     # Obter categoria
POST   /categories         # Criar categoria (admin)
PUT  /categories/:id     # Atualizar categoria (admin)
DELETE /categories/:id     # Deletar categoria (admin)
```

#### Usuários

```http
GET    /users              # Listar usuários
GET    /users/:id          # Obter usuário
POST   /users              # Criar usuário
PUT  /users/:id          # Atualizar usuário
DELETE /users/:id          # Deletar usuário
```

### Filtros Avançados

Exemplo de busca em posts:

```http
GET /posts?search=nestjs&published=true&categoryId=1&page=1&limit=10
```

## 🔧 Desenvolvimento

### Estrutura do Projeto

```
src/
├── auth/               # Autenticação e autorização
│   ├── decorators/     # @Roles()
│   ├── dto/            # DTOs de auth
│   ├── enums/          # Role enum
│   ├── guards/         # JWT e Roles guards
│   └── strategies/     # JWT strategy
├── posts/              # Módulo de posts
│   ├── dto/            # DTOs de posts
│   ├── posts.controller.ts
|   ├── posts.controller.ts
│   └── posts.module.ts
├── categories/         # Módulo de categorias
├── user/               # Módulo de usuários
├── prisma/             # Configuração do Prisma
└── common/             # Utilitários compartilhados
```

### Scripts Disponíveis

```bash
# Desenvolvimento
pnpm start:dev          # Inicia em modo watch
pnpm start:debug        # Inicia com debugger

# Build
pnpm build              # Compila o projeto
pnpm start:prod         # Inicia em produção

# Testes
pnpm test               # Testes unitários
pnpm test:watch         # Testes em modo watch
pnpm test:cov           # Cobertura de testes
pnpm test:e2e           # Testes end-to-end

# Linting & Formatação
pnpm lint               # ESLint
pnpm format             # Prettier

# Prisma
pnpm prisma:generate    # Gera Prisma Client
pnpm prisma:migrate:dev # Cria e aplica migration
pnpm prisma:seed        # Popula banco com dados
pnpm prisma:studio      # Abre Prisma Studio
```

### Docker

```bash
# Ver logs
docker-compose logs app -f

# Executar comandos no container
docker-compose exec app <comando>

# Reiniciar aplicação
docker-compose restart app

# Parar containers
docker-compose down

# Rebuild
docker-compose up -d --build
```

## 🧪 Testando no Swagger

1. Acesse http://localhost:3000/api
2. Faça login através do endpoint `/auth/login`
3. Copie o `access_token` da resposta
4. Clique em **"Authorize"** no topo da página
5. Cole o token e clique em **"Authorize"**
6. Agora você pode testar as rotas protegidas!

## 🔐 Sistema de Roles

### Protegendo Rotas

```typescript
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from './auth/guards/jwt-auth.guard';
import { RolesGuard } from './auth/guards/roles.guard';
import { Roles } from './auth/decorators/roles.decorator';
import { Role } from './auth/enums/role.enum';

// Apenas ADMIN
@UseGuards(JwtAuthGuard, RolesGuard)
@Roles(Role.ADMIN)
@Delete(':id')
delete() { }

// Qualquer usuário autenticado
@UseGuards(JwtAuthGuard)
@Get('profile')
getProfile() { }
```

## 🚢 Deploy

### Variáveis de Ambiente para Produção

```env
DATABASE_URL="postgresql://user:pass@host:5432/db"
JWT_SECRET="minha-chave-super-secreta-aleatoria"
NODE_ENV="production"
PORT=3000
```

**⚠️ IMPORTANTE:** Altere o `JWT_SECRET` para uma chave segura e aleatória em produção!

### Docker em Produção

```bash
# Build da imagem
docker build -t blog-api .

# Executar container
docker run -p 3000:3000 \
  -e DATABASE_URL="..." \
  -e JWT_SECRET="..." \
  blog-api
```

## 📝 Documentação Adicional

- [Swagger UI](http://localhost:3000/api) - Documentação interativa
- [Prisma Docs](https://www.prisma.io/docs/) - Documentação do Prisma
- [NestJS Docs](https://docs.nestjs.com/) - Documentação do NestJS

## 🔒 Segurança

- Senhas hasheadas com bcrypt (salt rounds: 10)
- Tokens JWT com expiração configurável
- Validação de dados em todas as requisições
- Proteção contra SQL injection via Prisma
- CORS configurável

## ⭐ Recursos Adicionais

- **CI/CD:** GitHub Actions configurado para testes e build automático
- **Seeds:** Dados de exemplo para desenvolvimento
- **TypeScript:** Totalmente tipado para melhor DX
- **Validação:** class-validator em todos os DTOs
- **Documentação:** Swagger completo e atualizado

---

Feito com ❤️ usando NestJS e Prisma
#   n e s t - d o c k e r  
 