# Use NodeJS base image
FROM node:13

# Environment variables
ARG ARG_POSTGRES_USERNAME
ENV POSTGRES_USERNAME=$ARG_POSTGRES_USERNAME
ARG ARG_POSTGRES_PASSWORD
ENV POSTGRES_PASSWORD=$ARG_POSTGRES_PASSWORD
ARG ARG_POSTGRES_DB
ENV POSTGRES_DB=$ARG_POSTGRES_DB
ARG ARG_POSTGRES_HOST
ENV POSTGRES_HOST=$ARG_POSTGRES_HOST
ARG ARG_AWS_REGION
ENV AWS_REGION=$ARG_AWS_REGION
ARG ARG_AWS_PROFILE
ENV AWS_PROFILE=$ARG_AWS_PROFILE
ARG ARG_AWS_BUCKET
ENV AWS_BUCKET=$ARG_AWS_BUCKET
ARG ARG_URL
ENV URL=$ARG_URL
ARG ARG_JWT_SECRET
ENV JWT_SECRET=$ARG_JWT_SECRET

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Bind the port that the image will run on
EXPOSE 8080

# Define the Docker image's behavior at runtime
CMD ["npm", "run", "dev"]
