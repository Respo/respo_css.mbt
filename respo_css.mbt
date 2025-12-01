///|
/// Represents CSS size values including absolute units, relative units, viewport units, and functions.
///
/// This enum provides type-safe representations for all CSS length and size values,
/// from traditional pixels and percentages to modern viewport units and CSS functions.
///
/// # Examples
///
/// ```
/// inspect(CssSize::Px(100.0), content="100px")
/// inspect(CssSize::Percent(50.0), content="50%")
/// inspect(CssSize::Rem(1.5), content="1.5rem")
/// inspect(CssSize::Vw(80.0), content="80vw")
/// ```
pub(all) enum CssSize {
  /// Automatic sizing - browser determines the size
  /// ```mbt
  /// inspect(CssSize::Auto, content="auto")
  /// ```
  Auto
  /// Pixels - absolute unit, most common for precise sizing
  /// ```mbt
  /// inspect(CssSize::Px(16.0), content="16px")
  /// ```
  Px(Float)
  /// Percentage - relative to parent element's corresponding dimension
  /// ```mbt
  /// inspect(CssSize::Percent(100.0), content="100%")
  /// ```
  Percent(Float)
  /// Em units - relative to current element's font size
  /// ```mbt
  /// inspect(CssSize::Em(1.2), content="1.2000000476837158em")
  /// ```
  Em(Float)
  /// Rem units - relative to root element's font size
  /// ```mbt
  /// inspect(CssSize::Rem(2.0), content="2rem")
  /// ```
  Rem(Float)
  /// Viewport width - percentage of viewport width
  /// ```mbt
  /// inspect(CssSize::Vw(50.0), content="50vw")
  /// ```
  Vw(Float)
  /// Viewport height - percentage of viewport height
  /// ```mbt
  /// inspect(CssSize::Vh(100.0), content="100vh")
  /// ```
  Vh(Float)
  /// Fractional units - for CSS Grid flexible sizing
  /// ```mbt
  /// inspect(CssSize::Fr(1.0), content="1fr")
  /// ```
  Fr(Float)
  /// Character units - relative to width of "0" character
  /// ```mbt
  /// inspect(CssSize::Ch(20.0), content="20ch")
  /// ```
  Ch(Float)
  /// Ex units - relative to height of "x" character
  /// ```mbt
  /// inspect(CssSize::Ex(2.0), content="2ex")
  /// ```
  Ex(Float)
  /// Viewport minimum - smaller of vw or vh
  /// ```mbt
  /// inspect(CssSize::Vmin(50.0), content="50vmin")
  /// ```
  Vmin(Float)
  /// Viewport maximum - larger of vw or vh
  /// ```mbt
  /// inspect(CssSize::Vmax(80.0), content="80vmax")
  /// ```
  Vmax(Float)
  /// Dynamic viewport height - adjusts to actual viewport
  /// ```mbt
  /// inspect(CssSize::Dvh(100.0), content="100dvh")
  /// ```
  Dvh(Float)
  /// Dynamic viewport width - adjusts to actual viewport
  /// ```mbt
  /// inspect(CssSize::Dvw(100.0), content="100dvw")
  /// ```
  Dvw(Float)
  /// Large viewport height - largest possible viewport height
  /// ```mbt
  /// inspect(CssSize::Lvh(100.0), content="100lvh")
  /// ```
  Lvh(Float)
  /// Large viewport width - largest possible viewport width
  /// ```mbt
  /// inspect(CssSize::Lvw(100.0), content="100lvw")
  /// ```
  Lvw(Float)
  /// Small viewport height - smallest possible viewport height
  /// ```mbt
  /// inspect(CssSize::Svh(100.0), content="100svh")
  /// ```
  Svh(Float)
  /// Small viewport width - smallest possible viewport width
  /// ```mbt
  /// inspect(CssSize::Svw(100.0), content="100svw")
  /// ```
  Svw(Float)
  /// CSS functions like calc(), min(), max(), clamp()
  /// ```mbt
  /// inspect(CssSize::Function(CssFunction::Calc("100vw - 40px")), content="calc(100vw - 40px)")
  /// ```
  Function(CssFunction)
  /// Custom CSS values not covered by other variants
  /// ```mbt
  /// inspect(CssSize::Custom("fit-content"), content="fit-content")
  /// ```
  Custom(String)
} derive(Eq)

///|
pub impl Show for CssSize with output(self, logger) {
  let ret = match self {
    Auto => "auto"
    Px(value) => "\{value}px"
    Percent(value) => "\{value}%"
    Em(value) => "\{value}em"
    Rem(value) => "\{value}rem"
    Vw(value) => "\{value}vw"
    Vh(value) => "\{value}vh"
    Fr(value) => "\{value}fr"
    Ch(value) => "\{value}ch"
    Ex(value) => "\{value}ex"
    Vmin(value) => "\{value}vmin"
    Vmax(value) => "\{value}vmax"
    Dvh(value) => "\{value}dvh"
    Dvw(value) => "\{value}dvw"
    Lvh(value) => "\{value}lvh"
    Lvw(value) => "\{value}lvw"
    Svh(value) => "\{value}svh"
    Svw(value) => "\{value}svw"
    Function(func) => func.to_string()
    Custom(value) => value
  }
  logger.write_string(ret)
}

///|
/// A type-safe CSS style container that holds CSS property-value pairs.
///
/// `RespoStyle` is the main struct for building and managing CSS styles in a functional way.
/// It stores CSS properties as an array of string tuples and provides methods for combining,
/// extending, and converting styles to CSS strings.
///
/// # Examples
///
/// ```moonbit
/// // Create a basic style
/// let style = respo_style(
///   color=CssColor::Red,
///   font_size=16,
///   margin=CssSize::Px(10.0)
/// )
///
/// // Add custom properties
/// inspect(style.add("custom-property", "custom-value"), content="color:red; font-size:16px; margin:10px; custom-property:custom-value; ")
///
/// // Merge with another style
/// let other = respo_style(background_color=CssColor::Blue)
/// inspect(style.merge(other), content="color:red; font-size:16px; margin:10px; custom-property:custom-value; background-color:blue; ")
///
/// // Convert to CSS string
/// inspect(style.to_string(), content="color:red; font-size:16px; margin:10px; custom-property:custom-value; background-color:blue; ")
/// ```
///
/// # Usage
///
/// - Use `respo_style()` function to create new styles with type-safe properties
/// - Use `.add()` method to add custom CSS properties not covered by the type system
/// - Use `.merge()` method to combine multiple styles
/// - Use `.to_string()` to generate the final CSS output
///
/// # Internal Structure
///
/// Internally stores CSS properties as `Array[(String, String)]` where each tuple
/// represents a CSS property name and its corresponding value.
pub(all) struct RespoStyle(Array[(String, String)]) derive(Eq, Default)

// is_empty

///|
pub fn RespoStyle::is_empty(self : RespoStyle) -> Bool {
  self.0.is_empty()
}

///|
pub impl Show for RespoStyle with output(self, logger) {
  let mut result = ""
  for pair in self.0 {
    let (property, value) = pair
    result = result + property + ":" + value + "; "
  }
  logger.write_string(result)
}

///|
/// for custom styles not defined with enum, use this function to add
pub fn RespoStyle::add(
  self : RespoStyle,
  property : String,
  value : String,
) -> RespoStyle {
  self.0.push((property, value))
  self
}

///|
pub fn RespoStyle::merge(self : RespoStyle, other : RespoStyle) -> RespoStyle {
  let mut result = self
  for pair in other.0 {
    let (property, value) = pair
    result = result.add(property, value)
  }
  result
}

///|
pub fn RespoStyle::length(self : RespoStyle) -> Int {
  self.0.length()
}

