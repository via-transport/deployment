# Moonstone Fleet Management - Interaction & Animation Specifications

## Interaction Design & Motion Guidelines

Complete specifications for all user interactions, animations, transitions, and feedback mechanisms used in the Moonstone Fleet Management app.

---

## 1. Touch Interactions

### 1.1 Button Press

**Visual Feedback**:
- **Primary Button**: Scale 0.97 + opacity 0.9
- **Secondary Button**: Opacity 0.8
- **Icon Button**: Opacity 0.6

**Timing**:
- **Duration**: 80ms
- **Easing**: ease-out
- **Delay**: Immediate (0ms)

**Haptic Feedback**:
- **Type**: Light impact
- **Timing**: Trigger on press start
- **Intensity**: Light (ImpactFeedbackStyle.Light)

**Code Example** (React Native):
```typescript
<Pressable
  onPress={handlePress}
  style={({ pressed }) => [
    styles.button,
    pressed && {
      transform: [{ scale: 0.97 }],
      opacity: 0.9
    }
  ]}
>
  <Text>Button</Text>
</Pressable>
```

---

### 1.2 List Item Tap

**Visual Feedback**:
- **Opacity**: Reduce to 0.7 on press
- **Duration**: 100ms
- **Easing**: ease-out

**Haptic Feedback**:
- **Type**: None (optional light impact)
- **Timing**: On press start

**Behavior**:
- Navigate to detail screen on release
- Maintain opacity during press
- Restore opacity when released

**Code Example**:
```typescript
<Pressable
  onPress={() => navigation.push('detail', { id })}
  style={({ pressed }) => [
    styles.listItem,
    pressed && { opacity: 0.7 }
  ]}
>
  <Text>{item.name}</Text>
</Pressable>
```

---

### 1.3 Toggle Switch

**Visual Feedback**:
- **Toggle Animation**: Slide 200ms ease-in-out
- **Background Color Change**: Simultaneous with toggle
- **Dot Movement**: Smooth slide from left to right (or vice versa)

**Haptic Feedback**:
- **Type**: Medium impact
- **Timing**: On toggle completion
- **Intensity**: ImpactFeedbackStyle.Medium

**States**:
- **Off**: Muted background, dot on left
- **On**: Success background, dot on right

**Code Example**:
```typescript
<Switch
  value={isEnabled}
  onValueChange={(value) => {
    setIsEnabled(value);
    Haptics.impactAsync(ImpactFeedbackStyle.Medium);
  }}
  trackColor={{ false: '#6B7280', true: '#10B981' }}
  thumbColor="#FFFFFF"
/>
```

---

### 1.4 Long Press

**Trigger**:
- **Duration**: 500ms press
- **Feedback**: Heavy haptic + visual feedback

**Visual Feedback**:
- **Scale**: 0.95
- **Opacity**: 0.8
- **Duration**: 100ms

**Haptic Feedback**:
- **Type**: Heavy impact
- **Timing**: On long press trigger
- **Intensity**: ImpactFeedbackStyle.Heavy

**Use Cases**:
- Copy vehicle ID
- Delete item
- Share vehicle info

---

### 1.5 Swipe Gestures

**Swipe Left** (Reveal actions):
- **Threshold**: 30px
- **Animation**: Slide 200ms ease-out
- **Reveal**: Action buttons (Call, View Route)
- **Haptic**: Light impact on reveal

**Swipe Right** (Dismiss):
- **Threshold**: 50px
- **Animation**: Slide out 200ms ease-out
- **Action**: Remove item from list
- **Haptic**: Success notification

**Code Example**:
```typescript
const panResponder = useRef(
  PanResponder.create({
    onMoveShouldSetPanResponder: (evt, gestureState) => {
      return Math.abs(gestureState.dx) > 30;
    },
    onPanResponderMove: (evt, gestureState) => {
      // Update position based on gesture
    },
    onPanResponderRelease: (evt, gestureState) => {
      // Snap to position or dismiss
      if (gestureState.dx > 50) {
        dismissItem();
      }
    }
  })
).current;
```

