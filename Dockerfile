FROM node:20

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm
RUN pnpm install

COPY . .

# 1 - gerar Prisma Client ANTES do build
RUN npx prisma generate

RUN npx prisma migrate deploy

# 2 - build do Nest
RUN pnpm build

CMD ["pnpm", "start:prod"]