///|
/// Create a new RespoStyle object
pub fn respo_style(
  // Basic Styling
  color? : CssColor,
  background_color? : CssColor,
  font_size? : UInt,
  font_family? : String,
  font_weight? : String,
  text_align? : CssTextAlign,
  display? : CssDisplay,
  margin? : CssSize,
  padding? : CssSize,
  border? : CssBorder,
  width? : CssSize,
  height? : CssSize,

  // Layout & Positioning
  position? : CssPosition,
  top? : CssSize,
  right? : CssSize,
  bottom? : CssSize,
  left? : CssSize,
  float? : String,
  clear? : String,
  overflow? : CssOverflow,
  z_index? : Int,
  flex? : Float,
  flex_direction? : CssFlexDirection,
  justify_content? : CssFlexJustifyContent,
  align_items? : CssFlexAlignItems,
  align_content? : CssFlexAlignContent,
  order? : Int,

  // Text Styling
  text_decoration? : CssTextDecoration,
  text_transform? : String,
  line_height? : CssLineHeight,
  letter_spacing? : String,
  white_space? : String,
  word_break? : CssWordBreak,

  // Visual Effects
  opacity? : Float,
  visibility? : String,
  box_shadow? : String,
  transition? : String,
  box_sizing? : CssBoxSizing,

  // more
  border_radius? : Float,
  padding_top? : CssSize,
  padding_bottom? : CssSize,
  padding_left? : CssSize,
  padding_right? : CssSize,
  min_width? : CssSize,
  max_width? : CssSize,
  vertical_align? : CssVerticalAlign,
  border_style? : CssBorderStyle,
  border_color? : CssColor,
  border_width? : CssSize,
  cursor? : CssCursor,
  transition_duration? : CssDuration,
  transform? : CssTransform,
  outline? : CssOutline,
  user_select? : CssUserSelect,
  margin_top? : CssSize,
  margin_bottom? : CssSize,
  margin_left? : CssSize,
  margin_right? : CssSize,
  max_height? : CssSize,
  transform_property? : Array[String],
  gap? : CssSize,
  content? : String,
  content_visibility? : CssContentVisibility,
  filter? : CssFilter,
  object_fit? : CssObjectFit,
  overscroll_behavior_x? : CssOverscrollBehavior,
  overscroll_behavior_y? : CssOverscrollBehavior,

  // CSS Grid Layout
  grid_template_columns? : CssGridTemplateColumns,
  grid_template_rows? : CssGridTemplateRows,
  grid_column? : CssGridArea,
  grid_row? : CssGridArea,
  grid_area? : String,
  justify_items? : CssJustifyItems,
  align_items_grid? : CssAlignItems,

  // CSS Animation
  animation_direction? : CssAnimationDirection,
  animation_fill_mode? : CssAnimationFillMode,
  animation_play_state? : CssAnimationPlayState,
  animation_name? : String,
  animation_duration? : CssDuration,
  animation_timing_function? : CssTimingFunction,
  animation_delay? : CssDuration,
  animation_iteration_count? : String,

  // Enhanced Typography
  font_style? : CssFontStyle,
  font_variant? : CssFontVariant,
  text_transform_enhanced? : CssTextTransform,

  // Modern CSS Features
  aspect_ratio? : CssAspectRatio,
  scroll_behavior? : CssScrollBehavior,
  resize? : CssResize,
  container_type? : CssContainerType,
  container_name? : String,

  // CSS Functions and Extended Sizes
  width_extended? : CssSize,
  height_extended? : CssSize,
  margin_extended? : CssSize,
  padding_extended? : CssSize,
) -> RespoStyle {
  let style : Array[(String, String)] = []
  if color is Some(value) {
    style.push(("color", value.to_string()))
  }
  if background_color is Some(value) {
    style.push(("background-color", value.to_string()))
  }
  if font_size is Some(value) {
    style.push(("font-size", value.to_string() + "px"))
  }
  if font_family is Some(value) {
    style.push(("font-family", value))
  }
  if font_weight is Some(value) {
    style.push(("font-weight", value))
  }
  if text_align is Some(value) {
    style.push(("text-align", value.to_string()))
  }
  if display is Some(value) {
    style.push(("display", value.to_string()))
  }
  if margin is Some(value) {
    style.push(("margin", value.to_string()))
  }
  if padding is Some(value) {
    style.push(("padding", value.to_string()))
  }
  if border is Some(value) {
    style.push(("border", value.to_string()))
  }
  if width is Some(value) {
    style.push(("width", value.to_string()))
  }
  if height is Some(value) {
    style.push(("height", value.to_string()))
  }
  if position is Some(value) {
    style.push(("position", value.to_string()))
  }
  if top is Some(value) {
    style.push(("top", value.to_string()))
  }
  if right is Some(value) {
    style.push(("right", value.to_string()))
  }
  if bottom is Some(value) {
    style.push(("bottom", value.to_string()))
  }
  if left is Some(value) {
    style.push(("left", value.to_string()))
  }
  if float is Some(value) {
    style.push(("float", value))
  }
  if clear is Some(value) {
    style.push(("clear", value))
  }
  if overflow is Some(value) {
    style.push(("overflow", value.to_string()))
  }
  if z_index is Some(value) {
    style.push(("z-index", value.to_string()))
  }
  if flex is Some(value) {
    style.push(("flex", value.to_string()))
  }
  if flex_direction is Some(value) {
    style.push(("flex-direction", value.to_string()))
  }
  if justify_content is Some(value) {
    style.push(("justify-content", value.to_string()))
  }
  if align_items is Some(value) {
    style.push(("align-items", value.to_string()))
  }
  if align_content is Some(value) {
    style.push(("align-content", value.to_string()))
  }
  if order is Some(value) {
    style.push(("order", value.to_string()))
  }
  if text_decoration is Some(value) {
    style.push(("text-decoration", value.to_string()))
  }
  if text_transform is Some(value) {
    style.push(("text-transform", value))
  }
  if line_height is Some(value) {
    style.push(("line-height", value.to_string()))
  }
  if letter_spacing is Some(value) {
    style.push(("letter-spacing", value))
  }
  if white_space is Some(value) {
    style.push(("white-space", value))
  }
  if word_break is Some(value) {
    style.push(("word-break", value.to_string()))
  }
  if opacity is Some(value) {
    style.push(("opacity", value.to_string()))
  }
  if visibility is Some(value) {
    style.push(("visibility", value))
  }
  if box_shadow is Some(value) {
    style.push(("box-shadow", value))
  }
  if transition is Some(value) {
    style.push(("transition", value))
  }
  if box_sizing is Some(value) {
    style.push(("box-sizing", value.to_string()))
  }
  if border_radius is Some(value) {
    style.push(("border-radius", value.to_string() + "px"))
  }
  if padding_top is Some(value) {
    style.push(("padding-top", value.to_string()))
  }
  if padding_bottom is Some(value) {
    style.push(("padding-bottom", value.to_string()))
  }
  if padding_left is Some(value) {
    style.push(("padding-left", value.to_string()))
  }
  if padding_right is Some(value) {
    style.push(("padding-right", value.to_string()))
  }
  if max_width is Some(value) {
    style.push(("max-width", value.to_string()))
  }
  if min_width is Some(value) {
    style.push(("min-width", value.to_string()))
  }
  if vertical_align is Some(value) {
    style.push(("vertical-align", value.to_string()))
  }
  if border_color is Some(value) {
    style.push(("border-color", value.to_string()))
  }
  if border_width is Some(value) {
    style.push(("border-width", value.to_string()))
  }
  if border_style is Some(value) {
    style.push(("border-style", value.to_string()))
  }
  if cursor is Some(value) {
    style.push(("cursor", value.to_string()))
  }
  if transition_duration is Some(value) {
    style.push(("transition-duration", value.to_string()))
  }
  if transform is Some(value) {
    style.push(("transform", value.to_string()))
  }
  if outline is Some(value) {
    style.push(("outline", value.to_string()))
  }
  if user_select is Some(value) {
    style.push(("user-select", value.to_string()))
  }
  if margin_top is Some(value) {
    style.push(("margin-top", value.to_string()))
  }
  if margin_bottom is Some(value) {
    style.push(("margin-bottom", value.to_string()))
  }
  if margin_left is Some(value) {
    style.push(("margin-left", value.to_string()))
  }
  if margin_right is Some(value) {
    style.push(("margin-right", value.to_string()))
  }
  if max_height is Some(value) {
    style.push(("max-height", value.to_string()))
  }
  if transform_property is Some(xs) {
    let value = xs.join(",")
    style.push(("transform-property", value))
  }
  if gap is Some(value) {
    style.push(("gap", value.to_string()))
  }
  if content is Some(value) {
    style.push(("content", value))
  }
  if content_visibility is Some(value) {
    style.push(("content-visibility", value.to_string()))
  }
  if filter is Some(value) {
    style.push(("filter", value.to_string()))
  }
  if object_fit is Some(value) {
    style.push(("object-fit", value.to_string()))
  }
  if overscroll_behavior_x is Some(value) {
    style.push(("overscroll-behavior-x", value.to_string()))
  }
  if overscroll_behavior_y is Some(value) {
    style.push(("overscroll-behavior-y", value.to_string()))
  }

  // CSS Grid Layout
  if grid_template_columns is Some(value) {
    style.push(("grid-template-columns", value.to_string()))
  }
  if grid_template_rows is Some(value) {
    style.push(("grid-template-rows", value.to_string()))
  }
  if grid_column is Some(value) {
    style.push(("grid-column", value.to_string()))
  }
  if grid_row is Some(value) {
    style.push(("grid-row", value.to_string()))
  }
  if grid_area is Some(value) {
    style.push(("grid-area", value))
  }
  if justify_items is Some(value) {
    style.push(("justify-items", value.to_string()))
  }
  if align_items_grid is Some(value) {
    style.push(("align-items", value.to_string()))
  }

  // CSS Animation
  if animation_direction is Some(value) {
    style.push(("animation-direction", value.to_string()))
  }
  if animation_fill_mode is Some(value) {
    style.push(("animation-fill-mode", value.to_string()))
  }
  if animation_play_state is Some(value) {
    style.push(("animation-play-state", value.to_string()))
  }
  if animation_name is Some(value) {
    style.push(("animation-name", value))
  }
  if animation_duration is Some(value) {
    style.push(("animation-duration", value.to_string()))
  }
  if animation_timing_function is Some(value) {
    style.push(("animation-timing-function", value.to_string()))
  }
  if animation_delay is Some(value) {
    style.push(("animation-delay", value.to_string()))
  }
  if animation_iteration_count is Some(value) {
    style.push(("animation-iteration-count", value))
  }

  // Enhanced Typography
  if font_style is Some(value) {
    style.push(("font-style", value.to_string()))
  }
  if font_variant is Some(value) {
    style.push(("font-variant", value.to_string()))
  }
  if text_transform_enhanced is Some(value) {
    style.push(("text-transform", value.to_string()))
  }

  // Modern CSS Features
  if aspect_ratio is Some(value) {
    style.push(("aspect-ratio", value.to_string()))
  }
  if scroll_behavior is Some(value) {
    style.push(("scroll-behavior", value.to_string()))
  }
  if resize is Some(value) {
    style.push(("resize", value.to_string()))
  }
  if container_type is Some(value) {
    style.push(("container-type", value.to_string()))
  }
  if container_name is Some(value) {
    style.push(("container-name", value))
  }

  // CSS Functions and Extended Sizes
  if width_extended is Some(value) {
    style.push(("width", value.to_string()))
  }
  if height_extended is Some(value) {
    style.push(("height", value.to_string()))
  }
  if margin_extended is Some(value) {
    style.push(("margin", value.to_string()))
  }
  if padding_extended is Some(value) {
    style.push(("padding", value.to_string()))
  }
  RespoStyle(style)
}

///|
pub(all) enum CssOutline {
  None
  Outline(CssSize, CssBorderStyle, CssColor)
} derive(Eq)

