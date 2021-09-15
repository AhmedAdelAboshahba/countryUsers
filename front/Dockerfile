FROM node:14.4-alpine
WORKDIR /front
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "serve"]