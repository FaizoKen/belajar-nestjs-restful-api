FROM node

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy built app and Prisma schema
COPY dist ./dist
COPY prisma ./prisma

# Generate Prisma client
RUN npx prisma generate

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "run", "start:docker"]
