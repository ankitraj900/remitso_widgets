# Remitso Widgets

A collection of custom Flutter widgets with a consistent design system. This package provides beautifully styled and customizable widgets that follow a cohesive design language.

## Features

- **RemitsoTextField**: A customizable text input field with validation and hint messages
- **RemitsoAppBar**: A custom app bar with consistent styling
- **RemitsoRadioButton**: A styled radio button with custom selection indicators
- **RemitsoDropdownButton**: A dropdown button with custom styling and item layouts

## Getting Started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  remitso_widgets: ^0.0.1
```

## Usage

### RemitsoTextField

```dart
RemitsoTextField(
  title: 'Email',
  controller: _emailController,
  hintText: 'Enter your email',
  regexList: [
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+'),
  ],
  hintMessages: [
    'Must be a valid email address',
  ],
);
```

### RemitsoAppBar

```dart
RemitsoAppBar(
  title: 'My App',
  showBackButton: true,
  actions: [
    IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {},
    ),
  ],
);
```

### RemitsoRadioButton

```dart
RemitsoRadioButton<String>(
  value: 'option1',
  groupValue: _selectedOption,
  label: 'Option 1',
  onChanged: (value) {
    setState(() {
      _selectedOption = value;
    });
  },
);
```

### RemitsoDropdownButton

```dart
RemitsoDropdownButton<String>(
  value: _selectedValue,
  items: [
    DropdownMenuItem(
      value: 'item1',
      child: Text('Item 1'),
    ),
    DropdownMenuItem(
      value: 'item2',
      child: Text('Item 2'),
    ),
  ],
  onChanged: (value) {
    setState(() {
      _selectedValue = value;
    });
  },
  hint: 'Select an item',
);
```

## Additional Information

For more information about using this package, please visit the [GitHub repository](https://github.com/yourusername/remitso_widgets).

## License

This project is licensed under the MIT License - see the LICENSE file for details.
