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

RUN npx prisma migrate deploy

# Expose app port
EXPOSE 3000

# Start the app
CMD ["node", "dist/main.js"]
