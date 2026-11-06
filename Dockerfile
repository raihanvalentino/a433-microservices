FROM node:14

WORKDIR /app

COPY . .

ENV NODE_ENV=production DB_HOST=item-db

#Menginstal dependencies untuk production dan build aplikasi
RUN npm install --production --unsafe-perm && npm run build
#port yang digunakan oleh aplikasi adalah 8080
EXPOSE 8080

CMD ["npm", "start"]