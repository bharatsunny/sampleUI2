### STAGE 1: Build ###
FROM node:12.0-alpine AS builder

COPY . ./sampleUI
WORKDIR /sampleUI

RUN npm i
RUN $(npm bin)/ng build --prod

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /sampleUI/dist/sampleUI /usr/share/nginx/html
