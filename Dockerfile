# Use the official Node.js 16 base image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the frontend (assuming frontend is located in the 'frontend' directory)
RUN npm install --prefix frontend && npm run build --prefix frontend

# Expose the port defined in the PORT environment variable (default to 5000)
EXPOSE $PORT

# Set default values for build-time environment variables
COPY .env .env

# Start the server
CMD ["npm", "start"]
