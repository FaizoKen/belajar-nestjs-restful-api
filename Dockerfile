FROM node

# Set working directory
WORKDIR /app

# Copy dependency files
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy built app and Prisma schema
COPY dist ./dist
COPY prisma ./prisma

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "run", "start:docker"]
