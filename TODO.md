# Migration Todo List - Ethiopian Calendar App

This todo list is organized by milestones based on the migration plan. Each milestone represents a logical phase of development with clear deliverables.

---

## Milestone 1: Foundation & Localization Setup
**Timeline**: Weeks 1-2  
**Goal**: Set up project infrastructure, localization, and core utilities

### Setup & Dependencies
- [x] Add `easy_localization: ^3.0.8` to `pubspec.yaml`
- [x] Add `google_fonts: ^6.1.0` to `pubspec.yaml` (for Amharic fonts)
- [x] Add `provider: ^6.1.1` to `pubspec.yaml`
- [x] Add `intl: ^0.19.0` to `pubspec.yaml`
- [x] Run `flutter pub get`

### Localization Infrastructure
- [x] Create `assets/translations/` directory
- [x] Create `assets/translations/en.json` with base English strings (comprehensive)
- [ ] Create `assets/translations/am.json` with Amharic translations
- [ ] Create `assets/translations/om.json` with Afan Oromo translations
- [ ] Update `pubspec.yaml` to include translation assets
- [x] Initialize `easy_localization` in `main.dart`
- [x] Configure `MaterialApp` with localization delegates
- [x] Set up auto-detect device locale
- [ ] Test language switching

### Project Structure Refactoring
- [x] Create `lib/core/constants/` directory
- [x] Create `lib/core/utils/` directory
- [x] Create `lib/core/models/` directory
- [x] Create `lib/data/repositories/` directory
- [x] Create `lib/data/local_storage/` directory
- [x] Create `lib/screens/calendar/` directory
- [x] Create `lib/screens/year_info/` directory
- [x] Create `lib/screens/settings/` directory
- [x] Create `lib/widgets/calendar/` directory
- [x] Create `lib/widgets/navigation/` directory
- [x] Create `lib/widgets/common/` directory
- [x] Create `lib/providers/` directory
- [x] Preserve legacy code in `lib/legacy/` folder

### Core Utilities
- [x] Create `lib/core/utils/date_converter.dart` (empty file created)
- [ ] Implement `ethiopianToGregorian()` function
- [ ] Implement `gregorianToEthiopian()` function
- [ ] Handle leap years in date conversion
- [ ] Handle Pagume (13th month) in date conversion
- [x] Create `lib/core/utils/bahire_hassab.dart` (empty file created)
- [x] Create `lib/core/utils/calendar_utils.dart` (empty file created)
- [ ] Write unit tests for date conversion functions
- [ ] Test date conversion with known date pairs

### State Management Setup
- [x] Create `lib/providers/calendar_provider.dart` (empty file created)
- [x] Create `lib/providers/event_provider.dart` (empty file created)
- [x] Create `lib/providers/year_info_provider.dart` (empty file created)
- [x] Create `lib/providers/theme_provider.dart` (empty file created)
- [x] Create `lib/providers/locale_provider.dart` (empty file created)
- [x] Set up Provider in `main.dart` (MultiProvider configured)

### Constants & Models
- [x] Create `lib/core/constants/ethiopian_months.dart` (empty file created)
- [x] Create `lib/core/constants/gregorian_constants.dart` (empty file created)
- [x] Create `lib/core/constants/holiday_names.dart` (empty file created)
- [x] Create `lib/core/models/ethiopian_date.dart` (empty file created)
- [x] Create `lib/core/models/gregorian_date.dart` (empty file created)
- [x] Create `lib/core/models/event.dart` (empty file created)
- [x] Create `lib/core/models/holiday.dart` (empty file created)
- [x] Create `lib/core/models/year_details.dart` (empty file created)
- [x] Preserve original `lib/legacy/models/year_details.dart` with full implementation

### Fonts Setup
- [ ] Add Noto Sans Ethiopic font configuration
- [ ] Test Amharic text rendering
- [ ] Verify Ge'ez script displays correctly

**Milestone 1 Deliverables:**
- ✅ Localization infrastructure ready
- ✅ Refactored codebase structure
- ✅ Working date conversion utilities
- ✅ Test coverage for core utilities

---

## Milestone 2: Core Calendar Views & Dark Theme
**Timeline**: Weeks 3-4  
**Goal**: Implement calendar views and dark theme support

