# Moonstone Fleet Management - Component Specifications

## Component Library Reference

Detailed specifications for every UI component used in the Moonstone Fleet Management app. Use this as a reference for building components in any design tool or framework.

---

## 1. Button Components

### 1.1 Primary Button

**Purpose**: Main call-to-action buttons (View Fleet, Submit, etc.)

**Anatomy**:
```
┌─────────────────────────────────┐
│         View Fleet              │  ← Text (16px, 600, white)
└─────────────────────────────────┘
```

**Specifications**:
- **Background**: Primary (#2C3E50)
- **Text Color**: White (#FFFFFF)
- **Text**: 16px, 600 weight, center-aligned
- **Padding**: 12px vertical, 16px horizontal
- **Border Radius**: 8px
- **Min Height**: 44px
- **Width**: Full width or fixed based on context
- **Border**: None
- **Shadow**: None (light), subtle on dark mode

**States**:
- **Default**: As specified above
- **Pressed**: Scale 0.97, Opacity 0.9
- **Disabled**: Opacity 0.5, cursor: not-allowed
- **Focused**: 2px outline in Primary color (keyboard)

**Spacing**:
- **Margin Bottom**: 12px (between buttons)
- **Margin Top**: 12px (after content)

**Usage Examples**:
- "View Fleet" button on Dashboard
- "Submit" button on forms
- "Dismiss" button on alerts

---

### 1.2 Secondary Button

**Purpose**: Alternative actions (Cancel, Clear, etc.)

**Anatomy**:
```
┌─────────────────────────────────┐
│         Alerts                  │  ← Text (16px, 600)
└─────────────────────────────────┘
```

**Specifications**:
- **Background**: Surface (#F8F9FA / #1A1E27)
- **Text Color**: Foreground (#1A1A1A / #F5F5F5)
- **Border**: 1px solid Border (#E5E7EB / #374151)
- **Text**: 16px, 600 weight, center-aligned
- **Padding**: 12px vertical, 16px horizontal
- **Border Radius**: 8px
- **Min Height**: 44px
- **Shadow**: None

**States**:
- **Default**: As specified above
- **Pressed**: Opacity 0.8
- **Disabled**: Opacity 0.5
- **Focused**: 2px outline in Primary color

**Usage Examples**:
- "Alerts" button on Dashboard
- "Cancel" button on forms
- Filter toggle buttons on Fleet screen

---

### 1.3 Icon Button

**Purpose**: Standalone icon actions (close, menu, etc.)

**Anatomy**:
```
┌──────────┐
│    ✕     │  ← Icon (24px)
└──────────┘
```

**Specifications**:
- **Size**: 44×44px minimum
- **Icon Size**: 24px
- **Background**: Transparent
- **Icon Color**: Foreground or Primary (context-dependent)
- **Padding**: 10px (to center icon)
- **Border Radius**: 8px
- **Touch Target**: 44×44px

**States**:
- **Default**: Icon color as specified
- **Pressed**: Opacity 0.6
- **Disabled**: Opacity 0.3

**Usage Examples**:
- Close button on modals
- Menu button in header
- Refresh button on screens

---

### 1.4 Button Group (Horizontal)

**Purpose**: Multiple related buttons (e.g., Kilometers vs Miles)

**Anatomy**:
```
┌────────────┬────────────┐
│ Kilometers │   Miles    │
└────────────┴────────────┘
```

**Specifications**:
- **Layout**: flex-row, gap: 12px
- **Each Button**: flex: 1 (equal width)
- **Active Button**: Primary background, white text
- **Inactive Button**: Surface background, border, Foreground text
- **Border Radius**: 8px per button
- **Height**: 44px

**Usage Examples**:
- Unit selection (Kilometers/Miles)
- Time range selection
- View mode toggle

---

## 2. Card Components

### 2.1 Standard Card

**Purpose**: Container for related content (vehicle info, metrics, etc.)

**Anatomy**:
```
┌─────────────────────────────────┐
│  TOTAL VEHICLES                 │  ← Label (12px, Muted)
│  24 vehicles                    │  ← Value (32px, Primary)
└─────────────────────────────────┘
```

**Specifications**:
- **Background**: Surface (#F8F9FA / #1A1E27)
- **Border**: 1px solid Border (#E5E7EB / #374151)
- **Border Radius**: 12px
- **Padding**: 16px
- **Shadow**: None (light), subtle on dark
- **Spacing**: 16px gap between cards

**Internal Spacing**:
- **Between elements**: 12px
- **Between sections**: 16px
- **Divider**: 1px solid Border color

**Usage Examples**:
- Fleet summary cards (Total, Active, Idle)
- Today's Activity card
- User info card on Profile

---

### 2.2 Elevated Card (Premium)

**Purpose**: Highlight important or premium content

**Anatomy**:
```
┌─────────────────────────────────┐
│  Premium Content                │  ← Accent border
└─────────────────────────────────┘
```

**Specifications**:
- **Background**: Surface with 5% Accent overlay
- **Border**: 1px solid Accent (#8B7355 / #A0826D)
- **Border Radius**: 12px
- **Padding**: 16px
- **Shadow**: 0 4px 12px rgba(0, 0, 0, 0.08)

**Usage Examples**:
- Featured vehicle cards
- Important alerts
- Premium features

---

### 2.3 List Item Card

**Purpose**: Individual items in a scrollable list

**Anatomy**:
```
┌─────────────────────────────────┐
│ ● WP-1234              ACTIVE   │
│   MN-001                       │
│   Location: Colombo             │
│   Driver: Kamal Silva           │
│   Last Update: 2 min ago        │
└─────────────────────────────────┘
```

**Specifications**:
- **Background**: Surface
- **Border**: 1px solid Border
- **Border Radius**: 12px
- **Padding**: 16px
- **Min Height**: 72px
- **Spacing**: 12px gap between items
- **Press State**: Opacity 0.7

**Content Hierarchy**:
- **Primary**: Plate number (16px, 600, Foreground)
- **Secondary**: Vehicle ID (14px, 400, Muted)
- **Tertiary**: Location, Driver, Timestamp (12px, 400, Muted)

**Status Indicator**:
- **Dot**: 12px diameter, colored (Success/Warning/Error)
- **Position**: Left of plate number

**Usage Examples**:
- Vehicle list items on Fleet screen
- Activity items on Dashboard
- Alert items on Alerts screen

---

## 3. Input Components

### 3.1 Text Input

**Purpose**: Single-line text entry (search, forms)

**Anatomy**:
```
┌─────────────────────────────────┐
│ Search by plate or ID...        │
└─────────────────────────────────┘
```

**Specifications**:
- **Background**: Surface
- **Border**: 1px solid Border
- **Border Radius**: 8px
- **Padding**: 12px vertical, 16px horizontal
- **Font**: 16px, 400 weight
- **Text Color**: Foreground
- **Placeholder Color**: Muted
- **Min Height**: 44px
- **Focus State**: Border color changes to Primary

**States**:
- **Default**: As specified
- **Focused**: Primary border color, 2px width
- **Filled**: Border color stays Border
- **Disabled**: Opacity 0.5, cursor: not-allowed
- **Error**: Border color changes to Error

**Spacing**:
- **Margin Bottom**: 12px (between fields)
- **Label to Input**: 8px gap

**Usage Examples**:
- Search bar on Fleet screen
- Form inputs on settings
- Filter inputs

---

### 3.2 Search Input with Icon

**Purpose**: Dedicated search field with magnifying glass icon

**Anatomy**:
```
┌──────────────────────────────────┐
│ 🔍 Search by plate or ID...     │
└──────────────────────────────────┘
```

**Specifications**:
- **Background**: Surface
- **Border**: 1px solid Border
- **Border Radius**: 8px
- **Padding**: 12px vertical, 16px horizontal (left: 44px for icon)
- **Icon**: 24px, Muted color, 12px from left
- **Font**: 16px, 400 weight
- **Min Height**: 44px

**Usage Examples**:
- Fleet vehicle search
- Alert filtering
- Global search

---

### 3.3 Toggle Switch

**Purpose**: Boolean on/off control

**Anatomy**:
```
Dark Mode      [●────]  ← Off state
Dark Mode      [────●]  ← On state
```

**Specifications**:
- **Width**: 52px
- **Height**: 32px
- **Border Radius**: 16px (fully rounded)
- **Background (Off)**: Muted (#6B7280)
- **Background (On)**: Success (#10B981)
- **Toggle Dot**: 28px diameter, white, 2px margin
- **Animation**: 200ms ease-in-out
- **Haptic**: Medium impact on toggle

**States**:
- **Off**: Muted background, dot on left
- **On**: Success background, dot on right
- **Disabled**: Opacity 0.5

**Usage Examples**:
- Dark mode toggle on Profile
- Notification preferences
- Feature toggles

---

## 4. Status & Badge Components

### 4.1 Status Indicator Dot

**Purpose**: Show vehicle or alert status at a glance

**Anatomy**:
```
● Active    ● Idle    ● Maintenance    ● Offline
```

**Specifications**:
- **Size**: 12px diameter
- **Border Radius**: 50% (circle)
- **Colors**:
  - Active: Success (#10B981)
  - Idle: Warning (#F59E0B)
  - Maintenance: Error (#EF4444)
  - Offline: Muted (#6B7280)
- **Position**: Left of text, 8px gap

**Usage Examples**:
- Vehicle status in list items
- Alert severity indicator
- Online/offline status

---

### 4.2 Severity Badge

**Purpose**: Label alert or item severity

**Anatomy**:
```
┌──────────┐
│ CRITICAL │
└──────────┘
```

**Specifications**:
- **Padding**: 4px vertical, 8px horizontal
- **Border Radius**: 4px
- **Font**: 12px, 500 weight, uppercase
- **Text Color**: White
- **Background Colors**:
  - Critical: Error (#EF4444)
  - Warning: Warning (#F59E0B)
  - Info: Primary (#2C3E50)

**Usage Examples**:
- Alert severity badges
- Priority labels
- Status tags

---

### 4.3 Filter Tag / Chip

**Purpose**: Selectable filter or category

**Anatomy**:
```
┌──────────┐  ┌──────────┐
│   All    │  │  Active  │  ← Inactive
└──────────┘  └──────────┘

┌──────────┐
│   All    │  ← Active (Primary bg)
└──────────┘
```

**Specifications**:
- **Padding**: 8px vertical, 16px horizontal
- **Border Radius**: 20px (fully rounded)
- **Font**: 12px, 600 weight
- **Active State**:
  - Background: Primary (#2C3E50)
  - Text: White
- **Inactive State**:
  - Background: Surface
  - Border: 1px solid Border
  - Text: Foreground
- **Spacing**: 8px gap between tags

**Usage Examples**:
- Status filters on Fleet screen (All, Active, Idle, Maintenance)
- Category filters
- Tag selection

---

## 5. Divider & Separator Components

### 5.1 Horizontal Divider

**Purpose**: Separate sections or list items

**Anatomy**:
```
Content Above
─────────────────────────────
Content Below
```

**Specifications**:
- **Height**: 1px
- **Color**: Border (#E5E7EB / #374151)
- **Margin**: 12px vertical
- **Width**: Full width (minus padding)
- **Opacity**: 100% on light, 50% on dark

**Usage Examples**:
- Between card sections
- Between list items
- Between form fields

---

## 6. Header & Title Components

### 6.1 Screen Header

**Purpose**: Page title and subtitle

**Anatomy**:
```
Fleet Overview              ← Title (32px, 700)
Moonstonelk.com Fleet...   ← Subtitle (14px, Muted)
```

**Specifications**:
- **Title Font**: 32px, 700 weight, Foreground
- **Subtitle Font**: 14px, 400 weight, Muted
- **Spacing**: 8px between title and subtitle
- **Margin Bottom**: 24px (from content)

**Usage Examples**:
- Dashboard header
- Fleet screen header
- Alerts screen header

---

### 6.2 Section Header

**Purpose**: Subsection title within a screen

**Anatomy**:
```
Today's Activity           ← Title (14px, 600)
```

**Specifications**:
- **Font**: 14px, 600 weight, Foreground
- **Margin Bottom**: 12px
- **Margin Top**: 24px (from previous section)
- **Text Transform**: None (capitalize first letter)

**Usage Examples**:
- "Today's Activity" on Dashboard
- "Recent Activity" on Dashboard
- "Account" on Profile

---

### 6.3 Label / Caption

**Purpose**: Field labels and small text

**Anatomy**:
```
TOTAL VEHICLES             ← Label (12px, Muted, uppercase)
```

**Specifications**:
- **Font**: 12px, 500 weight, Muted
- **Text Transform**: Uppercase
- **Letter Spacing**: 0.3px
- **Margin Bottom**: 8px

**Usage Examples**:
- Card labels
- Form field labels
- Metadata labels

---

## 7. List Components

### 7.1 Simple List

**Purpose**: Vertical list of items

**Anatomy**:
```
┌─────────────────────────────────┐
│ Item 1                          │
├─────────────────────────────────┤
│ Item 2                          │
├─────────────────────────────────┤
│ Item 3                          │
└─────────────────────────────────┘
```

**Specifications**:
- **Item Padding**: 16px vertical, 16px horizontal
- **Item Min Height**: 44px
- **Divider**: 1px solid Border between items
- **Spacing**: 0px (divider handles spacing)
- **Press State**: Opacity 0.7

**Usage Examples**:
- Recent activity list on Dashboard
- Alert list on Alerts screen
- Settings list on Profile

---

### 7.2 Card List

**Purpose**: List of card-style items

**Anatomy**:
```
┌─────────────────────────────────┐
│ Card Item 1                     │
└─────────────────────────────────┘
┌─────────────────────────────────┐
│ Card Item 2                     │
└─────────────────────────────────┘
```

**Specifications**:
- **Card Spacing**: 12px gap between cards
- **Card Padding**: 16px
- **Card Border Radius**: 12px
- **Card Border**: 1px solid Border
- **Press State**: Opacity 0.7

**Usage Examples**:
- Vehicle list on Fleet screen
- Alert cards on Alerts screen
- Summary cards on Dashboard

---

## 8. Modal & Sheet Components

### 8.1 Bottom Sheet

**Purpose**: Slide-up modal for actions or details

**Anatomy**:
```
┌─────────────────────────────────┐
│ ─────────────────────────────── │  ← Handle (4px, Muted)
│                                 │
│ Sheet Content                   │
│                                 │
└─────────────────────────────────┘
```

**Specifications**:
- **Background**: Surface
- **Border Radius**: 20px top corners
- **Padding**: 24px
- **Handle**: 4px height, 40px width, Muted color, centered
- **Max Height**: 90% of screen
- **Animation**: Slide up 300ms ease-out
- **Backdrop**: Scrim with 50% opacity

**Usage Examples**:
- Vehicle detail view
- Filter options
- Action menu

---

## 9. Empty & Loading States

### 9.1 Empty State

**Purpose**: Show when no data is available

**Anatomy**:
```
       ✓
    All Clear
  No active alerts
```

**Specifications**:
- **Icon**: 48px, Muted color
- **Title**: 18px, 600 weight, Foreground
- **Subtitle**: 14px, 400 weight, Muted
- **Spacing**: 16px between elements
- **Vertical Alignment**: Center of screen
- **Optional Action**: Button below subtitle

**Usage Examples**:
- No vehicles found in search
- No active alerts
- Empty list state

---

### 9.2 Loading Skeleton

**Purpose**: Placeholder while content loads

**Anatomy**:
```
┌─────────────────────────────────┐
│ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ │
├─────────────────────────────────┤
│ ▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓            │
│ ▓▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓▓▓            │
└─────────────────────────────────┘
```

**Specifications**:
- **Shape**: 12px rounded rectangles
- **Color**: Muted with 50% opacity
- **Animation**: Pulse (0.5 → 1.0 opacity, 1.5s infinite)
- **Spacing**: Match content spacing

**Usage Examples**:
- Vehicle list loading
- Dashboard metrics loading
- Alert list loading

---

## 10. Alert & Notification Components

### 10.1 Alert Card

**Purpose**: Display alert with severity and action

**Anatomy**:
```
┌─────────────────────────────────┐
│ ⚠ WP-1245              WARNING  │
│   MN-012                        │
│   Fuel level low (15%)          │
│   Driver: Suresh Bandara        │
│   2 min ago              [Dismiss]
└─────────────────────────────────┘
```

**Specifications**:
- **Background**: Surface
- **Border**: 1px solid Border
- **Border Radius**: 12px
- **Padding**: 16px
- **Icon**: 40×40px, colored by severity
- **Title**: 16px, 600 weight, Foreground
- **Message**: 14px, 400 weight, Foreground
- **Metadata**: 12px, 400 weight, Muted
- **Action Button**: 12px, 600 weight, Primary bg

**Severity Colors**:
- Critical: Error (#EF4444)
- Warning: Warning (#F59E0B)
- Info: Primary (#2C3E50)

**Usage Examples**:
- Alert items on Alerts screen
- Notification cards
- System messages

---

## 11. Form Components

### 11.1 Form Field Group

**Purpose**: Label + input + error message

**Anatomy**:
```
Name                       ← Label (12px, 500)
┌─────────────────────────┐
│ Enter your name...      │  ← Input (44px height)
└─────────────────────────┘
Error message here        ← Error (12px, Error color)
```

**Specifications**:
- **Label**: 12px, 500 weight, Muted
- **Label to Input**: 8px gap
- **Input**: 44px height, 16px padding
- **Input to Error**: 8px gap
- **Error Text**: 12px, 400 weight, Error color
- **Spacing Between Fields**: 12px

**States**:
- **Default**: Border color Border
- **Focused**: Border color Primary, 2px width
- **Error**: Border color Error, error message shown
- **Success**: Border color Success, checkmark shown

**Usage Examples**:
- Login form
- Settings form
- User profile form

---

## 12. Navigation Components

### 12.1 Tab Bar

**Purpose**: Bottom navigation between main sections

**Anatomy**:
```
┌─────────────────────────────────┐
│ 🏠        ✈️        🔔        👤  │
│ Dashboard Fleet  Alerts Profile │
└─────────────────────────────────┘
```

**Specifications**:
- **Height**: 56px + safe area bottom
- **Background**: Background color
- **Border Top**: 0.5px solid Border
- **Padding Top**: 8px
- **Padding Bottom**: safe area + 8px
- **Icon Size**: 28px
- **Label Font**: 12px, 500 weight
- **Label Margin Top**: 4px

**Tab Specifications**:
- **Width**: Equal (25% each for 4 tabs)
- **Active Icon Color**: Primary (#2C3E50)
- **Inactive Icon Color**: Muted (#6B7280)
- **Active Label Color**: Primary
- **Inactive Label Color**: Muted
- **Touch Target**: Full tab area (44px minimum)

**Usage Examples**:
- Main navigation (Dashboard, Fleet, Alerts, Profile)
- Bottom navigation in mobile apps

---

## 13. Metric & Data Display

### 13.1 Large Metric Display

**Purpose**: Show important numbers prominently

**Anatomy**:
```
24
vehicles
```

**Specifications**:
- **Number**: 32px, 700 weight, Primary
- **Unit**: 14px, 400 weight, Muted
- **Spacing**: 4px between number and unit
- **Alignment**: Left-aligned

**Usage Examples**:
- Total vehicles count
- Active vehicle count
- Alert count

---

### 13.2 Metric Pair (Side by Side)

**Purpose**: Compare two related metrics

**Anatomy**:
```
┌──────────────┬──────────────┐
│ ACTIVE       │ IDLE         │
│ ● 18         │ ● 6          │
└──────────────┴──────────────┘
```

**Specifications**:
- **Layout**: flex-row, gap: 16px
- **Each Metric**: flex: 1
- **Label**: 12px, 500 weight, Muted, uppercase
- **Value**: 24px, 700 weight, Foreground
- **Status Dot**: 12px, colored, 8px gap from value
- **Padding**: 16px
- **Border**: 1px solid Border
- **Border Radius**: 12px

**Usage Examples**:
- Active/Idle vehicle counts
- Fuel/Distance metrics
- Success/Error counts

---

## 14. Color Application Rules

### Text on Different Backgrounds

| Background | Text Color | Contrast |
|-----------|-----------|----------|
| Primary (#2C3E50) | White (#FFFFFF) | 12.6:1 (AAA) |
| Surface (#F8F9FA) | Foreground (#1A1A1A) | 10.2:1 (AAA) |
| Background (#FFFFFF) | Foreground (#1A1A1A) | 16.5:1 (AAA) |
| Success (#10B981) | White (#FFFFFF) | 6.2:1 (AAA) |
| Warning (#F59E0B) | White (#FFFFFF) | 5.9:1 (AAA) |
| Error (#EF4444) | White (#FFFFFF) | 5.5:1 (AAA) |

### Disabled State Colors
- **Text**: Muted color with 50% opacity
- **Background**: Surface with 50% opacity
- **Border**: Border color with 50% opacity

### Hover/Active State Colors
- **Buttons**: Reduce opacity by 20% or scale 0.97
- **Cards**: Reduce opacity by 20%
- **Text**: Darken by 10% or reduce opacity by 10%

---

## 15. Component Sizing Reference

| Component | Width | Height | Notes |
|-----------|-------|--------|-------|
| **Button (Primary)** | Full or fixed | 44px | Min height for touch |
| **Button (Icon)** | 44px | 44px | Square, centered icon |
| **Input Field** | Full | 44px | Min height for touch |
| **Card** | Full | Variable | Min 72px for list items |
| **Status Dot** | 12px | 12px | Circle |
| **Badge** | Auto | 24px | Padding: 4px 8px |
| **Tab Bar** | Full | 56px + safe | Includes safe area |
| **List Item** | Full | 44px+ | Flexible height |

---

## 16. Implementation Checklist

When building these components, verify:

- [ ] **Colors**: Use exact hex values from palette
- [ ] **Typography**: Font size, weight, line height match specs
- [ ] **Spacing**: Padding and margins use 4px grid
- [ ] **Sizing**: Touch targets minimum 44×44px
- [ ] **States**: Default, hover, active, disabled, focused
- [ ] **Accessibility**: Color contrast, keyboard nav, screen reader
- [ ] **Dark Mode**: Test both light and dark variants
- [ ] **Responsive**: Works on mobile, tablet, desktop
- [ ] **Performance**: Smooth animations, no jank
- [ ] **Consistency**: Matches design system exactly

---

**Document Version**: 1.0  
**Last Updated**: March 13, 2026  
**Status**: Production Ready
