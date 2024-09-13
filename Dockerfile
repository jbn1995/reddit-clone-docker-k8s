# Use a specific version of node for reproducibility and security
FROM node:19-alpine3.15

# Set working directory inside the container
WORKDIR /reddit-clone

# Copy only package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Use a production command if available; otherwise, keep your dev command
CMD ["npm", "run", "dev"]