### Calendar Views Implementation
- [x] Create `lib/screens/calendar/calendar_home.dart` (empty file created)
- [x] Create `lib/screens/calendar/monthly_view.dart` (empty file created)
- [ ] Implement 7-column grid layout (Sunday to Saturday)
- [ ] Display Ethiopian month name and year at top
- [ ] Display corresponding Gregorian month/year below
- [ ] Show Ethiopian date (primary) and Gregorian date (secondary) in each cell
- [ ] Implement swipe left/right to navigate months
- [ ] Add "Today" button to jump to current date
- [ ] Highlight current date with amber accent
- [x] Create `lib/screens/calendar/weekly_view.dart` (empty file created)
- [ ] Implement 7 columns for days of week
- [ ] Add time slots on left side
- [ ] Display week range at top (Ethiopian and Gregorian)
- [ ] Implement swipe navigation for weeks
- [x] Create `lib/screens/calendar/daily_view.dart` (empty file created)
- [ ] Implement single column with time slots
- [ ] Display full date in both calendars at top
- [ ] List events chronologically
- [ ] Implement swipe navigation for days

### View Switching
- [x] Create `lib/widgets/navigation/view_selector.dart` (empty file created)
- [ ] Implement tab bar (Month | Week | Day)
- [ ] Add view state persistence (remember last selected view)
- [ ] Localize view names
- [ ] Integrate view switcher with calendar home screen

### Navigation
- [x] Create `lib/widgets/navigation/bottom_nav_bar.dart` (empty file created)
- [ ] Implement bottom navigation: Calendar | Year Info | Settings
- [ ] Add navigation between screens
- [ ] Localize navigation labels
- [ ] Test navigation flow

### Dark Theme Implementation
- [x] Create `lib/providers/theme_provider.dart` (empty file created)
- [ ] Define light theme (amber theme with white backgrounds)
- [ ] Define dark theme (dark backgrounds with light text, amber accents)
- [ ] Implement system theme detection
- [ ] Add theme mode toggle (Light | Dark | System)
- [ ] Test all widgets in light theme
- [ ] Test all widgets in dark theme
- [ ] Verify WCAG contrast ratios (4.5:1 minimum)
- [ ] Update color palette for both themes
- [ ] Test theme switching

### Calendar Widgets
- [x] Create `lib/widgets/calendar/calendar_grid.dart` (empty file created)
- [x] Create `lib/widgets/calendar/date_cell.dart` (empty file created)
- [x] Create `lib/widgets/calendar/event_indicator.dart` (empty file created)
- [x] Create `lib/widgets/calendar/holiday_indicator.dart` (empty file created)
- [ ] Implement color coding: holidays (red), fasting days (orange), user events (blue)
- [ ] Add tap handlers for date selection
- [ ] Implement visual feedback for interactions

### Localization of Calendar Views
- [ ] Extract all UI strings from calendar views
- [ ] Add calendar-related strings to translation files
- [ ] Localize month names (Ethiopian and Gregorian)
- [ ] Localize day names (weekdays)
- [ ] Localize date formats
- [ ] Test localization in all three languages
- [ ] Verify Amharic text renders correctly
- [ ] Verify Oromo text renders correctly

### Integration
- [ ] Integrate calendar views with state management
- [ ] Connect views to CalendarProvider
- [ ] Test navigation between views
- [ ] Test date selection
- [ ] Test month/week/day navigation

**Milestone 2 Deliverables:**
- ✅ Functional calendar views (Month, Week, Day)
- ✅ Smooth navigation between views
- ✅ Dark theme working (Light, Dark, System)
- ✅ All UI localized

---

## Milestone 3: Dual Calendar Integration
**Timeline**: Weeks 5-6  
**Goal**: Perfect date conversion and implement dual calendar display

### Date Conversion Refinement
- [ ] Create comprehensive test suite for date conversion
- [ ] Test with known date pairs (extensive list)
- [ ] Test edge cases (leap years, year boundaries)
- [ ] Test Pagume (13th month) handling
- [ ] Fix any date conversion bugs
- [ ] Verify 100% accuracy
- [ ] Document date conversion algorithm

### Overlay Display Mode
- [ ] Implement overlay mode in calendar views
- [ ] Show primary calendar (Ethiopian by default)
- [ ] Display secondary calendar dates in smaller text below primary dates
- [ ] Add clear visual distinction between calendars
- [ ] Implement user preference for primary calendar
- [ ] Add setting to switch primary calendar (Ethiopian/Gregorian)
- [ ] Test overlay mode in all three views

### Synchronized Navigation
- [ ] Implement synchronized navigation between calendars
- [ ] When navigating Ethiopian calendar, update Gregorian display
- [ ] When navigating Gregorian calendar, update Ethiopian display
- [ ] Ensure both calendars stay in sync
- [ ] Test navigation synchronization

### Date Picker
- [x] Create `lib/widgets/common/date_picker_dialog.dart` (empty file created)
- [ ] Support both Ethiopian and Gregorian calendars
- [ ] Show both dates when selecting
- [ ] Localize date picker
- [ ] Integrate date picker with event creation
- [ ] Test date picker functionality