---

## 2. Screen Transitions

### 2.1 Push Transition (Forward Navigation)

**Animation Type**: Slide from right
- **Duration**: 300ms
- **Easing**: ease-out
- **Direction**: Right → Left (new screen slides in from right)
- **Opacity**: Fade in from 0.8 to 1.0

**Code Example** (Expo Router):
```typescript
<Stack.Screen
  name="detail"
  options={{
    animationEnabled: true,
    animationTypeForReplace: isSignedIn ? 'pop' : 'pop',
    transitionSpec: {
      open: {
        animation: 'timing',
        config: { duration: 300 }
      }
    }
  }}
/>
```

---

### 2.2 Pop Transition (Back Navigation)

**Animation Type**: Slide to right
- **Duration**: 300ms
- **Easing**: ease-out
- **Direction**: Left → Right (current screen slides out to right)
- **Opacity**: Fade out from 1.0 to 0.8

---

### 2.3 Modal Transition

**Animation Type**: Slide up from bottom
- **Duration**: 300ms
- **Easing**: ease-out
- **Direction**: Bottom → Top
- **Backdrop**: Fade in scrim (0% → 50% opacity)

**Code Example**:
```typescript
<Modal
  visible={isVisible}
  animationType="slide"
  transparent={true}
  onRequestClose={closeModal}
>
  <View style={{ flex: 1, justifyContent: 'flex-end' }}>
    {/* Modal content */}
  </View>
</Modal>
```

---

### 2.4 Tab Switch Transition

**Animation Type**: Fade
- **Duration**: 150ms
- **Easing**: ease-in-out
- **Direction**: Fade out current tab, fade in new tab
- **No slide**: Tabs stay in place, only content changes

**Behavior**:
- Smooth fade between tab content
- Tab bar remains static
- Icon color changes immediately

---

## 3. Animations

### 3.1 Fade In Animation

**Use Cases**: Screen entrance, modal appearance, content reveal

**Specifications**:
- **Duration**: 250ms
- **Easing**: ease-in-out
- **From**: Opacity 0
- **To**: Opacity 1
- **Delay**: 0ms (immediate)

**Code Example**:
```typescript
const fadeAnim = useRef(new Animated.Value(0)).current;

useEffect(() => {
  Animated.timing(fadeAnim, {
    toValue: 1,
    duration: 250,
    easing: Easing.inOut(Easing.ease),
    useNativeDriver: true
  }).start();
}, []);

return (
  <Animated.View style={{ opacity: fadeAnim }}>
    {/* Content */}
  </Animated.View>
);
```

---

### 3.2 Slide Up Animation

**Use Cases**: Bottom sheet entrance, content reveal from bottom

**Specifications**:
- **Duration**: 300ms
- **Easing**: ease-out
- **From**: translateY(100%)
- **To**: translateY(0)
- **Delay**: 0ms

**Code Example**:
```typescript
const slideAnim = useRef(new Animated.Value(100)).current;

useEffect(() => {
  Animated.timing(slideAnim, {
    toValue: 0,
    duration: 300,
    easing: Easing.out(Easing.ease),
    useNativeDriver: true
  }).start();
}, []);

return (
  <Animated.View
    style={{
      transform: [{ translateY: slideAnim }]
    }}
  >
    {/* Content */}
  </Animated.View>
);
```

---

### 3.3 Scale Animation

**Use Cases**: Button press feedback, item selection, emphasis

**Specifications**:
- **Duration**: 150ms
- **Easing**: ease-out
- **From**: scale(1.0)
- **To**: scale(0.97)
- **Delay**: 0ms

**Code Example**:
```typescript
const scaleAnim = useRef(new Animated.Value(1)).current;

const handlePressIn = () => {
  Animated.timing(scaleAnim, {
    toValue: 0.97,
    duration: 80,
    easing: Easing.out(Easing.ease),
    useNativeDriver: true
  }).start();
};

const handlePressOut = () => {
  Animated.timing(scaleAnim, {
    toValue: 1,
    duration: 80,
    easing: Easing.out(Easing.ease),
    useNativeDriver: true
  }).start();
};
```

