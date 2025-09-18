# 1. Build stage
FROM node:20-alpine AS builder

WORKDIR /app

# package.json과 lock 파일만 먼저 복사 → 의존성 설치 캐시 활용
COPY package*.json ./

RUN npm install --legacy-peer-deps

# 소스 복사 후 빌드
COPY . .
RUN npm run build

# 2. Production stage
FROM node:20-alpine AS runner

WORKDIR /app

# 빌드된 결과와 필요한 파일만 복사
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

# NestJS 기본 포트
EXPOSE 3000

# 실행
CMD ["node", "dist/main.js"]
