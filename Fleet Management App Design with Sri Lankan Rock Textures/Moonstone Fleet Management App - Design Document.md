# Moonstone Fleet Management App - Design Document

## Overview

A modern, clean, and intuitive fleet management application for Moonstonelk.com owners and fleet managers. The app prioritizes clarity, ease of use, and minimal visual clutter while incorporating Sri Lankan rock texture aesthetics and the iconic moonstone branding.

---

## Design Philosophy

- **Modern & Clean**: Minimalist interface with ample whitespace
- **Functional First**: Every element serves a purpose; no decorative clutter
- **Sri Lankan Heritage**: Rock textures and moonstone imagery woven throughout
- **One-Handed Usage**: Portrait orientation (9:16) optimized for thumb navigation
- **Apple HIG Alignment**: First-party iOS app feel and interaction patterns

---

## Color Palette

Inspired by Sri Lankan rock textures (granite, gneiss, limestone):

| Token | Light Mode | Dark Mode | Usage |
|-------|-----------|----------|-------|
| **Primary** | #2C3E50 (Slate Gray) | #2C3E50 | Action buttons, key highlights |
| **Background** | #FFFFFF (Pure White) | #0F1419 (Deep Charcoal) | Screen backgrounds |
| **Surface** | #F8F9FA (Off-White) | #1A1E27 (Dark Slate) | Cards, elevated surfaces |
| **Foreground** | #1A1A1A (Near Black) | #F5F5F5 (Light Gray) | Primary text |
| **Muted** | #6B7280 (Medium Gray) | #9CA3AF (Soft Gray) | Secondary text, hints |
| **Border** | #E5E7EB (Light Gray) | #374151 (Dark Gray) | Dividers, borders |
| **Success** | #10B981 (Emerald) | #34D399 (Light Emerald) | Active status, confirmations |
| **Warning** | #F59E0B (Amber) | #FBBF24 (Light Amber) | Alerts, cautions |
| **Error** | #EF4444 (Red) | #F87171 (Light Red) | Errors, critical alerts |
| **Accent** | #8B7355 (Moonstone Brown) | #A0826D (Light Moonstone) | Secondary highlights, texture accents |

---

## Typography

- **Font Family**: Inter (system default fallback: -apple-system, BlinkMacSystemFont)
- **Font Weights**: 400 (Regular), 500 (Medium), 600 (Semibold), 700 (Bold)

| Element | Size | Weight | Line Height | Usage |
|---------|------|--------|-------------|-------|
| **Display** | 32px | 700 | 1.2 | Screen titles, hero sections |
| **Heading 1** | 28px | 700 | 1.3 | Major section titles |
| **Heading 2** | 24px | 600 | 1.3 | Subsection titles |
| **Heading 3** | 20px | 600 | 1.4 | Card titles, labels |
| **Body Large** | 18px | 400 | 1.5 | Primary body text |
| **Body** | 16px | 400 | 1.5 | Standard body text |
| **Body Small** | 14px | 400 | 1.5 | Secondary text, metadata |
| **Caption** | 12px | 500 | 1.4 | Hints, timestamps, badges |

---

## Screen List

### 1. **Dashboard (Home)**
- **Purpose**: Owner/manager overview of entire fleet at a glance
- **Key Content**:
  - Fleet summary card: Total vehicles, active vehicles, idle vehicles
  - Quick stats: Total distance today, fuel consumption, alerts count
  - Recent activity feed: Last 5 vehicle movements/events
  - Quick action buttons: Add vehicle, view full fleet, settings
- **Functionality**: Tap to drill down into details, pull-to-refresh for live updates

### 2. **Fleet Overview**
- **Purpose**: Comprehensive list of all vehicles with status
- **Key Content**:
  - Vehicle cards in a list (FlatList):
    - Vehicle name/plate number
    - Current status (Active/Idle/Maintenance)
    - Last location (city/area)
    - Last activity timestamp
    - Status indicator (green/amber/red dot)
  - Filter/sort options: By status, by driver, by vehicle type
  - Search bar for quick vehicle lookup
- **Functionality**: Tap card to view vehicle details, swipe for quick actions (call driver, view route)

