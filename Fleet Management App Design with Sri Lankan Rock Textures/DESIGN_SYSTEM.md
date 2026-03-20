# Moonstone Fleet Management - Complete UX/UI Design System

## Executive Summary

This document provides a complete, reproducible design system for the Moonstone Fleet Management app. It covers all visual design decisions, interaction patterns, component specifications, and UX principles. Use this to recreate the design in any platform, framework, or design tool.

---

## 1. Design Philosophy & Principles

### Core Values
- **Modern & Clean**: Minimalist interface with ample whitespace; every element serves a purpose
- **Functional First**: Prioritize clarity and usability over decorative elements
- **Sri Lankan Heritage**: Incorporate rock textures and moonstone imagery as subtle design elements
- **One-Handed Usage**: Optimize for portrait orientation (9:16) with thumb-reachable navigation
- **Apple HIG Alignment**: Follow Apple Human Interface Guidelines for iOS-like feel
- **Accessibility First**: WCAG AA compliance for color contrast and readable typography

### Design Hierarchy
1. **Primary**: Vehicle status, alerts, key metrics (largest, boldest, primary color)
2. **Secondary**: Metadata, timestamps, driver info (medium size, muted color)
3. **Tertiary**: Hints, help text, secondary actions (smallest, lightest color)

---

## 2. Color System

### Color Palette (Inspired by Sri Lankan Rock Textures)

| Token | Light Mode | Dark Mode | RGB Light | RGB Dark | Usage |
|-------|-----------|----------|-----------|----------|-------|
| **Primary** | #2C3E50 | #2C3E50 | 44, 62, 80 | 44, 62, 80 | Action buttons, key highlights, active states |
| **Background** | #FFFFFF | #0F1419 | 255, 255, 255 | 15, 20, 25 | Screen backgrounds, main surface |
| **Surface** | #F8F9FA | #1A1E27 | 248, 249, 250 | 26, 30, 39 | Cards, elevated surfaces, containers |
| **Foreground** | #1A1A1A | #F5F5F5 | 26, 26, 26 | 245, 245, 245 | Primary text, headings |
| **Muted** | #6B7280 | #9CA3AF | 107, 114, 128 | 156, 163, 175 | Secondary text, hints, disabled states |
| **Border** | #E5E7EB | #374151 | 229, 231, 235 | 55, 65, 81 | Dividers, borders, subtle separators |
| **Success** | #10B981 | #34D399 | 16, 185, 129 | 52, 211, 153 | Active status, confirmations, success states |
| **Warning** | #F59E0B | #FBBF24 | 245, 158, 11 | 251, 191, 36 | Alerts, cautions, idle status |
| **Error** | #EF4444 | #F87171 | 239, 68, 68 | 248, 113, 113 | Errors, critical alerts, maintenance issues |
| **Accent** | #8B7355 | #A0826D | 139, 115, 85 | 160, 130, 109 | Moonstone brown, premium accents |

### Color Usage Rules

