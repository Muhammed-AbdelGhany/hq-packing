#!/bin/bash

# HQ Packing - GitHub Pages Deployment Script
# Make executable with: chmod +x deploy.sh
# Run with: ./deploy.sh

echo "🚀 HQ Packing - GitHub Pages Deployment"
echo "========================================"

# Check if gh-pages is installed
if ! command -v gh-pages &> /dev/null
then
    echo "📦 Installing gh-pages..."
    npm install -g gh-pages
fi

# Get repository name from git remote
REPO_NAME=$(basename -s .git `git config --get remote.origin.url` 2>/dev/null)

if [ -z "$REPO_NAME" ]; then
    echo "❌ Error: No git remote found. Please set up your GitHub repository first."
    echo ""
    echo "Run these commands first:"
    echo "  git init"
    echo "  git remote add origin https://github.com/YOUR_USERNAME/hq_packing.git"
    exit 1
fi

echo "📁 Repository: $REPO_NAME"
echo "🔨 Building Flutter Web app..."

# Build with base href
flutter build web --release --base-href "/$REPO_NAME/"

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "🌐 Deploying to GitHub Pages..."
    
    # Deploy to gh-pages branch
    gh-pages -d build/web
    
    if [ $? -eq 0 ]; then
        echo "✅ Deployment successful!"
        echo ""
        echo "🎉 Your site will be live at:"
        
        # Extract username from git remote
        USERNAME=$(git config --get remote.origin.url | sed 's/.*github.com[:/]\(.*\)\/.*/\1/')
        echo "   https://$USERNAME.github.io/$REPO_NAME/"
        echo ""
        echo "⏱️  Note: It may take 2-3 minutes for changes to appear."
        echo ""
        echo "📋 Next steps:"
        echo "   1. Go to: https://github.com/$USERNAME/$REPO_NAME/settings/pages"
        echo "   2. Under 'Source', select branch: gh-pages"
        echo "   3. Click Save"
    else
        echo "❌ Deployment failed!"
        exit 1
    fi
else
    echo "❌ Build failed!"
    exit 1
fi
