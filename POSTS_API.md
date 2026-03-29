# Posts API Documentation

Esta documentação descreve todos os endpoints disponíveis para a API de Posts.

## Base URL
```
/posts
```

## Autenticação
A maioria das rotas requer autenticação JWT. Inclua o token no header:
```
Authorization: Bearer <seu_token>
```

---

## Endpoints

### 📝 Posts

#### Criar Post
```http
POST /posts
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Body:**
```json
{
  "title": "Título do Post",
  "content": "Conteúdo do post",
  "categoryId": 1,
  "published": true
}
```

**Respostas:**
- `201` - Post criado com sucesso
- `401` - Não autorizado

---

#### Listar Posts
```http
GET /posts
```

**Query Parameters:**
| Parâmetro | Tipo | Descrição |
|-----------|------|-----------|
| page | number | Página atual (default: 1) |
| limit | number | Itens por página (default: 10) |
| search | string | Busca por título ou conteúdo |
| categoryId | number | Filtrar por categoria |
| authorId | number | Filtrar por autor |
| published | boolean | Filtrar por status de publicação |

**Resposta:**
```json
{
  "data": [...],
  "meta": {
    "total": 100,
    "page": 1,
    "limit": 10,
    "totalPages": 10
  }
}
```

---

#### Obter Post por ID
```http
GET /posts/:id
```

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| id | number | ID do post |

**Respostas:**
- `200` - Post encontrado
- `404` - Post não encontrado

---

#### Obter Post por Slug
```http
GET /posts/slug/:slug
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| slug | string | Slug do post |

**Respostas:**
- `200` - Post encontrado
- `404` - Post não encontrado

---

#### Atualizar Post
```http
PUT /posts/:id
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| id | number | ID do post |

**Body:**
```json
{
  "title": "Novo Título",
  "content": "Novo conteúdo",
  "categoryId": 2,
  "published": false
}
```

**Respostas:**
- `200` - Post atualizado
- `401` - Não autorizado
- `403` - Sem permissão (não é o autor ou admin)
- `404` - Post não encontrado

---

#### Deletar Post
```http
DELETE /posts/:id
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| id | number | ID do post |

**Respostas:**
- `200` - Post deletado
- `401` - Não autorizado
- `403` - Sem permissão
- `404` - Post não encontrado

---

### 🖼️ Imagem de Capa

#### Upload de Imagem de Capa
```http
POST /posts/:id/cover
```

**Headers:** 
- `Authorization: Bearer <token>` (obrigatório)
- `Content-Type: multipart/form-data`

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| id | number | ID do post |

**Body (form-data):**
| Campo | Tipo | Descrição |
|-------|------|-----------|
| file | file | Arquivo de imagem |

**Respostas:**
- `200` - Imagem de capa atualizada
- `401` - Não autorizado
- `403` - Sem permissão
- `404` - Post não encontrado

---

#### Deletar Imagem de Capa
```http
DELETE /posts/:id/cover
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| id | number | ID do post |

**Respostas:**
- `200` - Capa deletada com sucesso
- `401` - Não autorizado
- `403` - Sem permissão
- `404` - Post não encontrado

---

### 💬 Comentários

#### Adicionar Comentário
```http
POST /posts/:id/comments
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| id | number | ID do post |

**Body:**
```json
{
  "content": "Conteúdo do comentário"
}
```

**Respostas:**
- `201` - Comentário criado com sucesso
- `401` - Não autorizado
- `404` - Post não encontrado

---

#### Listar Comentários
```http
GET /posts/:id/comments
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| id | number | ID do post |

**Respostas:**
- `200` - Lista de comentários
- `404` - Post não encontrado

---

#### Atualizar Comentário
```http
PATCH /posts/:postId/comments/:commentId
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| postId | number | ID do post |
| commentId | number | ID do comentário |

**Body:**
```json
{
  "content": "Conteúdo atualizado do comentário"
}
```

**Respostas:**
- `200` - Comentário atualizado
- `401` - Não autorizado
- `403` - Sem permissão (não é o autor ou admin)
- `404` - Post ou comentário não encontrado

---

#### Deletar Comentário
```http
DELETE /posts/:postId/comments/:commentId
```

**Headers:** `Authorization: Bearer <token>` (obrigatório)

**Parâmetros:**
| Nome | Tipo | Descrição |
|------|------|-----------|
| postId | number | ID do post |
| commentId | number | ID do comentário |

**Respostas:**
- `200` - Comentário deletado
- `401` - Não autorizado
- `403` - Sem permissão (não é o autor ou admin)
- `404` - Post ou comentário não encontrado

---

## Modelos

### Post
```typescript
{
  id: number;
  title: string;
  slug: string;
  content: string;
  coverImage?: string;
  published: boolean;
  authorId: number;
  categoryId: number;
  createdAt: Date;
  updatedAt: Date;
  author: {
    id: number;
    name: string;
    email: string;
    avatar?: string;
  };
  category: {
    id: number;
    name: string;
  };
  comments?: Comment[];
}
```

### Comment
```typescript
{
  id: number;
  content: string;
  postId: number;
  authorId: number;
  createdAt: Date;
  updatedAt: Date;
  author: {
    id: number;
    name: string;
    email: string;
    avatar?: string;
  };
}
```

---

## Swagger

Acesse a documentação interativa do Swagger em:
```
http://localhost:3000/api
```