### 3. **Vehicle Detail**
- **Purpose**: Deep dive into a single vehicle's data and history
- **Key Content**:
  - Vehicle header: Name, plate, photo, current status
  - Live tracking section: Map view (if available), current location, speed
  - Vehicle metrics:
    - Fuel level / consumption rate
    - Mileage / distance traveled today
    - Engine hours
    - Maintenance status
  - Driver info: Name, phone, current assignment
  - Recent trips: List of last 10 trips with timestamps, distances, fuel used
  - Alerts/issues: Any active maintenance alerts or warnings
- **Functionality**: Tap to expand sections, call driver button, view trip details

### 4. **Alerts & Notifications**
- **Purpose**: Centralized view of all fleet-wide alerts and issues
- **Key Content**:
  - Alert categories: Maintenance due, fuel low, speeding, idle time, offline
  - Alert list with severity badges (red/amber/green)
  - Timestamp and affected vehicle
  - Quick action buttons: Mark as resolved, view vehicle, contact driver
- **Functionality**: Tap to dismiss or escalate, filter by severity/type

### 5. **Profile / Settings**
- **Purpose**: User preferences, account info, and app configuration
- **Key Content**:
  - User info: Name, company, role
  - Notification preferences: Toggle alerts by type
  - Theme: Light/dark mode toggle
  - Units: Kilometers/miles, liters/gallons
  - About: App version, company info
  - Logout button
- **Functionality**: Toggle switches, navigation to sub-settings

---

## Primary User Flows

### Flow 1: Check Fleet Status (30 seconds)
1. User opens app → Dashboard loads
2. Scans summary cards (total vehicles, alerts)
3. Taps "View Fleet" if action needed
4. Sees vehicle list filtered by status
5. Taps a vehicle card to drill into details

### Flow 2: Respond to Alert (1-2 minutes)
1. User sees notification badge on Alerts tab
2. Opens Alerts screen
3. Sees prioritized list (red/amber first)
4. Taps alert → Vehicle detail screen opens
5. Calls driver or marks issue as resolved

### Flow 3: Track a Vehicle (2-3 minutes)
1. User opens Fleet Overview
2. Searches for vehicle by plate or name
3. Taps vehicle card → Detail screen
4. Views live location on map
5. Checks recent trip history
6. Calls driver if needed

---

## Key Design Decisions

### Spacing & Layout
- **Padding**: 16px standard (4px grid system)
- **Card radius**: 12px (modern, not too rounded)
- **Gaps between sections**: 24px (breathing room)
- **List item height**: 72px (comfortable tap target, ~1.5x finger width)

### Interaction Feedback
- **Button press**: Scale to 0.97 + light haptic
- **List item tap**: Opacity 0.7
- **Toggle switch**: Smooth animation, medium haptic
- **Swipe actions**: Slide to reveal (call, view route, etc.)

### Information Hierarchy
- **Primary**: Vehicle status, alerts, key metrics (largest, boldest)
- **Secondary**: Metadata, timestamps, driver info (medium size, muted color)
- **Tertiary**: Hints, help text (smallest, lightest color)

### Rock Texture Integration
- **Subtle backgrounds**: Use granite/gneiss texture as faint background on cards (5-10% opacity)
- **Accent borders**: Moonstone brown (#8B7355) used for premium/important card borders
- **Gradient overlays**: Soft gray-to-slate gradients on section headers
- **Icon styling**: Slate gray primary icons with moonstone accent highlights

---

## Accessibility & Responsiveness

- **Minimum tap target**: 44x44 points (Apple HIG standard)
- **Color contrast**: WCAG AA minimum (4.5:1 for text)
- **Font scaling**: Respects system text size settings
- **Dark mode**: Full support with automatic color switching
- **Landscape**: Not required for initial release (portrait only)

---

## Technical Notes

- **Framework**: React Native (Expo)
- **Styling**: NativeWind (Tailwind CSS)
- **State**: React Context + AsyncStorage (local), with optional server sync
- **Navigation**: Expo Router (tab-based + stack navigation)
- **Icons**: Material Icons (mapped to SF Symbols on iOS)

---

## Next Steps

1. Build Dashboard screen with summary cards
2. Implement Fleet Overview with vehicle list
3. Create Vehicle Detail screen with drill-down
4. Add Alerts management
5. Build Profile/Settings
6. Integrate mock data or real API endpoints
7. Test end-to-end flows on device
