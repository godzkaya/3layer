FROM node:18-alpine

WORKDIR /app

# PM2'yi global olarak yükle
RUN npm install -g pm2

COPY package*.json ./
RUN npm install

# Next.js için pages dizinini oluştur
RUN mkdir -p pages

COPY . .
RUN npm run build

EXPOSE 3000

# PM2 ile başlatma
CMD ["pm2-runtime", "npm", "--", "start"] 