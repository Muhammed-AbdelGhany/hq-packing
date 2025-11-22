# HQ Packing - Flutter Web Landing Page

A professional, modern landing page for HQ Packing built with Flutter Web.

## 🌟 Features

### ✅ All Requirements Implemented

1. **Hero Section**
   - Company name: HQ Packing
   - Tagline: High Quality Packaging Solutions
   - Animated entrance with fade and slide effects
   - Call-to-action button with hover effects

2. **Services Section**
   - **Duplex Paper Packing**: Durable, eco-friendly, suitable for heavy-duty packaging
   - **Single Paper Packing**: Lightweight, cost-effective, perfect for simple product packaging
   - Responsive card layout with hover animations
   - Icon-based visual design

3. **About Section**
   - Company overview and values
   - Feature highlights (High Quality, Eco-Friendly, Cost Effective, Reliable)
   - Professional card-based layout

4. **Contact Section**
   - Working contact form with validation:
     - Full Name (required)
     - Email (required, validated)
     - Message (required, min 10 characters)
   - Sends email to: example@hqpacking.com
   - Clickable contact details:
     - 📞 Tap to call: 01192813719
     - 📧 Tap to email: example@hqpacking.com
   - Uses url_launcher for phone and email

5. **Footer**
   - Company information
   - Contact details
   - Copyright © 2025 HQ Packing

### 🎨 Design Features

- **Color Scheme**: Dark blue (#1A237E), white, light gray
- **Typography**: Google Fonts - Poppins
- **UI Elements**:
  - Rounded cards with elevation
  - Smooth hover effects optimized for web
  - Fade and slide animations
  - Responsive layout using LayoutBuilder
  - Mobile, tablet, and desktop breakpoints

### 📱 Responsive Design

- **Mobile**: < 768px
- **Tablet**: 768px - 1024px
- **Desktop**: > 1024px

All sections adapt beautifully to different screen sizes.

### 🔧 Technical Implementation

- Single-page application with smooth scrolling
- Modular widget structure
- Form validation
- URL launcher integration for email and phone
- Navigation bar with scroll-to-section functionality
- SingleChildScrollView for smooth scrolling
- AnimatedContainer and FadeTransition for animations

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point with theme configuration
├── pages/
│   └── landing_page.dart        # Main landing page with navigation
└── widgets/
    ├── hero_section.dart        # Hero section with CTA
    ├── services_section.dart    # Services cards
    ├── about_section.dart       # About company
    ├── contact_section.dart     # Contact form & details
    └── footer_section.dart      # Footer
```

## 🚀 Running Locally

### Prerequisites

- Flutter SDK (3.5.4 or higher)
- Web browser (Chrome recommended for development)

### Steps

1. **Navigate to project directory**:
   ```bash
   cd /Users/daf/Documents/assignments/assigment_5/hq/hq_packing
   ```

2. **Get dependencies** (already done):
   ```bash
   flutter pub get
   ```

3. **Run in debug mode**:
   ```bash
   flutter run -d chrome
   ```
   
   Or for any web browser:
   ```bash
   flutter run -d web-server
   ```
   Then open http://localhost:port in your browser

4. **Run with hot reload**:
   ```bash
   flutter run -d chrome --web-hot-reload
   ```

## 📦 Building for Production

### Build Web Application

```bash
flutter build web --release
```

This creates optimized files in `build/web/` directory.

### Build Options

**Optimize for web**:
```bash
flutter build web --release --web-renderer canvaskit
```

**For better performance on most browsers**:
```bash
flutter build web --release --web-renderer html
```

**Auto-detect renderer**:
```bash
flutter build web --release --web-renderer auto
```

## 🌐 Deployment

### Option 1: Firebase Hosting (Recommended)

1. Install Firebase CLI:
   ```bash
   npm install -g firebase-tools
   ```

2. Login to Firebase:
   ```bash
   firebase login
   ```

3. Initialize Firebase in project:
   ```bash
   firebase init hosting
   ```
   - Select or create a Firebase project
   - Set public directory to: `build/web`
   - Configure as single-page app: Yes
   - Don't overwrite index.html

4. Deploy:
   ```bash
   flutter build web --release
   firebase deploy
   ```

### Option 2: Netlify

1. Build the project:
   ```bash
   flutter build web --release
   ```

2. Drag and drop `build/web` folder to [Netlify Drop](https://app.netlify.com/drop)

Or use Netlify CLI:
```bash
npm install -g netlify-cli
netlify deploy --prod --dir=build/web
```

### Option 3: GitHub Pages

1. Build the project:
   ```bash
   flutter build web --release --base-href "/hq_packing/"
   ```

2. Copy contents of `build/web` to your GitHub Pages repository

3. Push to GitHub:
   ```bash
   git add .
   git commit -m "Deploy Flutter web app"
   git push origin main
   ```

### Option 4: Vercel

1. Install Vercel CLI:
   ```bash
   npm install -g vercel
   ```

2. Build and deploy:
   ```bash
   flutter build web --release
   vercel --prod
   ```

### Option 5: AWS S3 + CloudFront

1. Build the project:
   ```bash
   flutter build web --release
   ```

2. Upload `build/web` contents to S3 bucket

3. Enable static website hosting

4. Configure CloudFront for CDN

## 🔍 Testing

### Test on different screen sizes:

```bash
# Desktop view
flutter run -d chrome

# Then use Chrome DevTools to simulate:
# - Mobile devices (iPhone, Android)
# - Tablets (iPad)
# - Different desktop resolutions
```

### Performance testing:

Open Chrome DevTools → Lighthouse → Run audit

## 📋 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  google_fonts: ^6.1.0
  url_launcher: ^6.2.2
  url_launcher_web: ^2.2.0
```

## ✨ Key Features for Web

- ✅ Hover effects on buttons and cards
- ✅ Smooth scroll navigation
- ✅ Responsive breakpoints (mobile, tablet, desktop)
- ✅ Form validation
- ✅ URL launcher for email and phone (web-compatible)
- ✅ Animations (fade, slide, scale)
- ✅ SEO-friendly single-page structure
- ✅ Fast loading with optimized assets
- ✅ Modern Material Design 3

## 🎯 Browser Compatibility

- ✅ Chrome (recommended)
- ✅ Firefox
- ✅ Safari
- ✅ Edge
- ✅ Mobile browsers

## 📞 Contact Integration

The contact form uses `url_launcher` to:
- Open email client with pre-filled details
- Dial phone number directly
- All interactions work on web and mobile browsers

## 🛠️ Customization

### Colors
Edit in `lib/main.dart`:
```dart
primaryColor: const Color(0xFF1A237E), // Dark Blue
```

### Fonts
Change in `lib/main.dart`:
```dart
textTheme: GoogleFonts.interTextTheme(), // or any Google Font
```

### Contact Details
Update in `lib/widgets/contact_section.dart` and `lib/widgets/footer_section.dart`

## 📝 Notes

- The app is optimized for Flutter Web
- All hover effects work best on desktop browsers
- Forms are validated before submission
- Email and phone links use native handlers
- Smooth scrolling works across all modern browsers

## 🎉 Ready to Deploy!

Your Flutter Web app is production-ready. Choose your preferred hosting option and deploy!

For questions or issues, check the Flutter documentation: https://docs.flutter.dev/platform-integration/web