### Settings for Calendar Preferences
- [x] Create `lib/screens/settings/settings_screen.dart` (empty file created)
- [ ] Add setting for default calendar (Ethiopian/Gregorian)
- [ ] Add setting for primary calendar in overlay mode
- [ ] Persist user preferences
- [ ] Apply preferences to calendar views
- [ ] Localize settings screen

### Localized Date Formats
- [ ] Implement localized date formatting
- [ ] Use `DateFormat` from `intl` package
- [ ] Create date format patterns for each language
- [ ] Test date formats in all three languages
- [ ] Verify date formats match cultural expectations

**Milestone 3 Deliverables:**
- ✅ Accurate date conversion (100% accuracy)
- ✅ Overlay display mode working
- ✅ User preference settings
- ✅ Localized date formats

---

## Milestone 4: Event Management & Reminders ⭐ PRIORITY
**Timeline**: Weeks 7-8  
**Goal**: Implement event management and reminder system

### Dependencies
- [ ] Add `hive: ^2.2.3` to `pubspec.yaml`
- [ ] Add `hive_flutter: ^1.1.0` to `pubspec.yaml`
- [ ] Add `flutter_local_notifications: ^16.3.0` to `pubspec.yaml`
- [ ] Add `uuid: ^4.2.1` to `pubspec.yaml`
- [ ] Run `flutter pub get`

### Local Storage Setup
- [ ] Initialize Hive in `main.dart`
- [ ] Create `lib/data/local_storage/database.dart`
- [ ] Set up Hive adapters for Event model
- [ ] Create Hive box for events
- [ ] Test data persistence

### Event Model
- [ ] Create `lib/core/models/event.dart`
- [ ] Define Event class with required fields:
  - [ ] id (String, UUID)
  - [ ] title (String)
  - [ ] description (String?)
  - [ ] ethiopianDate (DateTime)
  - [ ] gregorianDate (DateTime)
  - [ ] time (TimeOfDay?)
  - [ ] isAllDay (bool)
  - [ ] reminderBefore (Duration?)
  - [ ] createdAt (DateTime)
  - [ ] updatedAt (DateTime)
- [ ] Make Event Hive-compatible
- [ ] Write unit tests for Event model

### Event Repository
- [ ] Create `lib/data/repositories/event_repository.dart`
- [ ] Implement `createEvent(Event event)`
- [ ] Implement `getEvent(String id)`
- [ ] Implement `getAllEvents()`
- [ ] Implement `getEventsForDate(DateTime date)`
- [ ] Implement `updateEvent(Event event)`
- [ ] Implement `deleteEvent(String id)`
- [ ] Write unit tests for repository

### Event Provider
- [ ] Update `lib/providers/event_provider.dart`
- [ ] Implement event CRUD operations
- [ ] Add event state management
- [ ] Implement event filtering by date
- [ ] Integrate with EventRepository

### Event UI - Creation
- [ ] Create event creation form/dialog
- [ ] Add title input field (required)
- [ ] Add date picker (Ethiopian/Gregorian)
- [ ] Add time picker (optional)
- [ ] Add description field (optional)
- [ ] Add reminder selector (None, 15 min, 1 hour, 1 day)
- [ ] Add Save/Cancel buttons
- [ ] Localize event creation form
- [ ] Validate form inputs
- [ ] Integrate with EventProvider

### Event UI - Display
- [ ] Add event indicators to calendar grid
- [ ] Show event dots/colors on dates with events
- [ ] Display events in weekly view time slots
- [ ] Display events in daily view chronologically
- [ ] Create event detail screen
- [ ] Show event details on tap
- [ ] Localize event display

### Event UI - Edit & Delete
- [ ] Add edit functionality to event detail screen
- [ ] Pre-populate form with event data
- [ ] Update event on save
- [ ] Add delete button to event detail screen
- [ ] Implement swipe-to-delete in lists
- [ ] Add confirmation dialog for delete
- [ ] Localize edit/delete UI

### Floating Action Button
- [ ] Add FAB to calendar home screen
- [ ] Open event creation form on FAB tap
- [ ] Position FAB appropriately
- [ ] Style FAB to match app theme

### Local Notifications Setup
- [ ] Initialize `flutter_local_notifications` in `main.dart`
- [ ] Request notification permissions (Android/iOS)
- [ ] Create notification channel for events
- [ ] Create notification channel for holidays
- [ ] Test notification permissions