///|
pub impl Show for CssOutline with output(self, logger) {
  let ret = match self {
    None => "none"
    Outline(width, style, color) =>
      str_spaced([width.to_string(), style, color])
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssDuration {
  Ms(Int)
  S(Float)
}

///|
pub impl Show for CssDuration with output(self, logger) {
  let ret = match self {
    Ms(value) => value.to_string() + "ms"
    S(value) => value.to_string() + "s"
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssUserSelect {
  None
  Text
  All
  Auto
}

///|
pub impl Show for CssUserSelect with output(self, logger) {
  let ret = match self {
    None => "none"
    Text => "text"
    All => "all"
    Auto => "auto"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS position property values that control element positioning behavior.
///
/// The position property determines how an element is positioned in the document
/// and affects how the top, right, bottom, and left properties work.
///
/// # Examples
///
/// ```
/// inspect(CssPosition::Static, content="static")
/// inspect(CssPosition::Relative, content="relative")
/// inspect(CssPosition::Absolute, content="absolute")
/// inspect(CssPosition::Fixed, content="fixed")
/// inspect(CssPosition::Sticky, content="sticky")
/// ```
pub(all) enum CssPosition {
  /// Default positioning, follows normal document flow
  /// ```mbt
  /// inspect(CssPosition::Static, content="static")
  /// ```
  Static
  /// Positioned relative to its normal position
  /// ```mbt
  /// inspect(CssPosition::Relative, content="relative")
  /// ```
  Relative
  /// Positioned relative to nearest positioned ancestor
  /// ```mbt
  /// inspect(CssPosition::Absolute, content="absolute")
  /// ```
  Absolute
  /// Positioned relative to the viewport
  /// ```mbt
  /// inspect(CssPosition::Fixed, content="fixed")
  /// ```
  Fixed
  /// Switches between relative and fixed based on scroll position
  /// ```mbt
  /// inspect(CssPosition::Sticky, content="sticky")
  /// ```
  Sticky
} derive(Eq)

///|
pub impl Show for CssPosition with output(self, logger) {
  let ret = match self {
    Static => "static"
    Relative => "relative"
    Absolute => "absolute"
    Fixed => "fixed"
    Sticky => "sticky"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS color values in various formats including RGB, HSL, hex, and named colors.
///
/// This enum provides comprehensive support for CSS color specifications, from traditional
/// hex and RGB values to modern HSL and HSLUV color spaces, plus common named colors.
///
/// # Examples
///
/// ```
/// inspect(CssColor::Hex(255, 0, 0), content="#ff0000")
/// inspect(CssColor::Rgb(0, 255, 0), content="rgb(0, 255, 0)")
/// inspect(CssColor::Hsl(240, 100, 50), content="hsl(240, 100%, 50%)")
/// inspect(CssColor::Blue, content="blue")
/// ```
pub(all) enum CssColor {
  /// hsla(h, s%, l%, a) — supported by Chrome
  Hsla(UInt, UInt, UInt, Float)
  /// hsl(h, s%, l%) — supported by Chrome
  Hsl(UInt, UInt, UInt)
  /// hsluv(h, s%, l%, a) — non-standard, not supported by browsers
  Hsluva(UInt, UInt, UInt, Float)
  /// hsluv(h, s%, l%) — non-standard, not supported by browsers
  Hsluv(UInt, UInt, UInt)
  /// rgba(r, g, b, a) — supported by Chrome
  Rgba(UInt, UInt, UInt, Float)
  /// rgb(r, g, b) — supported by Chrome
  Rgb(UInt, UInt, UInt)
  /// #rrggbb — supported by Chrome
  Hex(UInt, UInt, UInt)
  /// lch(L C H) — supported by Chrome
  Lch(Float, Float, Float)
  /// lch(L C H / A) — supported by Chrome
  Lcha(Float, Float, Float, Float)
  /// lab(L a b) — supported by Chrome
  Lab(Float, Float, Float)
  /// lab(L a b / A) — supported by Chrome
  Laba(Float, Float, Float, Float)
  /// oklch(L C H) — supported by Chrome
  Oklch(Float, Float, Float)
  /// oklch(L C H / A) — supported by Chrome
  Oklcha(Float, Float, Float, Float)
  /// oklab(L a b) — supported by Chrome
  Oklab(Float, Float, Float)
  /// oklab(L a b / A) — supported by Chrome
  Oklaba(Float, Float, Float, Float)
  /// hsl(0, 100%, 50%)
  Red
  /// hsl(120, 100%, 50%)
  Green
  /// hsl(240, 100%, 50%)
  Blue
  /// hsl(0, 0%, 100%)
  White
  /// hsl(0, 0%, 0%)
  Black
  /// hsl(0, 0%, 50%)
  Gray
  /// hsl(60, 100%, 50%)
  Yellow
  /// hsl(300, 100%, 50%)
  Purple
  /// hsl(180, 100%, 50%)
  Cyan
  /// hsl(39, 100%, 50%)
  Orange
  /// hsl(350, 100%, 88%)
  Pink
  /// Example raw CSS color: hsl(270, 50%, 40%) (rebeccapurple)
  RawString(String)
  /// Fully transparent color
  /// ```mbt
  /// inspect(CssColor::Transparent, content="transparent")
  /// ```
  Transparent
} derive(Eq)

///|
/// Convert a UInt to a 2-digit hexadecimal string
fn uint_to_hex(value : UInt) -> String {
  let hex_digits = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f",
  ]
  let high = (value / 16).reinterpret_as_int()
  let low = (value % 16).reinterpret_as_int()
  hex_digits[high] + hex_digits[low]
}

///|
pub impl Show for CssColor with output(self, logger) {
  let ret = match self {
    Hsla(h, s, l, a) => {
      let h_str = h.to_string()
      let s_str = s.to_string()
      let l_str = l.to_string()
      let a_str = a.to_string()
      "hsla(" + h_str + ", " + s_str + "%, " + l_str + "%, " + a_str + ")"
    }
    Hsl(h, s, l) => {
      let h_str = h.to_string()
      let s_str = s.to_string()
      let l_str = l.to_string()
      "hsl(" + h_str + ", " + s_str + "%, " + l_str + "%)"
    }
    Hsluva(h, s, l, a) => {
      let h_str = h.to_string()
      let s_str = s.to_string()
      let l_str = l.to_string()
      let a_str = a.to_string()
      "hsluva(" + h_str + ", " + s_str + "%, " + l_str + "%, " + a_str + ")"
    }
    Hsluv(h, s, l) => {
      let h_str = h.to_string()
      let s_str = s.to_string()
      let l_str = l.to_string()
      "hsluv(" + h_str + ", " + s_str + "%, " + l_str + "%)"
    }
    Rgba(r, g, b, a) => {
      let r_str = r.to_string()
      let g_str = g.to_string()
      let b_str = b.to_string()
      let a_str = a.to_string()
      "rgba(" + r_str + ", " + g_str + ", " + b_str + ", " + a_str + ")"
    }
    Rgb(r, g, b) => {
      let r_str = r.to_string()
      let g_str = g.to_string()
      let b_str = b.to_string()
      "rgb(" + r_str + ", " + g_str + ", " + b_str + ")"
    }
    Hex(r, g, b) => {
      let r_hex = uint_to_hex(r)
      let g_hex = uint_to_hex(g)
      let b_hex = uint_to_hex(b)
      "#" + r_hex + g_hex + b_hex
    }
    Lcha(l, c, h, a) => {
      let l_str = l.to_string()
      let c_str = c.to_string()
      let h_str = h.to_string()
      let a_str = a.to_string()
      "lch(" + l_str + " " + c_str + " " + h_str + " / " + a_str + ")"
    }
    Lch(l, c, h) => {
      let l_str = l.to_string()
      let c_str = c.to_string()
      let h_str = h.to_string()
      "lch(" + l_str + " " + c_str + " " + h_str + ")"
    }
    Laba(l, a1, b1, alpha) => {
      let l_str = l.to_string()
      let a_str = a1.to_string()
      let b_str = b1.to_string()
      let alpha_str = alpha.to_string()
      "lab(" + l_str + " " + a_str + " " + b_str + " / " + alpha_str + ")"
    }
    Lab(l, a1, b1) => {
      let l_str = l.to_string()
      let a_str = a1.to_string()
      let b_str = b1.to_string()
      "lab(" + l_str + " " + a_str + " " + b_str + ")"
    }
    Oklcha(l, c, h, a) => {
      let l_str = l.to_string()
      let c_str = c.to_string()
      let h_str = h.to_string()
      let a_str = a.to_string()
      "oklch(" + l_str + " " + c_str + " " + h_str + " / " + a_str + ")"
    }
    Oklch(l, c, h) => {
      let l_str = l.to_string()
      let c_str = c.to_string()
      let h_str = h.to_string()
      "oklch(" + l_str + " " + c_str + " " + h_str + ")"
    }
    Oklaba(l, a1, b1, alpha) => {
      let l_str = l.to_string()
      let a_str = a1.to_string()
      let b_str = b1.to_string()
      let alpha_str = alpha.to_string()
      "oklab(" + l_str + " " + a_str + " " + b_str + " / " + alpha_str + ")"
    }
    Oklab(l, a1, b1) => {
      let l_str = l.to_string()
      let a_str = a1.to_string()
      let b_str = b1.to_string()
      "oklab(" + l_str + " " + a_str + " " + b_str + ")"
    }
    Red => "red"
    Green => "green"
    Blue => "blue"
    White => "white"
    Black => "black"
    Gray => "gray"
    Yellow => "yellow"
    Purple => "purple"
    Cyan => "cyan"
    Orange => "orange"
    Pink => "pink"
    RawString(value) => value
    Transparent => "transparent"
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssLineHeight {
  Em(Float)
  Px(Float)
  Percent(Float)
  Normal
} derive(Eq)

///|
pub impl Show for CssLineHeight with output(self, logger) {
  let ret = match self {
    Em(value) => value.to_string() + "em"
    Px(value) => value.to_string() + "px"
    Percent(value) => value.to_string() + "%"
    Normal => "normal"
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssWordBreak {
  Normal
  BreakAll
  KeepAll
  BreakWord
}

///|
pub impl Show for CssWordBreak with output(self, logger) {
  let ret = match self {
    Normal => "normal"
    BreakAll => "break-all"
    KeepAll => "keep-all"
    BreakWord => "break-word"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS display property values that control element layout behavior.
///
/// The display property is fundamental to CSS layout, determining how an element
/// participates in the document flow and how its children are laid out.
///
/// # Examples
///
/// ```
/// inspect(CssDisplay::Block, content="block")
/// inspect(CssDisplay::Flex, content="flex")
/// inspect(CssDisplay::Grid, content="grid")
/// inspect(CssDisplay::None, content="none")
/// ```
pub(all) enum CssDisplay {
  /// Element generates a block-level box, taking full width
  /// ```mbt
  /// inspect(CssDisplay::Block, content="block")
  /// ```
  Block
  /// Element generates inline-level boxes that flow with text
  /// ```mbt
  /// inspect(CssDisplay::Inline, content="inline")
  /// ```
  Inline
  /// Element flows inline but behaves as a block internally
  /// ```mbt
  /// inspect(CssDisplay::InlineBlock, content="inline-block")
  /// ```
  InlineBlock
  /// Element becomes a block-level flex container
  /// ```mbt
  /// inspect(CssDisplay::Flex, content="flex")
  /// ```
  Flex
  /// Element becomes an inline-level flex container
  /// ```mbt
  /// inspect(CssDisplay::InlineFlex, content="inline-flex")
  /// ```
  InlineFlex
  /// Element becomes a block-level grid container
  /// ```mbt
  /// inspect(CssDisplay::Grid, content="grid")
  /// ```
  Grid
  /// Element becomes an inline-level grid container
  /// ```mbt
  /// inspect(CssDisplay::InlineGrid, content="inline-grid")
  /// ```
  InlineGrid
  /// Element is completely removed from the document flow
  /// ```mbt
  /// inspect(CssDisplay::None, content="none")
  /// ```
  None
} derive(Eq)

///|
pub impl Show for CssDisplay with output(self, logger) {
  let ret = match self {
    Block => "block"
    Inline => "inline"
    InlineBlock => "inline-block"
    Flex => "flex"
    InlineFlex => "inline-flex"
    Grid => "grid"
    InlineGrid => "inline-grid"
    None => "none"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS flex-wrap property values that control how flex items wrap within a flex container.
///
/// The flex-wrap property determines whether flex items are forced onto a single line
/// or can wrap onto multiple lines, and the direction of any new lines.
///
/// # Examples
///
/// ```
/// inspect(CssFlexWrap::Wrap, content="wrap")
/// inspect(CssFlexWrap::Nowrap, content="nowrap")
/// inspect(CssFlexWrap::WrapReverse, content="wrap-reverse")
/// ```
pub(all) enum CssFlexWrap {
  /// Flex items wrap onto multiple lines as needed
  /// ```mbt
  /// inspect(CssFlexWrap::Wrap, content="wrap")
  /// ```
  Wrap
  /// Flex items are forced onto a single line (default)
  /// ```mbt
  /// inspect(CssFlexWrap::Nowrap, content="nowrap")
  /// ```
  Nowrap
  /// Flex items wrap onto multiple lines in reverse order
  /// ```mbt
  /// inspect(CssFlexWrap::WrapReverse, content="wrap-reverse")
  /// ```
  WrapReverse
} derive(Eq)

///|
pub impl Show for CssFlexWrap with output(self, logger) {
  let ret = match self {
    Wrap => "wrap"
    Nowrap => "nowrap"
    WrapReverse => "wrap-reverse"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS flex-direction property values that control the main axis of flex containers.
///
/// The flex-direction property establishes the main axis of a flex container,
/// determining the direction flex items are placed and how they flow.
///
/// # Examples
///
/// ```
/// inspect(CssFlexDirection::Row, content="row")
/// inspect(CssFlexDirection::Column, content="column")
/// inspect(CssFlexDirection::RowReverse, content="row-reverse")
/// inspect(CssFlexDirection::ColumnReverse, content="column-reverse")
/// ```
pub(all) enum CssFlexDirection {
  /// Items flow horizontally from left to right (default direction)
  /// ```mbt
  /// inspect(CssFlexDirection::Row, content="row")
  /// ```
  Row
  /// Items flow horizontally from right to left (reversed horizontal)
  /// ```mbt
  /// inspect(CssFlexDirection::RowReverse, content="row-reverse")
  /// ```
  RowReverse
  /// Items flow vertically from top to bottom
  /// ```mbt
  /// inspect(CssFlexDirection::Column, content="column")
  /// ```
  Column
  /// Items flow vertically from bottom to top (reversed vertical)
  /// ```mbt
  /// inspect(CssFlexDirection::ColumnReverse, content="column-reverse")
  /// ```
  ColumnReverse
} derive(Eq)

///|
pub impl Show for CssFlexDirection with output(self, logger) {
  let ret = match self {
    Row => "row"
    RowReverse => "row-reverse"
    Column => "column"
    ColumnReverse => "column-reverse"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS vertical-align property values that control vertical alignment of inline elements.
///
/// The vertical-align property sets the vertical alignment of an inline, inline-block,
/// or table-cell element relative to its parent's baseline or line box.
///
/// # Examples
///
/// ```
/// inspect(CssVerticalAlign::Top, content="top")
/// inspect(CssVerticalAlign::Middle, content="middle")
/// inspect(CssVerticalAlign::Bottom, content="bottom")
/// ```
pub(all) enum CssVerticalAlign {
  /// Aligns the top of the element with the top of the line box
  /// ```mbt
  /// inspect(CssVerticalAlign::Top, content="top")
  /// ```
  Top
  /// Aligns the middle of the element with the middle of the line box
  /// ```mbt
  /// inspect(CssVerticalAlign::Middle, content="middle")
  /// ```
  Middle
  /// Aligns the bottom of the element with the bottom of the line box
  /// ```mbt
  /// inspect(CssVerticalAlign::Bottom, content="bottom")
  /// ```
  Bottom
}

///|
pub impl Show for CssVerticalAlign with output(self, logger) {
  let ret = match self {
    Top => "top"
    Middle => "middle"
    Bottom => "bottom"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS justify-content property values that control alignment along the main axis in flex containers.
///
/// The justify-content property defines how flex items are distributed along the main axis
/// of a flex container, controlling spacing and alignment.
///
/// # Examples
///
/// ```
/// inspect(CssFlexJustifyContent::FlexStart, content="flex-start")
/// inspect(CssFlexJustifyContent::Center, content="center")
/// inspect(CssFlexJustifyContent::SpaceBetween, content="space-between")
/// ```
pub(all) enum CssFlexJustifyContent {
  /// Items are packed toward the start of the flex direction
  /// ```mbt
  /// inspect(CssFlexJustifyContent::FlexStart, content="flex-start")
  /// ```
  FlexStart
  /// Items are packed toward the end of the flex direction
  /// ```mbt
  /// inspect(CssFlexJustifyContent::FlexEnd, content="flex-end")
  /// ```
  FlexEnd
  /// Items are centered along the main axis
  /// ```mbt
  /// inspect(CssFlexJustifyContent::Center, content="center")
  /// ```
  Center
  /// Items are evenly distributed with space between them
  /// ```mbt
  /// inspect(CssFlexJustifyContent::SpaceBetween, content="space-between")
  /// ```
  SpaceBetween
  /// Items are evenly distributed with equal space around them
  /// ```mbt
  /// inspect(CssFlexJustifyContent::SpaceAround, content="space-around")
  /// ```
  SpaceAround
  /// Items are evenly distributed with equal space between them
  /// ```mbt
  /// inspect(CssFlexJustifyContent::SpaceEvenly, content="space-evenly")
  /// ```
  SpaceEvenly
} derive(Eq)

///|
pub impl Show for CssFlexJustifyContent with output(self, logger) {
  let ret = match self {
    FlexStart => "flex-start"
    FlexEnd => "flex-end"
    Center => "center"
    SpaceBetween => "space-between"
    SpaceAround => "space-around"
    SpaceEvenly => "space-evenly"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS align-items property values that control alignment along the cross axis in flex containers.
///
/// The align-items property defines how flex items are aligned along the cross axis
/// (perpendicular to the main axis) of a flex container.
///
/// # Examples
///
/// ```
/// inspect(CssFlexAlignItems::FlexStart, content="flex-start")
/// inspect(CssFlexAlignItems::Center, content="center")
/// inspect(CssFlexAlignItems::Stretch, content="stretch")
/// ```
pub(all) enum CssFlexAlignItems {
  /// Items are aligned to the start of the cross axis
  /// ```mbt
  /// inspect(CssFlexAlignItems::FlexStart, content="flex-start")
  /// ```
  FlexStart
  /// Items are aligned to the end of the cross axis
  /// ```mbt
  /// inspect(CssFlexAlignItems::FlexEnd, content="flex-end")
  /// ```
  FlexEnd
  /// Items are centered along the cross axis
  /// ```mbt
  /// inspect(CssFlexAlignItems::Center, content="center")
  /// ```
  Center
  /// Items are aligned to their baselines
  /// ```mbt
  /// inspect(CssFlexAlignItems::Baseline, content="baseline")
  /// ```
  Baseline
  /// Items are stretched to fill the container (default)
  /// ```mbt
  /// inspect(CssFlexAlignItems::Stretch, content="stretch")
  /// ```
  Stretch
} derive(Eq)

///|
pub impl Show for CssFlexAlignItems with output(self, logger) {
  let ret = match self {
    FlexStart => "flex-start"
    FlexEnd => "flex-end"
    Center => "center"
    Baseline => "baseline"
    Stretch => "stretch"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS align-content property values that control alignment of flex lines in multi-line flex containers.
///
/// The align-content property aligns flex lines when there is extra space in the cross axis,
/// similar to how justify-content aligns items within the main axis.
///
/// # Examples
///
/// ```
/// inspect(CssFlexAlignContent::FlexStart, content="flex-start")
/// inspect(CssFlexAlignContent::Center, content="center")
/// inspect(CssFlexAlignContent::SpaceBetween, content="space-between")
/// ```
pub(all) enum CssFlexAlignContent {
  /// Lines are packed toward the start of the cross axis
  /// ```mbt
  /// inspect(CssFlexAlignContent::FlexStart, content="flex-start")
  /// ```
  FlexStart
  /// Lines are packed toward the end of the cross axis
  /// ```mbt
  /// inspect(CssFlexAlignContent::FlexEnd, content="flex-end")
  /// ```
  FlexEnd
  /// Lines are centered along the cross axis
  /// ```mbt
  /// inspect(CssFlexAlignContent::Center, content="center")
  /// ```
  Center
  /// Lines are evenly distributed with space between them
  /// ```mbt
  /// inspect(CssFlexAlignContent::SpaceBetween, content="space-between")
  /// ```
  SpaceBetween
  /// Lines are evenly distributed with equal space around them
  /// ```mbt
  /// inspect(CssFlexAlignContent::SpaceAround, content="space-around")
  /// ```
  SpaceAround
  /// Lines are stretched to fill the container (default)
  /// ```mbt
  /// inspect(CssFlexAlignContent::Stretch, content="stretch")
  /// ```
  Stretch
} derive(Eq)

///|
pub impl Show for CssFlexAlignContent with output(self, logger) {
  let ret = match self {
    FlexStart => "flex-start"
    FlexEnd => "flex-end"
    Center => "center"
    SpaceBetween => "space-between"
    SpaceAround => "space-around"
    Stretch => "stretch"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS border-style property values that control the appearance of element borders.
///
/// The border-style property defines the visual style of an element's border,
/// determining how the border line is drawn.
///
/// # Examples
///
/// ```
/// inspect(CssBorderStyle::Solid, content="solid")
/// inspect(CssBorderStyle::Dashed, content="dashed")
/// inspect(CssBorderStyle::Dotted, content="dotted")
/// ```
pub(all) enum CssBorderStyle {
  /// A continuous solid line border
  /// ```mbt
  /// inspect(CssBorderStyle::Solid, content="solid")
  /// ```
  Solid
  /// A border made of dashes
  /// ```mbt
  /// inspect(CssBorderStyle::Dashed, content="dashed")
  /// ```
  Dashed
  /// A border made of dots
  /// ```mbt
  /// inspect(CssBorderStyle::Dotted, content="dotted")
  /// ```
  Dotted
} derive(Eq)

///|
pub impl Show for CssBorderStyle with output(self, logger) {
  let ret = match self {
    Solid => "solid"
    Dashed => "dashed"
    Dotted => "dotted"
  }
  logger.write_string(ret)
}

///|
/// Represents a CSS border with width, style, and color properties.
///
/// The CssBorder struct encapsulates the three essential components of a CSS border:
/// width (in pixels), style (solid, dashed, etc.), and color. This provides a
/// convenient way to define consistent border styling across elements.
///
/// # Examples
///
/// Basic border creation:
/// `CssBorder(2.0, CssBorderStyle::Solid, CssColor::Black)`
///
/// Using the constructor with defaults:
/// `CssBorder::new()` // 1px solid black border
///
/// Custom border with specific properties:
/// `CssBorder::new(width=3.0, style=CssBorderStyle::Dashed, color=CssColor::Hex(255, 0, 0))`
///
/// # Structure
///
/// - `Float` - Border width in pixels
/// - `CssBorderStyle` - Border style (solid, dashed, dotted, etc.)
/// - `CssColor` - Border color in any supported color format
pub(all) struct CssBorder(Float, CssBorderStyle, CssColor)

///|
pub impl Show for CssBorder with output(self, logger) {
  let CssBorder(width, style, color) = self
  let ret = str_spaced([width |> CssSize::Px, style, color])
  logger.write_string(ret)
}

///|
pub fn CssBorder::new(
  width? : Float = 1.0,
  style? : CssBorderStyle = Solid,
  color? : CssColor = Black,
) -> CssBorder {
  CssBorder(width, style, color)
}

///|
/// Represents CSS background-size property values that control how background images are sized.
///
/// The background-size property specifies the size of background images,
/// determining how they scale and fit within their container.
///
/// # Examples
///
/// ```
/// inspect(CssBackgroundSize::Cover, content="cover")
/// inspect(CssBackgroundSize::Contain, content="contain")
/// inspect(CssBackgroundSize::Wh(100, 200), content="100px 200px")
/// ```
pub(all) enum CssBackgroundSize {
  /// Scale image to cover entire container, may crop parts
  /// ```mbt
  /// inspect(CssBackgroundSize::Cover, content="cover")
  /// ```
  Cover
  /// Scale image to fit entirely within container, may leave empty space
  /// ```mbt
  /// inspect(CssBackgroundSize::Contain, content="contain")
  /// ```
  Contain
  /// Set explicit width and height in pixels
  /// ```mbt
  /// inspect(CssBackgroundSize::Wh(100, 200), content="100px 200px")
  /// ```
  Wh(UInt, UInt)
} derive(Eq)

///|
pub impl Show for CssBackgroundSize with output(self, logger) {
  let ret = match self {
    Cover => "cover"
    Contain => "contain"
    Wh(w, h) => w.to_string() + "px " + h.to_string() + "px"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS overflow property values that control how content is handled when it overflows its container.
///
/// The overflow property specifies what happens when content is too large to fit in its container.
/// It can be used to add scrollbars or hide overflowing content.
///
/// # Examples
///
/// ```
/// inspect(CssOverflow::Visible, content="visible")
/// inspect(CssOverflow::Hidden, content="hidden")
/// inspect(CssOverflow::Scroll, content="scroll")
/// inspect(CssOverflow::Auto, content="auto")
/// ```
pub(all) enum CssOverflow {
  /// Content is not clipped and may overflow the container
  /// ```mbt
  /// inspect(CssOverflow::Visible, content="visible")
  /// ```
  Visible
  /// Content is clipped and hidden when it overflows
  /// ```mbt
  /// inspect(CssOverflow::Hidden, content="hidden")
  /// ```
  Hidden
  /// Content is clipped and scrollbars are always shown
  /// ```mbt
  /// inspect(CssOverflow::Scroll, content="scroll")
  /// ```
  Scroll
  /// Content is clipped and scrollbars appear only when needed
  /// ```mbt
  /// inspect(CssOverflow::Auto, content="auto")
  /// ```
  Auto
} derive(Eq)

///|
pub impl Show for CssOverflow with output(self, logger) {
  let ret = match self {
    Visible => "visible"
    Hidden => "hidden"
    Scroll => "scroll"
    Auto => "auto"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS transform property values that apply 2D and 3D transformations to elements.
///
/// The transform property allows you to rotate, scale, skew, or translate elements,
/// providing powerful visual effects and animations.
///
/// # Examples
///
/// ```
/// inspect(CssTransform::Translate(10, 20), content="translate(10px, 20px)")
/// inspect(CssTransform::Scale(1.5), content="scale(1.5)")
/// inspect(CssTransform::Rotate(45), content="rotate(45deg)")
/// ```
pub(all) enum CssTransform {
  /// Move element by x and y pixels
  /// ```mbt
  /// inspect(CssTransform::Translate(10, 20), content="translate(10px, 20px)")
  /// ```
  Translate(Int, Int)
  /// Move element horizontally by x pixels
  /// ```mbt
  /// inspect(CssTransform::TranslateX(10), content="translateX(10px)")
  /// ```
  TranslateX(Int)
  /// Move element vertically by y pixels
  /// ```mbt
  /// inspect(CssTransform::TranslateY(20), content="translateY(20px)")
  /// ```
  TranslateY(Int)
  /// Scale element by the given factor
  /// ```mbt
  /// inspect(CssTransform::Scale(1.5), content="scale(1.5)")
  /// ```
  Scale(Float)
  /// Rotate element by degrees
  /// ```mbt
  /// inspect(CssTransform::Rotate(45), content="rotate(45deg)")
  /// ```
  Rotate(Int)
  /// Skew element by x and y degrees
  /// ```mbt
  /// inspect(CssTransform::Skew(10, 20), content="skew(10deg, 20deg)")
  /// ```
  Skew(Int, Int)
  /// Apply a 2D transformation matrix
  /// ```mbt
  /// inspect(CssTransform::Matrix(1.0, 0.0, 0.0, 1.0, 0.0, 0.0), content="matrix(1, 0, 0, 1, 0, 0)")
  /// ```
  Matrix(Float, Float, Float, Float, Float, Float)
} derive(Eq)

///|
pub impl Show for CssTransform with output(self, logger) {
  let ret = match self {
    Translate(x, y) => "translate(\{x}px, \{y}px)"
    TranslateX(x) => "translateX(\{x}px)"
    TranslateY(y) => "translateY(\{y}px)"
    Scale(value) => "scale(\{value})"
    Rotate(deg) => "rotate(\{deg}deg)"
    Skew(x, y) => "skew(\{x}deg, \{y}deg)"
    Matrix(a, b, c, d, e, f) => "matrix(\{a}, \{b}, \{c}, \{d}, \{e}, \{f})"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS timing function values that control the acceleration curve of animations and transitions.
///
/// Timing functions define how intermediate values are calculated during animations,
/// affecting the pacing and feel of visual transitions.
///
/// # Examples
///
/// ```
/// inspect(CssTimingFunction::Ease, content="ease")
/// inspect(CssTimingFunction::Linear, content="linear")
/// inspect(CssTimingFunction::EaseInOut, content="ease-in-out")
/// ```
pub(all) enum CssTimingFunction {
  /// Default timing function with slow start and end
  /// ```mbt
  /// inspect(CssTimingFunction::Ease, content="ease")
  /// ```
  Ease
  /// Constant speed throughout the animation
  /// ```mbt
  /// inspect(CssTimingFunction::Linear, content="linear")
  /// ```
  Linear
  /// Slow start, then accelerates
  /// ```mbt
  /// inspect(CssTimingFunction::EaseIn, content="ease-in")
  /// ```
  EaseIn
  /// Fast start, then decelerates
  /// ```mbt
  /// inspect(CssTimingFunction::EaseOut, content="ease-out")
  /// ```
  EaseOut
  /// Slow start and end, fast in the middle
  /// ```mbt
  /// inspect(CssTimingFunction::EaseInOut, content="ease-in-out")
  /// ```
  EaseInOut
  /// Jump to the start value immediately
  /// ```mbt
  /// inspect(CssTimingFunction::StepStart, content="step-start")
  /// ```
  StepStart
  /// Hold the start value until the end, then jump to end value
  /// ```mbt
  /// inspect(CssTimingFunction::StepEnd, content="step-end")
  /// ```
  StepEnd
} derive(Eq)

///|
pub impl Show for CssTimingFunction with output(self, logger) {
  let ret = match self {
    Ease => "ease"
    Linear => "linear"
    EaseIn => "ease-in"
    EaseOut => "ease-out"
    EaseInOut => "ease-in-out"
    StepStart => "step-start"
    StepEnd => "step-end"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS text-overflow property values that control how overflowing text is displayed.
///
/// The text-overflow property specifies how overflowed content that is not displayed
/// should be signaled to the user, typically used with white-space: nowrap and overflow: hidden.
///
/// # Examples
///
/// ```
/// inspect(CssTextOverflow::Clip, content="clip")
/// inspect(CssTextOverflow::Ellipsis, content="ellipsis")
/// ```
pub(all) enum CssTextOverflow {
  /// Text is clipped at the content area's limit
  /// ```mbt
  /// inspect(CssTextOverflow::Clip, content="clip")
  /// ```
  Clip
  /// Text is clipped and an ellipsis (...) is displayed
  /// ```mbt
  /// inspect(CssTextOverflow::Ellipsis, content="ellipsis")
  /// ```
  Ellipsis
} derive(Eq)

///|
pub impl Show for CssTextOverflow with output(self, logger) {
  let ret = match self {
    Clip => "clip"
    Ellipsis => "ellipsis"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS box-sizing property values that control how element dimensions are calculated.
///
/// The box-sizing property defines how the total width and height of an element is calculated,
/// determining whether padding and border are included in the element's dimensions.
///
/// # Examples
///
/// ```
/// inspect(CssBoxSizing::BorderBox, content="border-box")
/// inspect(CssBoxSizing::ContentBox, content="content-box")
/// ```
pub(all) enum CssBoxSizing {
  /// Width and height include content, padding, and border
  /// ```mbt
  /// inspect(CssBoxSizing::BorderBox, content="border-box")
  /// ```
  BorderBox
  /// Width and height include only content (default)
  /// ```mbt
  /// inspect(CssBoxSizing::ContentBox, content="content-box")
  /// ```
  ContentBox
} derive(Eq)

///|
pub impl Show for CssBoxSizing with output(self, logger) {
  let ret = match self {
    BorderBox => "border-box"
    ContentBox => "content-box"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS text-align property values that control horizontal text alignment.
///
/// The text-align property specifies the horizontal alignment of text within its container.
/// It affects how text content is positioned within block-level elements.
///
/// # Examples
///
/// ```
/// inspect(CssTextAlign::Left, content="left")
/// inspect(CssTextAlign::Right, content="right")
/// inspect(CssTextAlign::Center, content="center")
/// inspect(CssTextAlign::Justify, content="justify")
/// ```
pub(all) enum CssTextAlign {
  /// Aligns text to the left edge of the container
  /// ```mbt
  /// inspect(CssTextAlign::Left, content="left")
  /// ```
  Left
  /// Aligns text to the right edge of the container
  /// ```mbt
  /// inspect(CssTextAlign::Right, content="right")
  /// ```
  Right
  /// Centers text within the container
  /// ```mbt
  /// inspect(CssTextAlign::Center, content="center")
  /// ```
  Center
  /// Justifies text by adjusting spacing to align with both edges
  /// ```mbt
  /// inspect(CssTextAlign::Justify, content="justify")
  /// ```
  Justify
} derive(Eq)

///|
pub impl Show for CssTextAlign with output(self, logger) {
  let ret = match self {
    Left => "left"
    Right => "right"
    Center => "center"
    Justify => "justify"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS font-weight property values that control the thickness of font characters.
///
/// The font-weight property specifies how thick or thin characters should be displayed.
/// It supports both keyword values and numeric weights from 100 to 900.
///
/// # Examples
///
/// ```
/// inspect(CssFontWeight::Normal, content="normal")
/// inspect(CssFontWeight::Bold, content="bold")
/// inspect(CssFontWeight::Weight(600), content="600")
/// ```
pub(all) enum CssFontWeight {
  /// Normal font weight (equivalent to 400)
  /// ```mbt
  /// inspect(CssFontWeight::Normal, content="normal")
  /// ```
  Normal
  /// Bold font weight (equivalent to 700)
  /// ```mbt
  /// inspect(CssFontWeight::Bold, content="bold")
  /// ```
  Bold
  /// Bolder than the parent element's font weight
  /// ```mbt
  /// inspect(CssFontWeight::Bolder, content="bolder")
  /// ```
  Bolder
  /// Lighter than the parent element's font weight
  /// ```mbt
  /// inspect(CssFontWeight::Lighter, content="lighter")
  /// ```
  Lighter
  /// Specific numeric weight (100-900)
  /// ```mbt
  /// inspect(CssFontWeight::Weight(600), content="600")
  /// ```
  Weight(Int)
} derive(Eq)

///|
pub impl Show for CssFontWeight with output(self, logger) {
  let ret = match self {
    Normal => "normal"
    Bold => "bold"
    Bolder => "bolder"
    Lighter => "lighter"
    Weight(value) => value.to_string()
  }
  logger.write_string(ret)
}

///|
/// Represents CSS text-decoration property values that control text decoration lines.
///
/// The text-decoration property specifies the decoration added to text,
/// such as underlines, overlines, or line-through effects.
///
/// # Examples
///
/// ```
/// inspect(CssTextDecoration::None, content="none")
/// inspect(CssTextDecoration::Underline, content="underline")
/// inspect(CssTextDecoration::Overline, content="overline")
/// inspect(CssTextDecoration::LineThrough, content="line-through")
/// ```
pub(all) enum CssTextDecoration {
  /// No text decoration
  /// ```mbt
  /// inspect(CssTextDecoration::None, content="none")
  /// ```
  None
  /// Underline decoration below the text
  /// ```mbt
  /// inspect(CssTextDecoration::Underline, content="underline")
  /// ```
  Underline
  /// Overline decoration above the text
  /// ```mbt
  /// inspect(CssTextDecoration::Overline, content="overline")
  /// ```
  Overline
  /// Line-through decoration crossing the text
  /// ```mbt
  /// inspect(CssTextDecoration::LineThrough, content="line-through")
  /// ```
  LineThrough
} derive(Eq)

///|
pub impl Show for CssTextDecoration with output(self, logger) {
  let ret = match self {
    None => "none"
    Underline => "underline"
    Overline => "overline"
    LineThrough => "line-through"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS cursor property values that control the mouse cursor appearance.
///
/// The cursor property specifies the type of cursor to be displayed when pointing over an element.
/// It provides visual feedback to users about the type of interaction available.
///
/// # Examples
///
/// ```
/// inspect(CssCursor::Auto, content="auto")
/// inspect(CssCursor::Pointer, content="pointer")
/// inspect(CssCursor::Text, content="text")
/// inspect(CssCursor::Move, content="move")
/// ```
pub(all) enum CssCursor {
  /// 🖱️ Browser determines cursor automatically
  /// ```mbt
  /// inspect(CssCursor::Auto, content="auto")
  /// ```
  Auto
  /// → Default cursor (usually an arrow)
  /// ```mbt
  /// inspect(CssCursor::Default, content="default")
  /// ```
  Default
  /// ⊘ No cursor is rendered
  /// ```mbt
  /// inspect(CssCursor::None, content="none")
  /// ```
  None
  /// ☞ Hand cursor indicating a clickable element
  /// ```mbt
  /// inspect(CssCursor::Pointer, content="pointer")
  /// ```
  Pointer
  /// ☰ Context menu cursor
  /// ```mbt
  /// inspect(CssCursor::ContextMenu, content="context-menu")
  /// ```
  ContextMenu
  /// ❓ Help cursor indicating help is available
  /// ```mbt
  /// inspect(CssCursor::Help, content="help")
  /// ```
  Help
  /// ⧗ Progress cursor indicating background activity
  /// ```mbt
  /// inspect(CssCursor::Progress, content="progress")
  /// ```
  Progress
  /// ⧗ Wait cursor indicating the program is busy
  /// ```mbt
  /// inspect(CssCursor::Wait, content="wait")
  /// ```
  Wait
  /// ⊞ Cell cursor for table cell selection
  /// ```mbt
  /// inspect(CssCursor::Cell, content="cell")
  /// ```
  Cell
  /// ⌖ Crosshair cursor for precise selection
  /// ```mbt
  /// inspect(CssCursor::Crosshair, content="crosshair")
  /// ```
  Crosshair
  /// 𝐈 Text cursor for text selection
  /// ```mbt
  /// inspect(CssCursor::Text, content="text")
  /// ```
  Text
  /// 𝐈 Vertical text cursor
  /// ```mbt
  /// inspect(CssCursor::VerticalText, content="vertical-text")
  /// ```
  VerticalText
  /// ⤴ Alias cursor indicating a shortcut will be created
  /// ```mbt
  /// inspect(CssCursor::Alias, content="alias")
  /// ```
  Alias
  /// ⧉ Copy cursor indicating something will be copied
  /// ```mbt
  /// inspect(CssCursor::Copy, content="copy")
  /// ```
  Copy
  /// ✥ Move cursor for draggable elements
  /// ```mbt
  /// inspect(CssCursor::Move, content="move")
  /// ```
  Move
  /// ⊘ No-drop cursor indicating drop is not allowed
  /// ```mbt
  /// inspect(CssCursor::NoDrop, content="no-drop")
  /// ```
  NoDrop
  /// ✘ Not-allowed cursor indicating action is forbidden
  /// ```mbt
  /// inspect(CssCursor::NotAllowed, content="not-allowed")
  /// ```
  NotAllowed
  /// ✋ Grab cursor for grabbable elements
  /// ```mbt
  /// inspect(CssCursor::Grab, content="grab")
  /// ```
  Grab
  /// ✊ Grabbing cursor for elements being dragged
  /// ```mbt
  /// inspect(CssCursor::Grabbing, content="grabbing")
  /// ```
  Grabbing
  /// ⊕ All-scroll cursor for scrollable content
  /// ```mbt
  /// inspect(CssCursor::AllScroll, content="all-scroll")
  /// ```
  AllScroll
  /// ↔ Column resize cursor
  /// ```mbt
  /// inspect(CssCursor::ColResize, content="col-resize")
  /// ```
  ColResize
  /// ↕ Row resize cursor
  /// ```mbt
  /// inspect(CssCursor::RowResize, content="row-resize")
  /// ```
  RowResize
  /// ↑ North resize cursor
  /// ```mbt
  /// inspect(CssCursor::NResize, content="n-resize")
  /// ```
  NResize
  /// → East resize cursor
  /// ```mbt
  /// inspect(CssCursor::EResize, content="e-resize")
  /// ```
  EResize
  /// ↓ South resize cursor
  /// ```mbt
  /// inspect(CssCursor::SResize, content="s-resize")
  /// ```
  SResize
  /// ← West resize cursor
  /// ```mbt
  /// inspect(CssCursor::WResize, content="w-resize")
  /// ```
  WResize
  /// ↗ Northeast resize cursor
  /// ```mbt
  /// inspect(CssCursor::NeResize, content="ne-resize")
  /// ```
  NeResize
  /// ↖ Northwest resize cursor
  /// ```mbt
  /// inspect(CssCursor::NwResize, content="nw-resize")
  /// ```
  NwResize
  /// ↘ Southeast resize cursor
  /// ```mbt
  /// inspect(CssCursor::SeResize, content="se-resize")
  /// ```
  SeResize
  /// ↙ Southwest resize cursor
  /// ```mbt
  /// inspect(CssCursor::SwResize, content="sw-resize")
  /// ```
  SwResize
  /// ↔ East-west resize cursor
  /// ```mbt
  /// inspect(CssCursor::EwResize, content="ew-resize")
  /// ```
  EwResize
  /// ↕ North-south resize cursor
  /// ```mbt
  /// inspect(CssCursor::NsResize, content="ns-resize")
  /// ```
  NsResize
  /// ↗↙ Northeast-southwest resize cursor
  /// ```mbt
  /// inspect(CssCursor::NeswResize, content="nesw-resize")
  /// ```
  NeswResize
  /// ↖↘ Northwest-southeast resize cursor
  /// ```mbt
  /// inspect(CssCursor::NwseResize, content="nwse-resize")
  /// ```
  NwseResize
  /// 🔍 Zoom in cursor
  /// ```mbt
  /// inspect(CssCursor::ZoomIn, content="zoom-in")
  /// ```
  ZoomIn
  /// 🔍 Zoom out cursor
  /// ```mbt
  /// inspect(CssCursor::ZoomOut, content="zoom-out")
  /// ```
  ZoomOut
} derive(Eq)

///|
pub impl Show for CssCursor with output(self, logger) {
  let ret = match self {
    Auto => "auto"
    Default => "default"
    None => "none"
    Pointer => "pointer"
    ContextMenu => "context-menu"
    Help => "help"
    Progress => "progress"
    Wait => "wait"
    Cell => "cell"
    Crosshair => "crosshair"
    Text => "text"
    VerticalText => "vertical-text"
    Alias => "alias"
    Copy => "copy"
    Move => "move"
    NoDrop => "no-drop"
    NotAllowed => "not-allowed"
    Grab => "grab"
    Grabbing => "grabbing"
    AllScroll => "all-scroll"
    ColResize => "col-resize"
    RowResize => "row-resize"
    NResize => "n-resize"
    EResize => "e-resize"
    SResize => "s-resize"
    WResize => "w-resize"
    NeResize => "ne-resize"
    NwResize => "nw-resize"
    SeResize => "se-resize"
    SwResize => "sw-resize"
    EwResize => "ew-resize"
    NsResize => "ns-resize"
    NeswResize => "nesw-resize"
    NwseResize => "nwse-resize"
    ZoomIn => "zoom-in"
    ZoomOut => "zoom-out"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS content-visibility property values that control rendering optimization.
///
/// The content-visibility property allows the user agent to skip an element's rendering work
/// until it is needed, which can significantly improve page load performance.
///
/// # Examples
///
/// ```
/// inspect(CssContentVisibility::Visible, content="visible")
/// inspect(CssContentVisibility::Hidden, content="hidden")
/// inspect(CssContentVisibility::Auto, content="auto")
/// ```
pub(all) enum CssContentVisibility {
  /// Element's contents are rendered normally
  /// ```mbt
  /// inspect(CssContentVisibility::Visible, content="visible")
  /// ```
  Visible
  /// Element's contents are skipped and not rendered
  /// ```mbt
  /// inspect(CssContentVisibility::Hidden, content="hidden")
  /// ```
  Hidden
  /// Browser determines when to render based on visibility
  /// ```mbt
  /// inspect(CssContentVisibility::Auto, content="auto")
  /// ```
  Auto
} derive(Eq)

///|
pub impl Show for CssContentVisibility with output(self, logger) {
  let ret = match self {
    Visible => "visible"
    Hidden => "hidden"
    Auto => "auto"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS filter property values that apply graphical effects to elements.
///
/// The filter property applies graphical effects like blur or color shift to an element.
/// Filters are commonly used to adjust the rendering of images, backgrounds, and borders.
///
/// # Examples
///
/// ```
/// inspect(CssFilter::None, content="none")
/// inspect(CssFilter::Blur(5.0), content="blur(5px)")
/// inspect(CssFilter::Brightness(1.2), content="brightness(1.2000000476837158)")
/// inspect(CssFilter::DropShadow(2.0, 2.0, 4.0, CssColor::Black), content="drop-shadow(2px 2px 4px black)")
/// ```
///
/// Reference: https://developer.mozilla.org/en-US/docs/Web/CSS/filter
pub(all) enum CssFilter {
  /// No filter effects applied
  /// ```mbt
  /// inspect(CssFilter::None, content="none")
  /// ```
  None
  /// Applies a blur effect with specified radius in pixels
  /// ```mbt
  /// inspect(CssFilter::Blur(5.0), content="blur(5px)")
  /// ```
  Blur(Float)
  /// Adjusts brightness (1.0 = normal, >1.0 = brighter, <1.0 = darker)
  /// ```mbt
  /// inspect(CssFilter::Brightness(1.2), content="brightness(1.2000000476837158)")
  /// ```
  Brightness(Float)
  /// Adjusts contrast (1.0 = normal, >1.0 = more contrast, <1.0 = less contrast)
  /// ```mbt
  /// inspect(CssFilter::Contrast(1.5), content="contrast(1.5)")
  /// ```
  Contrast(Float)
  /// Converts to grayscale (0.0 = no change, 1.0 = completely grayscale)
  /// ```mbt
  /// inspect(CssFilter::Grayscale(0.5), content="grayscale(0.5)")
  /// ```
  Grayscale(Float)
  /// Rotates hue by specified degrees
  /// ```mbt
  /// inspect(CssFilter::HueRotate(90.0), content="hue-rotate(90deg)")
  /// ```
  HueRotate(Float)
  /// Inverts colors (0.0 = no change, 1.0 = completely inverted)
  /// ```mbt
  /// inspect(CssFilter::Invert(1.0), content="invert(1)")
  /// ```
  Invert(Float)
  /// Adjusts opacity (0.0 = transparent, 1.0 = opaque)
  /// ```mbt
  /// inspect(CssFilter::Opacity(0.8), content="opacity(0.800000011920929)")
  /// ```
  Opacity(Float)
  /// Adjusts saturation (0.0 = grayscale, 1.0 = normal, >1.0 = more saturated)
  /// ```mbt
  /// inspect(CssFilter::Saturate(2.0), content="saturate(2)")
  /// ```
  Saturate(Float)
  /// Converts to sepia tone (0.0 = no change, 1.0 = completely sepia)
  /// ```mbt
  /// inspect(CssFilter::Sepia(0.7), content="sepia(0.699999988079071)")
  /// ```
  Sepia(Float)
  /// Applies a drop shadow with x-offset, y-offset, blur radius, and color
  /// ```mbt
  /// inspect(CssFilter::DropShadow(2.0, 2.0, 4.0, CssColor::Black), content="drop-shadow(2px 2px 4px black)")
  /// ```
  DropShadow(Float, Float, Float, CssColor)
  /// References an SVG filter by URL
  /// ```mbt
  /// inspect(CssFilter::Url("#my-filter"), content="url(#my-filter)")
  /// ```
  Url(String)
  /// Reverts to the value established by the user-agent stylesheet
  /// ```mbt
  /// inspect(CssFilter::Revert, content="revert")
  /// ```
  Revert
  /// Reverts to the value established by a previous cascade layer
  /// ```mbt
  /// inspect(CssFilter::RevertLayer, content="revert-layer")
  /// ```
  RevertLayer
}

///|
pub impl Show for CssFilter with output(self, logger) {
  let ret = match self {
    None => "none"
    Blur(value) => "blur(" + value.to_string() + "px)"
    Brightness(value) => "brightness(" + value.to_string() + ")"
    Contrast(value) => "contrast(" + value.to_string() + ")"
    Grayscale(value) => "grayscale(" + value.to_string() + ")"
    HueRotate(value) => "hue-rotate(" + value.to_string() + "deg)"
    Invert(value) => "invert(" + value.to_string() + ")"
    Opacity(value) => "opacity(" + value.to_string() + ")"
    Saturate(value) => "saturate(" + value.to_string() + ")"
    Sepia(value) => "sepia(" + value.to_string() + ")"
    DropShadow(x, y, blur, color) => {
      let x_str = x.to_string()
      let y_str = y.to_string()
      let blur_str = blur.to_string()
      let color_str = color.to_string()
      "drop-shadow(" +
      x_str +
      "px " +
      y_str +
      "px " +
      blur_str +
      "px " +
      color_str +
      ")"
    }
    Url(value) => "url(" + value + ")"
    Revert => "revert"
    RevertLayer => "revert-layer"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS object-fit property values that control how replaced elements are resized.
///
/// The object-fit property sets how the content of a replaced element, such as an img or video,
/// should be resized to fit its container.
///
/// # Examples
///
/// ```
/// inspect(CssObjectFit::Fill, content="fill")
/// inspect(CssObjectFit::Contain, content="contain")
/// inspect(CssObjectFit::Cover, content="cover")
/// inspect(CssObjectFit::ScaleDown, content="scale-down")
/// ```
pub(all) enum CssObjectFit {
  /// Content is resized to fill the element's content box, may be stretched
  /// ```mbt
  /// inspect(CssObjectFit::Fill, content="fill")
  /// ```
  Fill
  /// Content is scaled to maintain aspect ratio while fitting within the content box
  /// ```mbt
  /// inspect(CssObjectFit::Contain, content="contain")
  /// ```
  Contain
  /// Content is scaled to maintain aspect ratio while filling the content box
  /// ```mbt
  /// inspect(CssObjectFit::Cover, content="cover")
  /// ```
  Cover
  /// Content is not resized
  /// ```mbt
  /// inspect(CssObjectFit::None, content="none")
  /// ```
  None
  /// Content is sized as if none or contain were specified, whichever results in smaller size
  /// ```mbt
  /// inspect(CssObjectFit::ScaleDown, content="scale-down")
  /// ```
  ScaleDown
} derive(Eq)

///|
pub impl Show for CssObjectFit with output(self, logger) {
  let ret = match self {
    Fill => "fill"
    Contain => "contain"
    Cover => "cover"
    None => "none"
    ScaleDown => "scale-down"
  }
  logger.write_string(ret)
}

///|
/// Represents CSS overscroll-behavior property values that control scroll chaining behavior.
///
/// The overscroll-behavior property sets what a browser does when reaching the boundary
/// of a scrolling area. It can be used to prevent unwanted scroll chaining.
///
/// # Examples
///
/// ```
/// inspect(CssOverscrollBehavior::Auto, content="auto")
/// inspect(CssOverscrollBehavior::Contain, content="contain")
/// inspect(CssOverscrollBehavior::None, content="none")
/// ```
pub(all) enum CssOverscrollBehavior {
  /// Default scroll chaining behavior
  /// ```mbt
  /// inspect(CssOverscrollBehavior::Auto, content="auto")
  /// ```
  Auto
  /// Prevents scroll chaining to neighboring scrolling areas
  /// ```mbt
  /// inspect(CssOverscrollBehavior::Contain, content="contain")
  /// ```
  Contain
  /// Prevents scroll chaining and default overscroll effects
  /// ```mbt
  /// inspect(CssOverscrollBehavior::None, content="none")
  /// ```
  None
}

///|
pub impl Show for CssOverscrollBehavior with output(self, logger) {
  let ret = match self {
    Auto => "auto"
    Contain => "contain"
    None => "none"
  }
  logger.write_string(ret)
}

///|
/// convert a list of strings to a single string with spaces between them,
/// mainly used for concatenating class names
pub fn str_spaced(wrap_parens? : Bool = false, s : Array[&Show]) -> String {
  let mut ret = ""
  for idx, piece in s.iter2() {
    if idx > 0 {
      ret = ret + " "
    }
    ret = ret + piece.to_string()
  }
  if wrap_parens {
    ret = "(" + ret + ")"
  }
  ret
}

///|
/// CSS Grid Layout Properties
/// Represents CSS grid-template-columns property values for defining grid column tracks.
///
/// The grid-template-columns property defines the line names and track sizing functions
/// of the grid columns, establishing the structure of the grid container's column axis.
///
/// # Examples
///
/// Basic usage with inspect:
/// `CssGridTemplateColumns::None |> inspect` // Output: "none"
/// `CssGridTemplateColumns::Auto |> inspect` // Output: "auto"
/// `CssGridTemplateColumns::Repeat(3, CssSize::Px(100.0)) |> inspect` // Output: "repeat(3, 100px)"
/// `CssGridTemplateColumns::Fr([1.0, 2.0, 1.0]) |> inspect` // Output: "1fr 2fr 1fr"
pub(all) enum CssGridTemplateColumns {
  /// No explicit column tracks (auto-generated as needed)
  /// Example: `CssGridTemplateColumns::None |> inspect` // Output: "none"
  None
  /// Columns size automatically based on content
  /// Example: `CssGridTemplateColumns::Auto |> inspect` // Output: "auto"
  Auto
  /// Repeats a track pattern the specified number of times
  /// Example: `CssGridTemplateColumns::Repeat(4, CssSize::Px(200.0)) |> inspect` // Output: "repeat(4, 200px)"
  Repeat(Int, CssSize)
  /// Fractional units that distribute available space proportionally
  /// Example: `CssGridTemplateColumns::Fr([1.0, 3.0, 1.0]) |> inspect` // Output: "1fr 3fr 1fr"
  Fr(Array[Float])
  /// Explicit list of column sizes with mixed units
  /// Example: `CssGridTemplateColumns::Sizes([CssSize::Px(100.0), CssSize::Fr(1.0), CssSize::Px(150.0)]) |> inspect` // Output: "100px 1fr 150px"
  Sizes(Array[CssSize])
  /// Raw CSS value for advanced grid patterns
  /// Example: `CssGridTemplateColumns::Custom("minmax(100px, 1fr) auto minmax(100px, 1fr)") |> inspect` // Output: "minmax(100px, 1fr) auto minmax(100px, 1fr)"
  Custom(String)
} derive(Eq)

///|
pub impl Show for CssGridTemplateColumns with output(self, logger) {
  let ret = match self {
    None => "none"
    Auto => "auto"
    Repeat(count, size) => {
      let count_str = count.to_string()
      let size_str = size.to_string()
      "repeat(" + count_str + ", " + size_str + ")"
    }
    Fr(values) => values.map(fn(v) { v.to_string() + "fr" }).join(" ")
    Sizes(sizes) => sizes.map(fn(s) { s.to_string() }).join(" ")
    Custom(value) => value
  }
  logger.write_string(ret)
}

///|
/// Represents CSS grid-template-rows property values that define the sizing of grid rows.
///
/// The grid-template-rows property defines the line names and track sizing functions
/// of the grid rows, controlling how rows are sized in a CSS Grid layout.
///
/// # Examples
///
/// ```
/// inspect(CssGridTemplateRows::Auto, content="auto")
/// inspect(CssGridTemplateRows::Repeat(3, CssSize::Px(100)), content="repeat(3, 100px)")
/// inspect(CssGridTemplateRows::Fr([1.0, 2.0]), content="1fr 2fr")
/// ```
pub(all) enum CssGridTemplateRows {
  /// No explicit grid rows defined
  /// ```mbt
  /// inspect(CssGridTemplateRows::None, content="none")
  /// ```
  None
  /// Rows size automatically based on content
  /// ```mbt
  /// inspect(CssGridTemplateRows::Auto, content="auto")
  /// ```
  Auto
  /// Repeat a size pattern for the specified number of times
  /// ```mbt
  /// inspect(CssGridTemplateRows::Repeat(3, CssSize::Px(100)), content="repeat(3, 100px)")
  /// ```
  Repeat(Int, CssSize)
  /// Define rows using fractional units
  /// ```mbt
  /// inspect(CssGridTemplateRows::Fr([1.0, 2.0]), content="1fr 2fr")
  /// ```
  Fr(Array[Float])
  /// Define rows using explicit sizes
  /// ```mbt
  /// inspect(CssGridTemplateRows::Sizes([CssSize::Px(100), CssSize::Auto]), content="100px auto")
  /// ```
  Sizes(Array[CssSize])
  /// Custom grid template rows value
  /// ```mbt
  /// inspect(CssGridTemplateRows::Custom("minmax(100px, 1fr)"), content="minmax(100px, 1fr)")
  /// ```
  Custom(String)
} derive(Eq)

///|
pub impl Show for CssGridTemplateRows with output(self, logger) {
  let ret = match self {
    None => "none"
    Auto => "auto"
    Repeat(count, size) => {
      let count_str = count.to_string()
      let size_str = size.to_string()
      "repeat(" + count_str + ", " + size_str + ")"
    }
    Fr(values) => values.map(fn(v) { v.to_string() + "fr" }).join(" ")
    Sizes(sizes) => sizes.map(fn(s) { s.to_string() }).join(" ")
    Custom(value) => value
  }
  logger.write_string(ret)
}

///|
/// Represents CSS grid-area property values that define how a grid item is positioned within the grid.
///
/// The grid-area property is a shorthand for grid-row-start, grid-column-start,
/// grid-row-end, and grid-column-end, specifying a grid item's size and location.
///
/// # Examples
///
/// ```
/// inspect(CssGridArea::Auto, content="auto")
/// inspect(CssGridArea::Span(2), content="span 2")
/// inspect(CssGridArea::Named("header"), content="header")
/// ```
pub(all) enum CssGridArea {
  /// Automatic placement by the grid algorithm
  /// ```mbt
  /// inspect(CssGridArea::Auto, content="auto")
  /// ```
  Auto
  /// Span across the specified number of grid tracks
  /// ```mbt
  /// inspect(CssGridArea::Span(2), content="span 2")
  /// ```
  Span(Int)
  /// Start at the specified grid line number
  /// ```mbt
  /// inspect(CssGridArea::Line(3), content="3")
  /// ```
  Line(Int)
  /// Use a named grid area
  /// ```mbt
  /// inspect(CssGridArea::Named("header"), content="header")
  /// ```
  Named(String)
  /// Custom grid area value
  /// ```mbt
  /// inspect(CssGridArea::Custom("1 / 2 / 3 / 4"), content="1 / 2 / 3 / 4")
  /// ```
  Custom(String)
} derive(Eq)

///|
pub impl Show for CssGridArea with output(self, logger) {
  let ret = match self {
    Auto => "auto"
    Span(count) => "span " + count.to_string()
    Line(line) => line.to_string()
    Named(name) => name
    Custom(value) => value
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssJustifyItems {
  Start
  End
  Center
  Stretch
  Baseline
} derive(Eq)

///|
pub impl Show for CssJustifyItems with output(self, logger) {
  let ret = match self {
    Start => "start"
    End => "end"
    Center => "center"
    Stretch => "stretch"
    Baseline => "baseline"
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssAlignItems {
  Start
  End
  Center
  Stretch
  Baseline
} derive(Eq)

///|
pub impl Show for CssAlignItems with output(self, logger) {
  let ret = match self {
    Start => "start"
    End => "end"
    Center => "center"
    Stretch => "stretch"
    Baseline => "baseline"
  }
  logger.write_string(ret)
}

///|
/// CSS Animation Properties
/// Represents CSS animation-direction property values that control animation playback direction.
///
/// The animation-direction property specifies whether an animation should play forward,
/// backward, or alternate between forward and backward on each cycle.
///
/// # Examples
///
/// Basic usage with inspect:
/// `CssAnimationDirection::Normal |> inspect` // Output: "normal"
/// `CssAnimationDirection::Reverse |> inspect` // Output: "reverse"
/// `CssAnimationDirection::Alternate |> inspect` // Output: "alternate"
/// `CssAnimationDirection::AlternateReverse |> inspect` // Output: "alternate-reverse"
pub(all) enum CssAnimationDirection {
  /// Animation plays forward on each cycle (default behavior)
  /// Example: `CssAnimationDirection::Normal |> inspect` // Output: "normal"
  Normal
  /// Animation plays backward on each cycle
  /// Example: `CssAnimationDirection::Reverse |> inspect` // Output: "reverse"
  Reverse
  /// Animation alternates between forward and backward on each cycle
  /// Example: `CssAnimationDirection::Alternate |> inspect` // Output: "alternate"
  Alternate
  /// Animation alternates between backward and forward, starting with backward
  /// Example: `CssAnimationDirection::AlternateReverse |> inspect` // Output: "alternate-reverse"
  AlternateReverse
} derive(Eq)

///|
pub impl Show for CssAnimationDirection with output(self, logger) {
  let ret = match self {
    Normal => "normal"
    Reverse => "reverse"
    Alternate => "alternate"
    AlternateReverse => "alternate-reverse"
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssAnimationFillMode {
  None
  Forwards
  Backwards
  Both
} derive(Eq)

///|
pub impl Show for CssAnimationFillMode with output(self, logger) {
  let ret = match self {
    None => "none"
    Forwards => "forwards"
    Backwards => "backwards"
    Both => "both"
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssAnimationPlayState {
  Running
  Paused
} derive(Eq)

///|
pub impl Show for CssAnimationPlayState with output(self, logger) {
  let ret = match self {
    Running => "running"
    Paused => "paused"
  }
  logger.write_string(ret)
}

///|
/// CSS Functions and Advanced Units
/// Represents CSS mathematical and utility functions for dynamic value calculation.
///
/// CSS functions enable dynamic calculations and responsive design by allowing
/// mathematical operations, comparisons, and variable references in CSS values.
///
/// # Examples
///
/// Basic usage with inspect:
/// `CssFunction::Calc("100vw - 40px") |> inspect` // Output: "calc(100vw - 40px)"
/// `CssFunction::Min([CssSize::Px(300.0), CssSize::Vw(80.0)]) |> inspect` // Output: "min(300px, 80vw)"
/// `CssFunction::Var("primary-color", None) |> inspect` // Output: "var(--primary-color)"
pub(all) enum CssFunction {
  /// Mathematical expressions with +, -, *, / operators
  /// Example: `CssFunction::Calc("100vh - 60px") |> inspect` // Output: "calc(100vh - 60px)"
  Calc(String)
  /// Returns the smallest value from the provided list
  /// Example: `CssFunction::Min([CssSize::Px(200.0), CssSize::Vw(50.0)]) |> inspect` // Output: "min(200px, 50vw)"
  Min(Array[CssSize])
  /// Returns the largest value from the provided list
  /// Example: `CssFunction::Max([CssSize::Px(100.0), CssSize::Vh(30.0)]) |> inspect` // Output: "max(100px, 30vh)"
  Max(Array[CssSize])
  /// Constrains value between minimum and maximum bounds
  /// Example: `CssFunction::Clamp(CssSize::Px(12.0), CssSize::Vw(4.0), CssSize::Px(24.0)) |> inspect` // Output: "clamp(12px, 4vw, 24px)"
  Clamp(CssSize, CssSize, CssSize)
  /// References CSS custom properties with optional fallback value
  /// Example: `CssFunction::Var("theme-color", Some(CssSize::Px(16.0))) |> inspect` // Output: "var(--theme-color, 16px)"
  Var(String, CssSize?)
} derive(Eq)

///|
pub impl Show for CssFunction with output(self, logger) {
  let ret = match self {
    Calc(expr) => "calc(" + expr + ")"
    Min(values) => {
      let values_str = values.map(fn(v) { v.to_string() }).join(", ")
      "min(" + values_str + ")"
    }
    Max(values) => {
      let values_str = values.map(fn(v) { v.to_string() }).join(", ")
      "max(" + values_str + ")"
    }
    Clamp(min, preferred, max) => {
      let min_str = min.to_string()
      let preferred_str = preferred.to_string()
      let max_str = max.to_string()
      "clamp(" + min_str + ", " + preferred_str + ", " + max_str + ")"
    }
    Var(name, fallback) =>
      match fallback {
        Some(fb) => {
          let fb_str = fb.to_string()
          "var(--" + name + ", " + fb_str + ")"
        }
        None => "var(--" + name + ")"
      }
  }
  logger.write_string(ret)
}

///|
/// CSS Typography Enhancements
pub(all) enum CssFontStyle {
  Normal
  Italic
  Oblique(Float?)
} derive(Eq)

///|
pub impl Show for CssFontStyle with output(self, logger) {
  let ret = match self {
    Normal => "normal"
    Italic => "italic"
    Oblique(angle) =>
      match angle {
        Some(a) => "oblique \{a}deg"
        None => "oblique"
      }
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssFontVariant {
  Normal
  SmallCaps
  AllSmallCaps
  PetiteCaps
  AllPetiteCaps
  Unicase
  TitlingCaps
} derive(Eq)

///|
pub impl Show for CssFontVariant with output(self, logger) {
  let ret = match self {
    Normal => "normal"
    SmallCaps => "small-caps"
    AllSmallCaps => "all-small-caps"
    PetiteCaps => "petite-caps"
    AllPetiteCaps => "all-petite-caps"
    Unicase => "unicase"
    TitlingCaps => "titling-caps"
  }
  logger.write_string(ret)
}

///|
pub(all) enum CssTextTransform {
  None
  Capitalize
  Uppercase
  Lowercase
  FullWidth
  FullSizeKana
} derive(Eq)

///|
pub impl Show for CssTextTransform with output(self, logger) {
  let ret = match self {
    None => "none"
    Capitalize => "capitalize"
    Uppercase => "uppercase"
    Lowercase => "lowercase"
    FullWidth => "full-width"
    FullSizeKana => "full-size-kana"
  }
  logger.write_string(ret)
}

///|
/// CSS Container Query Properties
pub(all) enum CssContainerType {
  Normal
  Size
  InlineSize
  BlockSize
} derive(Eq)

///|
pub impl Show for CssContainerType with output(self, logger) {
  let ret = match self {
    Normal => "normal"
    Size => "size"
    InlineSize => "inline-size"
    BlockSize => "block-size"
  }
  logger.write_string(ret)
}

///|
/// CSS Logical Properties
pub(all) enum CssLogicalProperty {
  InlineStart
  InlineEnd
  BlockStart
  BlockEnd
} derive(Eq)

///|
pub impl Show for CssLogicalProperty with output(self, logger) {
  let ret = match self {
    InlineStart => "inline-start"
    InlineEnd => "inline-end"
    BlockStart => "block-start"
    BlockEnd => "block-end"
  }
  logger.write_string(ret)
}

///|
/// CSS Aspect Ratio
pub(all) enum CssAspectRatio {
  Auto
  Ratio(Float, Float)
  Value(Float)
} derive(Eq)

///|
pub impl Show for CssAspectRatio with output(self, logger) {
  let ret = match self {
    CssAspectRatio::Auto => "auto"
    Ratio(width, height) => "\{width} / \{height}"
    Value(ratio) => "\{ratio}"
  }
  logger.write_string(ret)
}

///|
/// CSS Scroll Behavior
pub(all) enum CssScrollBehavior {
  Auto
  Smooth
} derive(Eq)

///|
pub impl Show for CssScrollBehavior with output(self, logger) {
  let ret = match self {
    CssScrollBehavior::Auto => "auto"
    Smooth => "smooth"
  }
  logger.write_string(ret)
}

///|
/// CSS Resize Property
pub(all) enum CssResize {
  None
  Both
  Horizontal
  Vertical
  Block
  Inline
} derive(Eq)

///|
pub impl Show for CssResize with output(self, logger) {
  let ret = match self {
    CssResize::None => "none"
    CssResize::Both => "both"
    Horizontal => "horizontal"
    Vertical => "vertical"
    Block => "block"
    Inline => "inline"
  }
  logger.write_string(ret)
}
