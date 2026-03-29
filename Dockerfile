# ---------- BUILD ----------
FROM node:20 AS builder

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

COPY . .

RUN npx prisma generate
RUN pnpm build


# ---------- RUNTIME ----------
FROM node:20-slim

WORKDIR /app

# 🔥 ESSENCIAL pro Prisma
RUN apt-get update && apt-get install -y openssl

RUN npm install -g pnpm

COPY --from=builder /app/package.json ./
COPY --from=builder /app/pnpm-lock.yaml ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma

ENV NODE_ENV=production

COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

EXPOSE 3000

CMD ["sh", "entrypoint.sh"]