---

### 3.4 Pulse Animation

**Use Cases**: Loading skeleton, attention grabber, status indicator

**Specifications**:
- **Duration**: 1500ms
- **Easing**: ease-in-out
- **From**: Opacity 0.5
- **To**: Opacity 1.0
- **Repeat**: Infinite
- **Direction**: Forward and backward

**Code Example**:
```typescript
const pulseAnim = useRef(new Animated.Value(0.5)).current;

useEffect(() => {
  Animated.loop(
    Animated.sequence([
      Animated.timing(pulseAnim, {
        toValue: 1,
        duration: 750,
        easing: Easing.inOut(Easing.ease),
        useNativeDriver: true
      }),
      Animated.timing(pulseAnim, {
        toValue: 0.5,
        duration: 750,
        easing: Easing.inOut(Easing.ease),
        useNativeDriver: true
      })
    ])
  ).start();
}, []);

return (
  <Animated.View style={{ opacity: pulseAnim }}>
    {/* Skeleton or loading content */}
  </Animated.View>
);
```

---

### 3.5 Rotation Animation

**Use Cases**: Loading spinner, refresh indicator, rotating icon

**Specifications**:
- **Duration**: 1000ms
- **Easing**: linear
- **From**: rotate(0deg)
- **To**: rotate(360deg)
- **Repeat**: Infinite

**Code Example**:
```typescript
const rotateAnim = useRef(new Animated.Value(0)).current;

useEffect(() => {
  Animated.loop(
    Animated.timing(rotateAnim, {
      toValue: 1,
      duration: 1000,
      easing: Easing.linear,
      useNativeDriver: true
    })
  ).start();
}, []);

const rotation = rotateAnim.interpolate({
  inputRange: [0, 1],
  outputRange: ['0deg', '360deg']
});

return (
  <Animated.View style={{ transform: [{ rotate: rotation }] }}>
    {/* Spinner icon */}
  </Animated.View>
);
```

---

## 4. Haptic Feedback

### 4.1 Light Impact (Button Press)

**Trigger**: Button tap, list item tap
**Timing**: Immediate on press
**Intensity**: Light
**Duration**: 10ms

**Code Example**:
```typescript
import * as Haptics from 'expo-haptics';

const handlePress = () => {
  Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Light);
  // Handle action
};
```

---

### 4.2 Medium Impact (Toggle, Switch)

**Trigger**: Toggle switch, selection change
**Timing**: On state change
**Intensity**: Medium
**Duration**: 15ms

**Code Example**:
```typescript
const handleToggle = (value) => {
  setEnabled(value);
  Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Medium);
};
```

---

### 4.3 Heavy Impact (Long Press, Important Action)

**Trigger**: Long press, delete action, critical operation
**Timing**: On action trigger
**Intensity**: Heavy
**Duration**: 20ms

**Code Example**:
```typescript
const handleLongPress = () => {
  Haptics.impactAsync(Haptics.ImpactFeedbackStyle.Heavy);
  // Show delete confirmation
};
```

---

### 4.4 Success Notification

**Trigger**: Action completed, form submitted, item added
**Timing**: After action completes
**Pattern**: Two quick taps
**Duration**: 20ms each

**Code Example**:
```typescript
const handleSuccess = () => {
  Haptics.notificationAsync(
    Haptics.NotificationFeedbackType.Success
  );
};
```

---

### 4.5 Error Notification

**Trigger**: Validation error, failed action, network error
**Timing**: Immediately on error
**Pattern**: Three quick taps
**Duration**: 15ms each

**Code Example**:
```typescript
const handleError = () => {
  Haptics.notificationAsync(
    Haptics.NotificationFeedbackType.Error
  );
};
```

---

### 4.6 Warning Notification

**Trigger**: Alert, caution, important notice
**Timing**: Immediately on warning
**Pattern**: One medium tap
**Duration**: 15ms

