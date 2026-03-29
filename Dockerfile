# ---------- BUILD STAGE ----------
FROM node:20 AS builder

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm
RUN pnpm install

COPY . .

# gera prisma client
RUN npx prisma generate

# build da aplicação
RUN pnpm build


# ---------- RUNTIME STAGE ----------
FROM node:20-slim

WORKDIR /app

# instala pnpm (leve)
RUN npm install -g pnpm

# copia só o necessário
COPY --from=builder /app/package.json ./
COPY --from=builder /app/pnpm-lock.yaml ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma

# opcional (boa prática)
ENV NODE_ENV=production

# copia entrypoint
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

EXPOSE 3000

CMD ["sh", "entrypoint.sh"]