### Reminder Implementation
- [ ] Create notification scheduling service
- [ ] Schedule notification when event is created
- [ ] Calculate notification time based on reminderBefore
- [ ] Handle all-day events
- [ ] Update notification when event is edited
- [ ] Cancel notification when event is deleted
- [ ] Test reminder notifications

### Holiday Notifications (Optional)
- [ ] Add setting for holiday notifications
- [ ] Schedule notifications 1 day before major holidays
- [ ] Test holiday notifications

**Milestone 4 Deliverables:**
- ✅ Full event management (Create, Read, Update, Delete)
- ✅ Events visible in all calendar views
- ✅ Working local notifications
- ✅ Simple reminder system

---

## Milestone 5: Android Widgets & Device Calendar Sync ⭐ PRIORITY
**Timeline**: Weeks 9-10  
**Goal**: Implement Android widgets and device calendar sync

### Android Widgets - Dependencies
- [ ] Add `home_widget: ^0.5.0` to `pubspec.yaml`
- [ ] Run `flutter pub get`

### Android Widgets - Setup
- [ ] Configure Android manifest for widgets
- [ ] Create widget provider class
- [ ] Create widget layout XML files
- [ ] Set up widget configuration

### Small Widget (2x2)
- [ ] Create small widget layout
- [ ] Display current Ethiopian date (large)
- [ ] Display current Gregorian date (smaller)
- [ ] Display day of week (localized)
- [ ] Display next upcoming event/holiday (if any)
- [ ] Implement widget update logic
- [ ] Test widget appearance
- [ ] Test widget tap to open app

### Medium Widget (4x2)
- [ ] Create medium widget layout
- [ ] Display current month grid (mini calendar)
- [ ] Highlight today in mini calendar
- [ ] Display upcoming events list (3-5 items)
- [ ] Implement widget update logic
- [ ] Test widget appearance
- [ ] Test widget tap to open app

### Widget Update Logic
- [ ] Create widget update service
- [ ] Update widget when events change
- [ ] Update widget when date changes
- [ ] Cache data for quick widget updates
- [ ] Set update frequency (hourly)
- [ ] Test widget updates
- [ ] Ensure widget works offline

### Device Calendar Sync - Dependencies
- [ ] Add `device_calendar: ^4.1.0` to `pubspec.yaml`
- [ ] Run `flutter pub get`

### Device Calendar Sync - Setup
- [ ] Request calendar read/write permissions
- [ ] Handle permission requests gracefully
- [ ] Create `lib/data/repositories/device_calendar_repository.dart`
- [ ] Set up device calendar access

### Read from Device Calendar
- [ ] Implement function to read device calendar events
- [ ] Parse device calendar events
- [ ] Convert Gregorian dates to Ethiopian dates
- [ ] Import events into app
- [ ] Handle import conflicts
- [ ] Test reading from device calendar

### Write to Device Calendar
- [ ] Implement function to write app events to device calendar
- [ ] Convert Ethiopian dates to Gregorian dates
- [ ] Create device calendar events
- [ ] Handle write permissions
- [ ] Test writing to device calendar

### Two-Way Sync
- [ ] Implement sync button in Settings
- [ ] Create sync service
- [ ] Implement manual sync functionality
- [ ] Add optional auto-sync setting
- [ ] Handle sync conflicts (app events take priority)
- [ ] Show sync status in Settings
- [ ] Test two-way sync
- [ ] Test offline sync (no network)

### Sync Settings UI
- [ ] Add sync section to Settings screen
- [ ] Add manual sync button
- [ ] Add auto-sync toggle
- [ ] Show sync status
- [ ] Show last sync time
- [ ] Localize sync settings

**Milestone 5 Deliverables:**
- ✅ Working Android widgets (small and medium)
- ✅ Device calendar sync functional
- ✅ Offline sync working
- ✅ Settings UI for sync

---

## Milestone 6: Integration & Polish
**Timeline**: Weeks 11-12  
**Goal**: Integrate Bahire Hassab, polish UI/UX, optimize performance

### Year Info Screen Integration
- [x] Create `lib/screens/year_info/year_details_screen.dart` (empty file created)
- [x] Preserve original `lib/legacy/screens/display_detail.dart` for reference
- [ ] Update navigation to year info screen
- [ ] Add navigation from calendar to year info
- [ ] Integrate with YearInfoProvider
- [ ] Localize year info screen
- [ ] Test year info display

### Holiday Integration in Calendar
- [ ] Integrate Bahire Hassab calculations with calendar views
- [ ] Display holidays in calendar grid
- [ ] Display fasting days in calendar grid
- [ ] Color code holidays (red) and fasting days (orange)
- [ ] Add holiday indicators to date cells
- [ ] Show holiday details on tap
- [ ] Link holiday details to year info screen
- [ ] Test holiday display in all views