- **Text on Primary**: Always use white (#FFFFFF)
- **Text on Surface**: Use Foreground color
- **Disabled Elements**: Use Muted color with 50% opacity
- **Hover/Active States**: Reduce opacity by 20% or darken by 10%
- **Dark Mode Switching**: Use CSS variables; no `dark:` prefix needed in Tailwind

### Contrast Ratios (WCAG AA Compliance)
- Foreground on Background: 12.6:1 (AAA)
- Foreground on Surface: 10.2:1 (AAA)
- Muted on Background: 4.8:1 (AA)
- Primary on White: 5.1:1 (AA)

---

## 3. Typography System

### Font Family
- **Primary Font**: Inter (system fallback: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto)
- **Fallback Stack**: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif
- **Weights Used**: 400 (Regular), 500 (Medium), 600 (Semibold), 700 (Bold)

### Type Scale

| Element | Size | Weight | Line Height | Letter Spacing | Usage |
|---------|------|--------|-------------|-----------------|-------|
| **Display** | 32px | 700 | 1.2 (38px) | -0.5px | Screen titles, hero sections, main headings |
| **Heading 1** | 28px | 700 | 1.3 (36px) | -0.3px | Major section titles, page headers |
| **Heading 2** | 24px | 600 | 1.3 (31px) | 0px | Subsection titles, card headers |
| **Heading 3** | 20px | 600 | 1.4 (28px) | 0px | Card titles, section labels |
| **Body Large** | 18px | 400 | 1.5 (27px) | 0px | Primary body text, important content |
| **Body** | 16px | 400 | 1.5 (24px) | 0px | Standard body text, list items |
| **Body Small** | 14px | 400 | 1.5 (21px) | 0px | Secondary text, metadata |
| **Caption** | 12px | 500 | 1.4 (17px) | 0.3px | Hints, timestamps, badges, labels |
| **Button** | 16px | 600 | 1.5 (24px) | 0px | Button text (use with 12px padding) |

### Typography Rules
- **Minimum Font Size**: 12px (never smaller for accessibility)
- **Maximum Line Width**: 44 characters for optimal readability
- **Line Height Ratio**: 1.4–1.5× font size for body text
- **Heading Spacing**: 24px margin-bottom for Display, 16px for H1, 12px for H2
- **Paragraph Spacing**: 16px between paragraphs

---

## 4. Spacing System

### Base Unit
- **1 Unit = 4px** (4px grid system)
- All spacing uses multiples of 4px for consistency

### Spacing Scale

| Token | Value | Usage |
|-------|-------|-------|
| **xs** | 4px (1×) | Minimal gaps, icon spacing |
| **sm** | 8px (2×) | Small gaps between elements |
| **md** | 12px (3×) | Standard gaps, internal padding |
| **lg** | 16px (4×) | Standard padding, section gaps |
| **xl** | 24px (6×) | Major section spacing, breathing room |
| **2xl** | 32px (8×) | Large section gaps, page-level spacing |
| **3xl** | 48px (12×) | Hero sections, major breaks |

### Padding Guidelines
- **Screen Padding**: 24px (6×) on all sides
- **Card Padding**: 16px (4×) internal
- **Button Padding**: 12px vertical (3×), 16px horizontal (4×)
- **List Item Padding**: 16px (4×) with 12px (3×) gaps between items

### Gap Guidelines
- **Between Cards**: 16px (4×)
- **Between Sections**: 24px (6×)
- **Within Card Content**: 12px (3×)
- **Between Form Fields**: 12px (3×)

---

## 5. Component System

### Buttons

#### Primary Button
```
Background: Primary (#2C3E50)
Text: White (#FFFFFF)
Padding: 12px vertical, 16px horizontal
Border Radius: 8px
Font: 16px, 600 weight
Min Height: 44px (touch target)
Active State: Scale 0.97, Opacity 0.9
Disabled: Opacity 0.5, Cursor not-allowed
```

#### Secondary Button
```
Background: Surface (#F8F9FA / #1A1E27)
Text: Foreground (#1A1A1A / #F5F5F5)
Border: 1px solid Border (#E5E7EB / #374151)
Padding: 12px vertical, 16px horizontal
Border Radius: 8px
Font: 16px, 600 weight
Active State: Opacity 0.8
```

#### Icon Button
```
Size: 44×44px minimum
Icon Size: 24px
Background: Transparent
Active State: Opacity 0.6
Padding: 10px (to center icon)
```

### Cards

#### Standard Card
```
Background: Surface
Border: 1px solid Border
Border Radius: 12px
Padding: 16px
Shadow: None (light mode), subtle on dark
Spacing Between Cards: 16px
```

#### Elevated Card (Premium)
```
Background: Surface with 5% Accent overlay
Border: 1px solid Accent (#8B7355 / #A0826D)
Border Radius: 12px
Padding: 16px
Shadow: 0 4px 12px rgba(0,0,0,0.08)
```

### Input Fields

#### Text Input
```
Background: Surface
Border: 1px solid Border
Border Radius: 8px
Padding: 12px 16px
Font: 16px, 400 weight
Placeholder Color: Muted
Focus State: Border color changes to Primary
Min Height: 44px
```

#### Search Input
```
Background: Surface
Border: 1px solid Border
Border Radius: 8px
Padding: 12px 16px
Icon: Magnifying glass (24px)
Placeholder: "Search..."
Font: 16px
```

### Status Indicators

#### Status Dot
```
Active: 12px diameter, Success color (#10B981)
Idle: 12px diameter, Warning color (#F59E0B)
Maintenance: 12px diameter, Error color (#EF4444)
Offline: 12px diameter, Muted color (#6B7280)
Border Radius: 50% (circle)
```

### Badges & Tags

#### Severity Badge
```
Critical: Background Error, Text White, Padding 4px 8px, Border Radius 4px, Font 12px 500
Warning: Background Warning, Text White, Padding 4px 8px, Border Radius 4px, Font 12px 500
Info: Background Primary, Text White, Padding 4px 8px, Border Radius 4px, Font 12px 500
```

#### Filter Tag
```
Active: Background Primary, Text White, Padding 8px 16px, Border Radius 20px
Inactive: Background Surface, Border 1px Border, Text Foreground, Padding 8px 16px, Border Radius 20px
Font: 12px 600
```

### Dividers

```
Horizontal: 1px solid Border color
Margin: 12px vertical
Opacity: 100% on light, 50% on dark
```

---

## 6. Layout System

### Screen Layout Structure

```
┌─────────────────────────────────┐
│  Status Bar (System)            │ ← Safe area top
├─────────────────────────────────┤
│                                 │
│  Screen Content                 │
│  (Padding: 24px)                │
│                                 │
├─────────────────────────────────┤
│  Tab Bar (56px + safe area)     │ ← Safe area bottom
└─────────────────────────────────┘
```

### Safe Area Handling
- **Top Padding**: 24px (includes status bar clearance)
- **Side Padding**: 24px left/right
- **Bottom Padding**: 24px + safe area (for tab bar)
- **Tab Bar Height**: 56px + safe area bottom

### Grid System
- **Column Count**: 1 column (mobile portrait)
- **Gutter**: 16px between stacked elements
- **Max Width**: Full screen width (no max-width constraint)

### Responsive Breakpoints
- **Mobile**: 320px–480px (primary target)
- **Tablet**: 481px–768px (landscape, future)
- **Desktop**: 769px+ (web preview)

---

## 7. Interaction Patterns

### Press Feedback

| Element | Feedback | Implementation |
|---------|----------|----------------|
| **Primary Button** | Scale 0.97 + light haptic | `transform: scale(0.97)` + `Haptics.impactAsync(Light)` |
| **Secondary Button** | Opacity 0.8 | `opacity: 0.8` |
| **List Item / Card** | Opacity 0.7 | `opacity: 0.7` on press |
| **Icon / Minor Action** | Opacity 0.6 | `opacity: 0.6` on press |
| **Toggle / Switch** | Smooth animation + medium haptic | Animated transition + `Haptics.impactAsync(Medium)` |

### Haptic Feedback

| Context | Type | Timing |
|---------|------|--------|
| **Button Tap (Primary)** | Light impact | Immediate on press |
| **Toggle / Switch** | Medium impact | On state change |
| **Success / Completion** | Success notification | After action completes |
| **Error / Failure** | Error notification | Immediately on error |
| **Long Press** | Heavy impact | On long press trigger |

### Animation Guidelines

| Animation | Duration | Easing | Use Case |
|-----------|----------|--------|----------|
| **Press Feedback** | 80ms | ease-out | Button/card interactions |
| **Fade In** | 250ms | ease-in-out | Screen transitions, modals |
| **Slide Up** | 300ms | ease-out | Bottom sheets, drawers |
| **Scale** | 150ms | ease-out | Expand/collapse sections |
| **Opacity** | 200ms | ease-in-out | Hover states, transitions |

**Animation Rules:**
- Keep animations subtle (never bouncy or dramatic)
- Scale changes: 0.95–0.98 range (never below 0.9)
- Prefer `withTiming` with easing over `withSpring`
- Don't animate on mount unless it adds meaning
- Maximum animation duration: 400ms

---

## 8. Navigation Patterns

### Tab Bar Navigation

```
┌─────────────────────────────────┐
│  Dashboard  │  Fleet  │  Alerts │
│  (home)     │ (send)  │ (bell)  │
│   Active    │ Inactive│ Inactive│
└─────────────────────────────────┘
```

**Tab Bar Specifications:**
- **Height**: 56px + safe area bottom
- **Active Icon Color**: Primary (#2C3E50)
- **Inactive Icon Color**: Muted (#6B7280)
- **Icon Size**: 28px
- **Label Font**: 12px, 500 weight
- **Background**: Background color
- **Border**: 0.5px top border (Border color)
- **Padding**: 8px top, safe area bottom

### Navigation Hierarchy
1. **Tab Bar** (primary navigation): Dashboard, Fleet, Alerts, Profile
2. **Screen Content** (secondary): Drill-down from list items
3. **Modal Sheets** (tertiary): Detailed views, forms

---

## 9. Screen Specifications

### Dashboard Screen

**Layout Structure:**
```
Header (gap: 8px)
  ├─ Title: "Fleet Overview" (Display, 32px)
  └─ Subtitle: "Moonstonelk.com Fleet Management" (Body Small, 14px, Muted)

Fleet Summary Cards (gap: 16px)
  ├─ Total Vehicles Card
  │   ├─ Label: "TOTAL VEHICLES" (Caption, 12px, Muted, uppercase)
  │   └─ Value: "24 vehicles" (Display + Body Small)
  └─ Status Row (flex-row, gap: 16px)
      ├─ Active Card (flex: 1)
      └─ Idle Card (flex: 1)

Today's Activity (gap: 12px)
  ├─ Title: "Today's Activity" (Body Small, 14px, Semibold)
  └─ Metrics Card
      ├─ Total Distance: "1,240 km"
      ├─ Fuel Consumed: "156 L"
      └─ Active Alerts: "3"

Recent Activity (gap: 16px)
  ├─ Title: "Recent Activity"
  └─ Activity List (5 items max)
      ├─ Vehicle ID + Action
      ├─ Timestamp
      └─ Divider between items

Quick Actions (gap: 12px)
  ├─ Primary Button: "View Fleet"
  └─ Secondary Button: "Alerts"
```

**Color Application:**
- Card backgrounds: Surface
- Borders: Border color
- Status dots: Success (active), Warning (idle), Error (maintenance)
- Text hierarchy: Foreground (primary), Muted (secondary)

### Fleet Overview Screen

**Layout Structure:**
```
Header (gap: 8px)
  ├─ Title: "Fleet" (Display, 32px)
  └─ Count: "8 vehicles" (Body Small, 14px, Muted)

Search Bar
  ├─ Input: "Search by plate or ID..."
  └─ Placeholder color: Muted

Filter Tabs (flex-row, gap: 8px)
  ├─ All (active: Primary, inactive: Surface + Border)
  ├─ Active
  ├─ Idle
  └─ Maintenance

Vehicle List (gap: 12px)
  └─ Vehicle Card (repeating)
      ├─ Header row: Plate + Status badge
      ├─ Location: "Colombo"
      ├─ Driver: "Kamal Silva"
      └─ Last Update: "2 min ago"
```

**Card Details:**
- Status indicator dot (3px diameter)
- Plate number: Body, 16px, Semibold
- Vehicle ID: Body Small, 14px, Muted
- Status badge: Background color, 12px font, uppercase

### Alerts Screen

**Layout Structure:**
```
Header (gap: 8px)
  ├─ Title: "Alerts" (Display, 32px)
  └─ Count: "5 active alerts" (Body Small, 14px, Muted)

Alert Stats (flex-row, gap: 12px)
  ├─ Critical: Error color, count
  ├─ Warning: Warning color, count
  └─ Info: Primary color, count

Alerts List (gap: 12px, sorted by severity)
  └─ Alert Card (repeating)
      ├─ Icon + Severity indicator
      ├─ Plate + Vehicle ID
      ├─ Message text
      ├─ Driver + Timestamp
      └─ Dismiss button
```

**Severity Colors:**
- Critical: Error (#EF4444)
- Warning: Warning (#F59E0B)
- Info: Primary (#2C3E50)

### Profile Screen

**Layout Structure:**
```
Header (gap: 8px)
  ├─ Title: "Settings" (Display, 32px)
  └─ Subtitle: "Manage your preferences" (Body Small, 14px, Muted)

Account Section
  ├─ Section Label: "ACCOUNT" (Caption, uppercase)
  └─ Info Card
      ├─ Name: "Kamal Silva"
      ├─ Company: "Moonstonelk.com"
      ├─ Role: "Fleet Manager"
      └─ Email: "kamal@moonstonelk.com"

Preferences Section
  ├─ Section Label: "PREFERENCES"
  ├─ Dark Mode Toggle
  ├─ Notifications Toggle
  └─ Fleet Alerts Toggle

Units Section
  ├─ Section Label: "UNITS"
  ├─ Kilometers Button (active: Primary, inactive: Surface)
  └─ Miles Button

About Section
  ├─ Section Label: "ABOUT"
  └─ Info Card
      ├─ App Version: "1.0.0"
      ├─ Company: "Moonstonelk.com"
      └─ Build Date: "March 13, 2026"

Logout Button (Error background, full width)
```

---

## 10. Dark Mode Implementation

### CSS Variables Approach
```css
:root:not([data-theme="dark"]) {
  --color-primary: #2C3E50;
  --color-background: #FFFFFF;
  --color-surface: #F8F9FA;
  --color-foreground: #1A1A1A;
  --color-muted: #6B7280;
  --color-border: #E5E7EB;
  --color-success: #10B981;
  --color-warning: #F59E0B;
  --color-error: #EF4444;
  --color-accent: #8B7355;
}

:root[data-theme="dark"] {
  --color-primary: #2C3E50;
  --color-background: #0F1419;
  --color-surface: #1A1E27;
  --color-foreground: #F5F5F5;
  --color-muted: #9CA3AF;
  --color-border: #374151;
  --color-success: #34D399;
  --color-warning: #FBBF24;
  --color-error: #F87171;
  --color-accent: #A0826D;
}
```

### Tailwind Configuration
```javascript
const tailwindColors = {
  primary: { DEFAULT: 'var(--color-primary)' },
  background: { DEFAULT: 'var(--color-background)' },
  surface: { DEFAULT: 'var(--color-surface)' },
  foreground: { DEFAULT: 'var(--color-foreground)' },
  muted: { DEFAULT: 'var(--color-muted)' },
  border: { DEFAULT: 'var(--color-border)' },
  success: { DEFAULT: 'var(--color-success)' },
  warning: { DEFAULT: 'var(--color-warning)' },
  error: { DEFAULT: 'var(--color-error)' },
  accent: { DEFAULT: 'var(--color-accent)' },
};
```

---

## 11. Accessibility Guidelines

### Color Contrast
- **WCAG AA**: Minimum 4.5:1 for normal text, 3:1 for large text
- **WCAG AAA**: Minimum 7:1 for normal text, 4.5:1 for large text
- **All text colors** in this system meet WCAG AAA standards

### Touch Targets
- **Minimum Size**: 44×44 points (Apple HIG standard)
- **Recommended Size**: 48×48 points for frequently used controls
- **Spacing**: 8px minimum between touch targets

### Readability
- **Font Size**: Never smaller than 12px
- **Line Height**: 1.4–1.5× font size
- **Line Length**: 44–66 characters for optimal readability
- **Text Alignment**: Left-aligned for body text (never justified)

### Motion & Animation
- **Respect Prefers-Reduced-Motion**: Disable animations if user has set this preference
- **Animation Duration**: 80–400ms (never longer)
- **Avoid Flashing**: Never flash more than 3 times per second

### Keyboard Navigation
- **Tab Order**: Logical, left-to-right, top-to-bottom
- **Focus Indicators**: Visible 2px outline in Primary color
- **Escape Key**: Close modals and overlays
- **Enter Key**: Submit forms and activate buttons

---

## 12. Icon System

### Icon Library
- **Source**: Material Icons (mapped to SF Symbols on iOS)
- **Size**: 24px (standard), 28px (tab bar), 32px (hero)
- **Weight**: Regular (400)
- **Color**: Inherit from parent (Primary, Muted, etc.)

### Icon Mappings

| SF Symbol | Material Icon | Usage |
|-----------|---------------|-------|
| house.fill | home | Dashboard tab |
| paperplane.fill | send | Fleet tab |
| bell.fill | notifications-active | Alerts tab |
| person.fill | person | Profile tab |
| chevron.right | chevron-right | Navigation forward |
| chevron.left | chevron-left | Navigation back |
| magnifying-glass | search | Search input |
| exclamation.circle.fill | error | Error state |
| checkmark.circle.fill | check-circle | Success state |

---

## 13. Data Visualization

### Status Indicators
```
Active:       ● (Success color, #10B981)
Idle:         ● (Warning color, #F59E0B)
Maintenance:  ● (Error color, #EF4444)
Offline:      ● (Muted color, #6B7280)
```

### Metric Display
```
Large Metric: 32px, 700 weight, Primary color
Label:        12px, 500 weight, Muted color
Unit:         14px, 400 weight, Muted color
```

### List Item Anatomy
```
┌─────────────────────────────────┐
│ ● Plate Number          Status  │
│   Vehicle ID                    │
│   Location: Colombo             │
│   Driver: Kamal Silva           │
│   Last Update: 2 min ago        │
└─────────────────────────────────┘
```

---

## 14. Form Design

### Form Field Spacing
- **Between Fields**: 12px gap
- **Label to Input**: 8px gap
- **Field Height**: 44px minimum
- **Padding**: 12px vertical, 16px horizontal

### Form Field States

| State | Background | Border | Text Color |
|-------|-----------|--------|-----------|
| **Default** | Surface | Border | Foreground |
| **Focused** | Surface | Primary | Foreground |
| **Filled** | Surface | Border | Foreground |
| **Disabled** | Surface (50% opacity) | Border (50% opacity) | Muted |
| **Error** | Surface | Error | Error |

### Form Validation
- **Error Message**: 12px, Error color, appears below field
- **Success Checkmark**: 24px, Success color, appears right of field
- **Inline Validation**: Show error immediately on blur

---

## 15. Branding Elements

### Logo & Icon
- **Logo Type**: Moonstone gemstone (cabochon cut)
- **Colors**: Slate gray (#2C3E50), Silver (#C0C0C0), White (#F5F5F5)
- **Reflections**: Iridescent blue and purple hints
- **Usage**: App icon, splash screen, hero sections
- **Minimum Size**: 44×44px (app icon), 200×200px (splash)

### Brand Colors
- **Primary Brand Color**: Slate Gray (#2C3E50)
- **Secondary Brand Color**: Moonstone Brown (#8B7355)
- **Accent Color**: Emerald (#10B981)

### Typography in Branding
- **Brand Name**: "Moonstone Fleet"
- **Company**: "Moonstonelk.com"
- **Tagline**: "Fleet Management for Sri Lanka"

---

## 16. Micro-interactions & Feedback

### Loading States
```
Skeleton Loader: 12px rounded rectangles, Muted color, 50% opacity
Pulse Animation: Opacity 0.5 → 1.0, 1.5s duration, infinite
Spinner: 24px circular progress, Primary color
```

### Empty States
```
Icon: 48px, Muted color
Title: "No Results" (Heading 3)
Subtitle: "Try adjusting your filters" (Body Small, Muted)
Action Button: Optional "Clear Filters" button
```

### Success States
```
Checkmark: ✓ (32px, Success color)
Message: "Action completed" (Body, Success color)
Duration: Show for 2–3 seconds, then dismiss
Haptic: Success notification feedback
```

### Error States
```
Icon: ⚠ (32px, Error color)
Message: "Something went wrong" (Body, Error color)
Action: "Retry" button or "Dismiss" button
Haptic: Error notification feedback
```

---

## 17. Responsive Behavior

### Mobile (320px–480px)
- **Full-width layouts** (no max-width)
- **Single column** for all content
- **Bottom tab navigation** (not top)
- **Stacked buttons** (full width)
- **Larger touch targets** (44px minimum)

### Tablet (481px–768px)
- **Two-column layouts** where appropriate
- **Side-by-side cards** (e.g., Active/Idle status)
- **Landscape support** (future)

### Desktop (769px+)
- **Three-column layouts**
- **Sidebar navigation** (optional)
- **Wider cards** with max-width constraints

---

## 18. Performance & Optimization

### Image Optimization
- **App Icon**: 1024×1024px PNG (compressed)
- **Splash Screen**: 1024×1024px PNG (optimized)
- **List Thumbnails**: 64×64px (lazy loaded)
- **Format**: WebP for web, PNG for native

### Animation Performance
- **Use GPU acceleration**: `transform` and `opacity` only
- **Avoid**: `width`, `height`, `margin`, `padding` animations
- **FPS Target**: 60fps on mobile devices

### Bundle Size
- **Target**: <5MB for initial load
- **Code Splitting**: Lazy load screens as needed
- **Tree Shaking**: Remove unused dependencies

---

## 19. Localization & Internationalization

### Text Sizing for Localization
- **English**: Baseline (100%)
- **German**: +10–15% (longer words)
- **Chinese**: -5–10% (more compact)
- **Arabic**: Mirror layout (RTL support)

### Number Formatting
- **Distances**: "1,240 km" (comma separator)
- **Fuel**: "156 L" (space before unit)
- **Time**: "2 min ago" (relative format)
- **Dates**: "March 13, 2026" (locale-specific)

---

## 20. Design Tokens (CSS/Tailwind)

### Complete Token Map
```javascript
const tokens = {
  // Colors
  colors: {
    primary: '#2C3E50',
    background: '#FFFFFF',
    surface: '#F8F9FA',
    foreground: '#1A1A1A',
    muted: '#6B7280',
    border: '#E5E7EB',
    success: '#10B981',
    warning: '#F59E0B',
    error: '#EF4444',
    accent: '#8B7355',
  },
  
  // Typography
  typography: {
    fontFamily: 'Inter, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto',
    fontSize: {
      xs: '12px',
      sm: '14px',
      base: '16px',
      lg: '18px',
      xl: '20px',
      '2xl': '24px',
      '3xl': '28px',
      '4xl': '32px',
    },
    fontWeight: {
      regular: 400,
      medium: 500,
      semibold: 600,
      bold: 700,
    },
    lineHeight: {
      tight: 1.2,
      normal: 1.4,
      relaxed: 1.5,
    },
  },
  
  // Spacing
  spacing: {
    xs: '4px',
    sm: '8px',
    md: '12px',
    lg: '16px',
    xl: '24px',
    '2xl': '32px',
    '3xl': '48px',
  },
  
  // Border Radius
  borderRadius: {
    sm: '4px',
    md: '8px',
    lg: '12px',
    full: '9999px',
  },
  
  // Shadows
  boxShadow: {
    none: 'none',
    sm: '0 1px 2px rgba(0, 0, 0, 0.05)',
    md: '0 4px 6px rgba(0, 0, 0, 0.1)',
    lg: '0 10px 15px rgba(0, 0, 0, 0.1)',
  },
};
```

---

## 21. Implementation Checklist

Use this checklist when recreating the design in another platform:

### Color System
- [ ] Define primary color (#2C3E50) and all accent colors
- [ ] Set up light/dark mode color variables
- [ ] Verify WCAG AA contrast ratios
- [ ] Implement CSS variables or design system equivalent

### Typography
- [ ] Install Inter font (or system fallback)
- [ ] Define type scale (Display, H1, H2, Body, Caption)
- [ ] Set line heights (1.2–1.5× font size)
- [ ] Configure font weights (400, 500, 600, 700)

### Spacing
- [ ] Define 4px grid system
- [ ] Create spacing scale (4px, 8px, 12px, 16px, 24px, 32px, 48px)
- [ ] Apply consistent padding to screens (24px)
- [ ] Set gaps between components (16px for cards, 12px for fields)

### Components
- [ ] Build primary button (Primary bg, white text, 44px height)
- [ ] Build secondary button (Surface bg, border, Foreground text)
- [ ] Create card component (Surface bg, Border, 12px radius)
- [ ] Build input field (44px height, 16px padding)
- [ ] Create status indicator dots (3px, colored)

### Navigation
- [ ] Set up tab bar (56px height, 4 tabs)
- [ ] Configure active/inactive tab colors
- [ ] Add icon mappings (home, send, bell, person)
- [ ] Implement safe area handling

### Screens
- [ ] Build Dashboard (summary cards, activity feed)
- [ ] Build Fleet Overview (search, filter, vehicle list)
- [ ] Build Alerts (severity badges, dismiss actions)
- [ ] Build Profile (user info, preferences, toggles)

### Interactions
- [ ] Add press feedback (scale 0.97 for buttons, opacity 0.7 for lists)
- [ ] Implement haptic feedback (light for buttons, medium for toggles)
- [ ] Configure animations (80–400ms duration)
- [ ] Add loading/empty/error states

### Accessibility
- [ ] Verify color contrast (4.5:1 minimum)
- [ ] Ensure touch targets (44×44px minimum)
- [ ] Test keyboard navigation
- [ ] Check for motion sensitivity (prefers-reduced-motion)

### Testing
- [ ] Test on iOS (light & dark mode)
- [ ] Test on Android (light & dark mode)
- [ ] Test on web (responsive)
- [ ] Verify all interactions work
- [ ] Check accessibility compliance

---

## 22. Design System Files & Assets

### Required Assets
1. **App Icon**: `icon.png` (1024×1024px, square, no rounded corners)
2. **Splash Icon**: `splash-icon.png` (200×200px, centered)
3. **Favicon**: `favicon.png` (192×192px, web)
4. **Android Foreground**: `android-icon-foreground.png` (1024×1024px)

### Design Files
- **Figma**: Design system file with all components
- **Storybook**: Component documentation and playground
- **Design Tokens**: JSON/YAML file with all tokens

### Documentation
- **This Document**: Complete UX/UI design system
- **Component Library**: Detailed specs for each component
- **Interaction Guide**: Animation and feedback specifications

---

## 23. Common Pitfalls & Solutions

| Pitfall | Solution |
|---------|----------|
| **Text too small** | Never use font size < 12px; use 14px minimum for body text |
| **Insufficient spacing** | Use 4px grid; minimum 12px gaps between elements |
| **Poor contrast** | Test all text colors; aim for WCAG AAA (7:1) |
| **Inconsistent buttons** | Use 44px minimum height; consistent padding (12px/16px) |
| **Unresponsive touch targets** | Ensure 44×44px minimum; 8px spacing between targets |
| **Clashing colors** | Use primary/secondary/accent hierarchy; avoid random color usage |
| **Slow animations** | Keep duration 80–400ms; use GPU-accelerated properties only |
| **Dark mode issues** | Use CSS variables; test both modes thoroughly |
| **Accessibility ignored** | Always verify contrast, touch targets, and keyboard nav |
| **Overloaded screens** | Follow hierarchy; use cards and sections to break up content |

---

## 24. Quick Reference Guide

### Color Palette (Quick Copy)
```
Primary:     #2C3E50
Background:  #FFFFFF / #0F1419
Surface:     #F8F9FA / #1A1E27
Foreground:  #1A1A1A / #F5F5F5
Muted:       #6B7280 / #9CA3AF
Border:      #E5E7EB / #374151
Success:     #10B981 / #34D399
Warning:     #F59E0B / #FBBF24
Error:       #EF4444 / #F87171
Accent:      #8B7355 / #A0826D
```

### Spacing Scale (Quick Copy)
```
4px, 8px, 12px, 16px, 24px, 32px, 48px
```

### Type Scale (Quick Copy)
```
Display:  32px 700 1.2
H1:       28px 700 1.3
H2:       24px 600 1.3
H3:       20px 600 1.4
Body:     16px 400 1.5
Caption:  12px 500 1.4
```

### Button Specs (Quick Copy)
```
Primary:   Primary bg, white text, 44px height, 12px/16px padding
Secondary: Surface bg, border, Foreground text, 44px height
Icon:      44×44px, 24px icon, transparent bg
```

---

## Conclusion

This design system provides a complete, reproducible blueprint for the Moonstone Fleet Management app. Every color, spacing, typography, and interaction decision is documented and justified. Use this document to:

1. **Recreate the design** in any platform (Figma, Adobe XD, web, mobile)
2. **Maintain consistency** across teams and projects
3. **Onboard new designers** with clear specifications
4. **Extend the system** with new components following established patterns
5. **Audit designs** against the system for compliance

For questions or clarifications, refer to the design philosophy and principles at the beginning of this document.

---

**Document Version**: 1.0  
**Last Updated**: March 13, 2026  
**Platform**: React Native (Expo) / Web  
**Status**: Production Ready
