FROM node:20-alpine As builder

WORKDIR '/app'

COPY package*.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build => directory to the build file 

# build out the nginx server
FROM nginx 
EXPOSE 80
#copy over the build folder 
COPY --from=builder /app/dist /usr/share/nginx/html