### Localization of Bahire Hassab Terms
- [ ] Extract Bahire Hassab terms to translation files
- [ ] Translate evangelist names (Matthew, Mark, Luke, John)
- [ ] Translate holiday names
- [ ] Translate fasting day names
- [ ] Translate calculation terms
- [ ] Test translations in all languages

### UI/UX Polish Pass
- [ ] Review all screens for clutter
- [ ] Remove unnecessary elements
- [ ] Simplify navigation
- [ ] Ensure consistent spacing (8dp, 16dp, 24dp)
- [ ] Verify consistent card elevation (2-4dp)
- [ ] Check border radius consistency (8-12dp)
- [ ] Ensure large tap targets (≥44dp)
- [ ] Verify color consistency
- [ ] Test in both light and dark themes
- [ ] Apply KISS principle throughout

### Performance Optimization
- [ ] Profile app performance
- [ ] Optimize calendar grid rendering
- [ ] Use ListView.builder for event lists
- [ ] Optimize database queries
- [ ] Implement lazy loading where needed
- [ ] Optimize widget updates
- [ ] Test performance on low-end devices
- [ ] Ensure smooth scrolling (60fps)

### Comprehensive Testing
- [ ] Write unit tests for all core functions
- [ ] Write widget tests for calendar views
- [ ] Write widget tests for event management
- [ ] Write integration tests for user flows
- [ ] Test date conversion accuracy extensively
- [ ] Test on different screen sizes
- [ ] Test on different Android versions
- [ ] Test Amharic text rendering
- [ ] Test Oromo text rendering
- [ ] Test dark theme on various devices
- [ ] Test widgets on Android devices
- [ ] Test device calendar sync
- [ ] Test offline functionality
- [ ] Achieve >70% test coverage

### Accessibility Testing
- [ ] Test with screen readers
- [ ] Verify semantic labels on all interactive elements
- [ ] Test keyboard navigation
- [ ] Verify focus order is logical
- [ ] Test with high contrast mode
- [ ] Test with large text sizes
- [ ] Verify color contrast ratios (WCAG 4.5:1)
- [ ] Test with color blindness simulators
- [ ] Fix any accessibility issues

### Bug Fixes
- [ ] Create bug tracking list
- [ ] Fix critical bugs
- [ ] Fix high-priority bugs
- [ ] Fix medium-priority bugs
- [ ] Fix low-priority bugs
- [ ] Test bug fixes
- [ ] Verify no regressions

### Documentation
- [ ] Document code structure
- [ ] Document date conversion algorithm
- [ ] Document Bahire Hassab calculations
- [ ] Create user guide (optional)
- [ ] Update README.md
- [ ] Document localization process

**Milestone 6 Deliverables:**
- ✅ Complete integrated app
- ✅ Polished UI/UX (KISS compliant)
- ✅ Optimized performance
- ✅ Test coverage >70%
- ✅ Accessible app

---

## Post-MVP Enhancements (Future)
These can be added after the initial migration is complete:

- [ ] Recurring events (daily/weekly/monthly/yearly)
- [ ] Event categories (optional)
- [ ] Search events and holidays
- [ ] Export/Import calendar to ICS format
- [ ] Additional widget sizes
- [ ] More holiday details/information
- [ ] Customizable colors (keep default simple)

---

## Notes

- **Priority Features**: Milestones 4 and 5 are marked as priority
- **KISS Principle**: Keep features simple, avoid over-customization
- **Ease of Use**: Prioritize intuitive interface over complex features
- **Offline-First**: All core features must work without internet
- **Testing**: Test thoroughly at each milestone before moving to next

---

**Last Updated**: 2024  
**Status**: In Progress - Milestone 1 Foundation Setup

## Progress Summary

### Completed ✅
- **Project Structure**: All directories and empty files created
- **Dependencies**: easy_localization, google_fonts, provider, intl added to pubspec.yaml
- **Localization**: Comprehensive en.json created with all app strings
- **Main App**: main.dart created with easy_localization and Provider setup
- **Legacy Code**: Original code preserved in lib/legacy/ folder
- **File Structure**: All core, data, providers, screens, and widgets files created (empty, ready for implementation)

### In Progress 🔄
- Translation files for Amharic (am.json) and Oromo (om.json)
- Implementation of actual functionality in created files

### Next Steps
1. Populate am.json and om.json translation files
2. Update pubspec.yaml to include translation assets
3. Implement date conversion utilities
4. Implement Bahire Hassab calculations (refactor from legacy)
5. Implement providers with actual logic