**Code Example**:
```typescript
const handleWarning = () => {
  Haptics.notificationAsync(
    Haptics.NotificationFeedbackType.Warning
  );
};
```

---

## 5. Loading States

### 5.1 Skeleton Loader

**Appearance**:
- **Shape**: 12px rounded rectangles
- **Color**: Muted (#6B7280) with 50% opacity
- **Animation**: Pulse (0.5 → 1.0 opacity, 1.5s)
- **Layout**: Match content structure

**Usage**:
- Vehicle list loading
- Dashboard metrics loading
- Alert list loading

**Code Example**:
```typescript
const SkeletonLoader = () => (
  <View style={{ gap: 12 }}>
    {[1, 2, 3].map((i) => (
      <Animated.View
        key={i}
        style={{
          height: 72,
          backgroundColor: '#6B7280',
          opacity: pulseAnim,
          borderRadius: 12
        }}
      />
    ))}
  </View>
);
```

---

### 5.2 Spinner Loader

**Appearance**:
- **Size**: 40px diameter
- **Color**: Primary (#2C3E50)
- **Animation**: Rotate 360° in 1000ms (linear)
- **Position**: Center of screen

**Usage**:
- Full-screen loading
- Data refresh
- Long-running operations

**Code Example**:
```typescript
const SpinnerLoader = () => (
  <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
    <Animated.View style={{ transform: [{ rotate: rotation }] }}>
      <ActivityIndicator size={40} color="#2C3E50" />
    </Animated.View>
  </View>
);
```

---

### 5.3 Progress Bar

**Appearance**:
- **Height**: 4px
- **Background**: Border color
- **Progress**: Primary color
- **Animation**: Smooth fill

**Usage**:
- File upload progress
- Data sync progress
- Long operations

---

## 6. Empty States

### 6.1 Empty List State

**Appearance**:
- **Icon**: 48px, Muted color
- **Title**: 18px, 600 weight, Foreground
- **Subtitle**: 14px, 400 weight, Muted
- **Action**: Optional button

**Animation**:
- **Entrance**: Fade in 250ms ease-in-out
- **Icon Scale**: 0.8 → 1.0 (150ms ease-out)

**Usage**:
- No search results
- No vehicles found
- No alerts

**Code Example**:
```typescript
const EmptyState = () => (
  <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
    <Animated.View style={{ transform: [{ scale: scaleAnim }] }}>
      <Text style={{ fontSize: 48 }}>✓</Text>
    </Animated.View>
    <Text style={{ fontSize: 18, fontWeight: '600', marginTop: 16 }}>
      All Clear
    </Text>
    <Text style={{ fontSize: 14, color: '#6B7280', marginTop: 8 }}>
      No active alerts
    </Text>
  </View>
);
```

---

## 7. Success & Error States

### 7.1 Success Toast

**Appearance**:
- **Icon**: ✓ (32px, Success color)
- **Message**: 14px, Success color
- **Background**: Success with 10% opacity
- **Duration**: 2–3 seconds

**Animation**:
- **Entrance**: Slide up 300ms ease-out
- **Exit**: Fade out 200ms ease-in

**Haptic**: Success notification

**Code Example**:
```typescript
const showSuccessToast = (message) => {
  Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success);
  // Show toast with message
  setTimeout(() => {
    // Hide toast
  }, 3000);
};
```

---

### 7.2 Error Toast

**Appearance**:
- **Icon**: ⚠ (32px, Error color)
- **Message**: 14px, Error color
- **Background**: Error with 10% opacity
- **Duration**: 3–5 seconds (persistent)

**Animation**:
- **Entrance**: Slide up 300ms ease-out
- **Exit**: Fade out 200ms ease-in

**Haptic**: Error notification

**User Action**: Dismiss button or auto-dismiss after timeout

---

## 8. Accessibility Considerations

### 8.1 Respect Prefers-Reduced-Motion

**Implementation**:
```typescript
import { AccessibilityInfo } from 'react-native';

const prefersReducedMotion = AccessibilityInfo.isScreenReaderEnabled();

const animationDuration = prefersReducedMotion ? 0 : 300;
```

**Rules**:
- If user has set prefers-reduced-motion, disable all animations
- Keep interactions functional but instant
- Maintain visual feedback (opacity changes, etc.)

---

### 8.2 Focus Indicators (Web/Keyboard)

**Appearance**:
- **Width**: 2px
- **Color**: Primary (#2C3E50)
- **Offset**: 2px from element
- **Style**: Solid outline

**Code Example**:
```css
button:focus {
  outline: 2px solid #2C3E50;
  outline-offset: 2px;
}
```

---

### 8.3 Screen Reader Announcements

**Patterns**:
- **Button**: "Button, [label]"
- **Toggle**: "Toggle, [label], [state]"
- **Alert**: "Alert, [severity], [message]"
- **Loading**: "Loading, please wait"

**Code Example**:
```typescript
<Pressable
  accessible={true}
  accessibilityLabel="View Fleet"
  accessibilityRole="button"
  accessibilityState={{ disabled: false }}
  onPress={handlePress}
>
  <Text>View Fleet</Text>
</Pressable>
```

---

## 9. Performance Optimization

### 9.1 Animation Best Practices

**Do**:
- Use `useNativeDriver: true` for animations
- Animate only `opacity` and `transform` properties
- Use `Animated.interpolate()` for complex animations
- Limit simultaneous animations to 3–4

**Don't**:
- Animate `width`, `height`, `margin`, `padding`
- Use `setInterval` for animations
- Create animations inside render
- Animate on every state change

---

### 9.2 Gesture Performance

**Do**:
- Use `PanResponder` for swipe gestures
- Debounce rapid gestures
- Use `useNativeDriver: true` for gesture-driven animations

**Don't**:
- Use `onScroll` with heavy computations
- Create new gesture handlers on every render
- Animate off-screen content

---

## 10. Animation Timing Reference

| Animation | Duration | Easing | Use Case |
|-----------|----------|--------|----------|
| **Press Feedback** | 80ms | ease-out | Button/card press |
| **Fade In** | 250ms | ease-in-out | Screen entrance |
| **Slide Up** | 300ms | ease-out | Modal/sheet entrance |
| **Scale** | 150ms | ease-out | Emphasis, selection |
| **Pulse** | 1500ms | ease-in-out | Loading, attention |
| **Rotation** | 1000ms | linear | Spinner, refresh |
| **Tab Switch** | 150ms | ease-in-out | Tab navigation |
| **Swipe Dismiss** | 200ms | ease-out | Item removal |

---

## 11. Gesture Timing Reference

| Gesture | Threshold | Duration | Feedback |
|---------|-----------|----------|----------|
| **Tap** | Instant | <200ms | Light haptic |
| **Long Press** | 500ms | Sustained | Heavy haptic |
| **Swipe Left** | 30px | 200ms | Light haptic |
| **Swipe Right** | 50px | 200ms | Success haptic |
| **Double Tap** | 2× within 300ms | - | Light haptic |
| **Pinch** | 2-finger spread | Continuous | Medium haptic |

---

## 12. Implementation Checklist

When implementing interactions, verify:

- [ ] **Press Feedback**: Button scales 0.97, list items fade to 0.7
- [ ] **Haptics**: Light for buttons, medium for toggles, success/error for actions
- [ ] **Animations**: 80–400ms duration, smooth easing
- [ ] **Transitions**: Slide for navigation, fade for tabs, slide-up for modals
- [ ] **Loading States**: Skeleton or spinner with pulse animation
- [ ] **Empty States**: Icon + title + subtitle, fade in animation
- [ ] **Success/Error**: Toast with haptic feedback, auto-dismiss
- [ ] **Accessibility**: Respects prefers-reduced-motion, focus indicators visible
- [ ] **Performance**: Uses native driver, no jank on 60fps
- [ ] **Consistency**: All interactions follow the same patterns

---

**Document Version**: 1.0  
**Last Updated**: March 13, 2026  
**Status**: Production Ready
