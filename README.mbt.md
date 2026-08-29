# tiye/respo_css

CSS structs for Respo library

## Introduction

`respo_css` is a MoonBit package that provides type-safe CSS support for the Respo library. It offers complete CSS property type definitions, enumeration values, and style building tools, allowing you to build and manage CSS styles in a functional way.

## Installation

Add the dependency to your MoonBit project:

```json
{
  "deps": {
    "tiye/respo_css": "*"
  }
}
```

Or use the moon command line tool:

```bash
moon add tiye/respo_css
```

## Usage

### Basic Usage

```moonbit nocheck
// Create basic styles

///|
let style : RespoStyle = respo_style(
  color=CssColor::Red,
  font_size=16,
  margin=CssSize::Px(10.0),
  display=CssDisplay::Flex,
)

// Convert to CSS string

///|
let _css_string : String = style.to_string()
// Output: "color:red; font-size:16px; margin:10px; display:flex; "
```

### Style Composition

```moonbit nocheck
// Create multiple styles

///|
let base_style : RespoStyle = respo_style(color=CssColor::Blue, font_size=14)

///|
let layout_style : RespoStyle = respo_style(
  display=CssDisplay::Grid,
  gap=CssSize::Px(20.0),
)

// Merge styles

///|
let combined : RespoStyle = base_style.merge(layout_style)

// Add custom properties

///|
let _extended : RespoStyle = combined.add("custom-property", "custom-value")
```

### Supported CSS Properties

- **Layout**: `display`, `position`, `flex-direction`, `justify-content`, `align-items`, etc.
- **Sizing**: `width`, `height`, `margin`, `padding`, etc.
- **Colors**: `color`, `background-color`, `border-color`, etc.
- **Typography**: `font-size`, `font-weight`, `text-align`, `text-decoration`, etc.
- **Transforms**: `transform`, `transition`, `animation`, etc.
- **Grid**: `grid-template-columns`, `grid-template-rows`, `grid-area`, etc.
- **Responsive layout**: typed flex growth/wrapping, axis-specific overflow,
  row/column gaps, logical insets, container queries, and modern viewport units.

## API Documentation

### Main Types

- `RespoStyle`: Style container that stores CSS property key-value pairs
- `CssSize`: CSS size values (px, em, rem, %, auto, etc.)
- `CssColor`: CSS color values (predefined colors, RGB, HSL, etc.)
- `CssDisplay`: display property values (block, flex, grid, etc.)

### Main Functions

- `respo_style(...)`: Create new style objects
- `.merge(other)`: Merge two styles
- `.add(property, value)`: Add custom CSS properties
- `.to_string()`: Convert to CSS string

### Responsive Layout

Use typed layout properties for the common cases, while retaining `.add()` for
new or application-specific CSS declarations:

```moonbit nocheck
///|
let card = respo_style(
  display=CssDisplay::Flex,
  flex_wrap=CssFlexWrap::Wrap,
  flex_basis=CssSize::Percent(50.0),
  flex_grow=1.0,
  row_gap=CssSize::Px(8.0),
  column_gap=CssSize::Px(16.0),
  min_height=CssSize::Dvh(100.0),
  container_type=CssContainerType::InlineSize,
  color_scheme=CssColorScheme::LightDark,
)
```

`CssSize` includes dynamic, small, and large viewport units as well as
container query units such as `Cqw`, `Cqi`, and `Cqmax`. `CssColor` supports
modern perceptual colors through `Oklch` and `Oklab`.

## Development and Contributing

### About AI-Assisted Development

Parts of this project's code and documentation were generated with AI assistance, including:

- Enum type definitions and documentation
- Test case generation
- API documentation improvements

We believe AI-assisted development can improve code quality and development efficiency while maintaining code consistency and completeness.

### How to Contribute

We welcome community contributions! You can participate in the following ways:

1. **Report Issues**: Report bugs or feature requests in GitHub Issues
2. **Submit Code**:

   - Fork this repository
   - Create a feature branch (`git checkout -b feature/amazing-feature`)
   - Commit your changes (`git commit -m 'Add some amazing feature'`)
   - Push to the branch (`git push origin feature/amazing-feature`)
   - Create a Pull Request

3. **Improve Documentation**: Help improve API documentation, usage examples, or README
4. **Add Tests**: Add more test cases for existing functionality
5. **Performance Optimization**: Propose or implement performance improvements

### Development Environment

CI verifies against MoonBit `0.1.20260827`. The setup action downloads the
latest available toolchain and immediately rejects version drift, so upgrading
MoonBit requires an explicit workflow update and a fresh validation run.

```bash
# Clone the repository
git clone https://github.com/tiye/respo_css.git
cd respo_css

# Run tests
moon test

# Check code
moon check

# Build project
moon build
```

### Code Standards

- Follow official MoonBit code style
- Add corresponding test cases for new features
- Provide complete documentation comments for public APIs
- Use `inspect` format to provide usage examples

### Release Checklist

1. Merge a reviewed PR that updates `moon.mod`, `CHANGELOG.md`, and generated
   interfaces together.
2. Run `moon update`, `moon check --target js`, `moon test`, `moon info`, and
   `moon fmt` from a clean checkout; the tree must remain clean afterwards.
3. Create a GitHub release whose tag exactly matches the module version (for
   example, `0.1.7` or `v0.1.7`). The release workflow repeats the verification
   before publishing.
4. Verify a clean downstream `moon add tiye/respo_css@<version>` installation
   and build before closing the release issue.

If publication fails after a release is created, do not retag or overwrite the
same version. Fix the problem, increment the patch version, and create a new
release with clear recovery notes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Related Projects

- [Respo](https://github.com/tiye/respo) - Main UI framework
- [MoonBit](https://www.moonbitlang.com/) - Programming language official website
