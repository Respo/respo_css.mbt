///|
pub(all) enum CssSize {
  Auto
  Px(Float)
  Percent(Float)
  Em(Float)
  Rem(Float)
  Vw(Float)
  Vh(Float)
  Fr(Float)
  Ch(Float)
  Ex(Float)
  Vmin(Float)
  Vmax(Float)
  Dvh(Float)
  Dvw(Float)
  Lvh(Float)
  Lvw(Float)
  Svh(Float)
  Svw(Float)
  Function(CssFunction)
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
/// use `respo_style` to create style, use `.add()` to add custom styles
pub(all) struct RespoStyle(Array[(String, String)]) derive(Eq, Default)

// is_empty

///|
pub fn is_empty(self : RespoStyle) -> Bool {
  self.inner().is_empty()
}

///|
pub impl Show for RespoStyle with output(self, logger) {
  let mut result = ""
  for pair in self.inner() {
    let (property, value) = pair
    result = result + property + ":" + value + "; "
  }
  logger.write_string(result)
}

///|
/// for custom styles not defined with enum, use this function to add
pub fn add(self : RespoStyle, property : String, value : String) -> RespoStyle {
  self.inner().push((property, value))
  self
}

///|
pub fn merge(self : RespoStyle, other : RespoStyle) -> RespoStyle {
  let mut result = self
  for pair in other.inner() {
    let (property, value) = pair
    result = result.add(property, value)
  }
  result
}

///|
pub fn RespoStyle::length(self : RespoStyle) -> Int {
  self.inner().length()
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
  match color {
    Some(value) => style.push(("color", value.to_string()))
    None => ()
  }
  match background_color {
    Some(value) => style.push(("background-color", value.to_string()))
    None => ()
  }
  match font_size {
    Some(value) => style.push(("font-size", value.to_string() + "px"))
    None => ()
  }
  match font_family {
    Some(value) => style.push(("font-family", value))
    None => ()
  }
  match font_weight {
    Some(value) => style.push(("font-weight", value))
    None => ()
  }
  match text_align {
    Some(value) => style.push(("text-align", value.to_string()))
    None => ()
  }
  match display {
    Some(value) => style.push(("display", value.to_string()))
    None => ()
  }
  match margin {
    Some(value) => style.push(("margin", value.to_string()))
    None => ()
  }
  match padding {
    Some(value) => style.push(("padding", value.to_string()))
    None => ()
  }
  match border {
    Some(value) => style.push(("border", value.to_string()))
    None => ()
  }
  match width {
    Some(value) => style.push(("width", value.to_string()))
    None => ()
  }
  match height {
    Some(value) => style.push(("height", value.to_string()))
    None => ()
  }
  match position {
    Some(value) => style.push(("position", value.to_string()))
    None => ()
  }
  match top {
    Some(value) => style.push(("top", value.to_string()))
    None => ()
  }
  match right {
    Some(value) => style.push(("right", value.to_string()))
    None => ()
  }
  match bottom {
    Some(value) => style.push(("bottom", value.to_string()))
    None => ()
  }
  match left {
    Some(value) => style.push(("left", value.to_string()))
    None => ()
  }
  match float {
    Some(value) => style.push(("float", value))
    None => ()
  }
  match clear {
    Some(value) => style.push(("clear", value))
    None => ()
  }
  match overflow {
    Some(value) => style.push(("overflow", value.to_string()))
    None => ()
  }
  match z_index {
    Some(value) => style.push(("z-index", value.to_string()))
    None => ()
  }
  match flex {
    Some(value) => style.push(("flex", value.to_string()))
    None => ()
  }
  match flex_direction {
    Some(value) => style.push(("flex-direction", value.to_string()))
    None => ()
  }
  match justify_content {
    Some(value) => style.push(("justify-content", value.to_string()))
    None => ()
  }
  match align_items {
    Some(value) => style.push(("align-items", value.to_string()))
    None => ()
  }
  match align_content {
    Some(value) => style.push(("align-content", value.to_string()))
    None => ()
  }
  match order {
    Some(value) => style.push(("order", value.to_string()))
    None => ()
  }
  match text_decoration {
    Some(value) => style.push(("text-decoration", value.to_string()))
    None => ()
  }
  match text_transform {
    Some(value) => style.push(("text-transform", value))
    None => ()
  }
  match line_height {
    Some(value) => style.push(("line-height", value.to_string()))
    None => ()
  }
  match letter_spacing {
    Some(value) => style.push(("letter-spacing", value))
    None => ()
  }
  match white_space {
    Some(value) => style.push(("white-space", value))
    None => ()
  }
  match word_break {
    Some(value) => style.push(("word-break", value.to_string()))
    None => ()
  }
  match opacity {
    Some(value) => style.push(("opacity", value.to_string()))
    None => ()
  }
  match visibility {
    Some(value) => style.push(("visibility", value))
    None => ()
  }
  match box_shadow {
    Some(value) => style.push(("box-shadow", value))
    None => ()
  }
  match transition {
    Some(value) => style.push(("transition", value))
    None => ()
  }
  match box_sizing {
    Some(value) => style.push(("box-sizing", value.to_string()))
    None => ()
  }
  match border_radius {
    Some(value) => style.push(("border-radius", value.to_string() + "px"))
    None => ()
  }
  match padding_top {
    Some(value) => style.push(("padding-top", value.to_string()))
    None => ()
  }
  match padding_bottom {
    Some(value) => style.push(("padding-bottom", value.to_string()))
    None => ()
  }
  match padding_left {
    Some(value) => style.push(("padding-left", value.to_string()))
    None => ()
  }
  match padding_right {
    Some(value) => style.push(("padding-right", value.to_string()))
    None => ()
  }
  match max_width {
    Some(value) => style.push(("max-width", value.to_string()))
    None => ()
  }
  match min_width {
    Some(value) => style.push(("min-width", value.to_string()))
    None => ()
  }
  match vertical_align {
    Some(value) => style.push(("vertical-align", value.to_string()))
    None => ()
  }
  match border_color {
    Some(value) => style.push(("border-color", value.to_string()))
    None => ()
  }
  match border_width {
    Some(value) => style.push(("border-width", value.to_string()))
    None => ()
  }
  match border_style {
    Some(value) => style.push(("border-style", value.to_string()))
    None => ()
  }
  match cursor {
    Some(value) => style.push(("cursor", value.to_string()))
    None => ()
  }
  match transition_duration {
    Some(value) => style.push(("transition-duration", value.to_string()))
    None => ()
  }
  match transform {
    Some(value) => style.push(("transform", value.to_string()))
    None => ()
  }
  match outline {
    Some(value) => style.push(("outline", value.to_string()))
    None => ()
  }
  match user_select {
    Some(value) => style.push(("user-select", value.to_string()))
    None => ()
  }
  match margin_top {
    Some(value) => style.push(("margin-top", value.to_string()))
    None => ()
  }
  match margin_bottom {
    Some(value) => style.push(("margin-bottom", value.to_string()))
    None => ()
  }
  match margin_left {
    Some(value) => style.push(("margin-left", value.to_string()))
    None => ()
  }
  match margin_right {
    Some(value) => style.push(("margin-right", value.to_string()))
    None => ()
  }
  match max_height {
    Some(value) => style.push(("max-height", value.to_string()))
    None => ()
  }
  match transform_property {
    Some(xs) => {
      let value = xs.join(",")
      style.push(("transform-property", value))
    }
    None => ()
  }
  match gap {
    Some(value) => style.push(("gap", value.to_string()))
    None => ()
  }
  match content {
    Some(value) => style.push(("content", value))
    None => ()
  }
  match content_visibility {
    Some(value) => style.push(("content-visibility", value.to_string()))
    None => ()
  }
  match filter {
    Some(value) => style.push(("filter", value.to_string()))
    None => ()
  }
  match object_fit {
    Some(value) => style.push(("object-fit", value.to_string()))
    None => ()
  }
  match overscroll_behavior_x {
    Some(value) => style.push(("overscroll-behavior-x", value.to_string()))
    None => ()
  }
  match overscroll_behavior_y {
    Some(value) => style.push(("overscroll-behavior-y", value.to_string()))
    None => ()
  }

  // CSS Grid Layout
  match grid_template_columns {
    Some(value) => style.push(("grid-template-columns", value.to_string()))
    None => ()
  }
  match grid_template_rows {
    Some(value) => style.push(("grid-template-rows", value.to_string()))
    None => ()
  }
  match grid_column {
    Some(value) => style.push(("grid-column", value.to_string()))
    None => ()
  }
  match grid_row {
    Some(value) => style.push(("grid-row", value.to_string()))
    None => ()
  }
  match grid_area {
    Some(value) => style.push(("grid-area", value))
    None => ()
  }
  match justify_items {
    Some(value) => style.push(("justify-items", value.to_string()))
    None => ()
  }
  match align_items_grid {
    Some(value) => style.push(("align-items", value.to_string()))
    None => ()
  }

  // CSS Animation
  match animation_direction {
    Some(value) => style.push(("animation-direction", value.to_string()))
    None => ()
  }
  match animation_fill_mode {
    Some(value) => style.push(("animation-fill-mode", value.to_string()))
    None => ()
  }
  match animation_play_state {
    Some(value) => style.push(("animation-play-state", value.to_string()))
    None => ()
  }
  match animation_name {
    Some(value) => style.push(("animation-name", value))
    None => ()
  }
  match animation_duration {
    Some(value) => style.push(("animation-duration", value.to_string()))
    None => ()
  }
  match animation_timing_function {
    Some(value) => style.push(("animation-timing-function", value.to_string()))
    None => ()
  }
  match animation_delay {
    Some(value) => style.push(("animation-delay", value.to_string()))
    None => ()
  }
  match animation_iteration_count {
    Some(value) => style.push(("animation-iteration-count", value))
    None => ()
  }

  // Enhanced Typography
  match font_style {
    Some(value) => style.push(("font-style", value.to_string()))
    None => ()
  }
  match font_variant {
    Some(value) => style.push(("font-variant", value.to_string()))
    None => ()
  }
  match text_transform_enhanced {
    Some(value) => style.push(("text-transform", value.to_string()))
    None => ()
  }

  // Modern CSS Features
  match aspect_ratio {
    Some(value) => style.push(("aspect-ratio", value.to_string()))
    None => ()
  }
  match scroll_behavior {
    Some(value) => style.push(("scroll-behavior", value.to_string()))
    None => ()
  }
  match resize {
    Some(value) => style.push(("resize", value.to_string()))
    None => ()
  }
  match container_type {
    Some(value) => style.push(("container-type", value.to_string()))
    None => ()
  }
  match container_name {
    Some(value) => style.push(("container-name", value))
    None => ()
  }

  // CSS Functions and Extended Sizes
  match width_extended {
    Some(value) => style.push(("width", value.to_string()))
    None => ()
  }
  match height_extended {
    Some(value) => style.push(("height", value.to_string()))
    None => ()
  }
  match margin_extended {
    Some(value) => style.push(("margin", value.to_string()))
    None => ()
  }
  match padding_extended {
    Some(value) => style.push(("padding", value.to_string()))
    None => ()
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
pub(all) enum CssPosition {
  Static
  Relative
  Absolute
  Fixed
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
pub(all) enum CssColor {
  Hsla(UInt, UInt, UInt, Float)
  Hsl(UInt, UInt, UInt)
  Hsluva(UInt, UInt, UInt, Float)
  Hsluv(UInt, UInt, UInt)
  Rgba(UInt, UInt, UInt, Float)
  Rgb(UInt, UInt, UInt)
  Hex(UInt, UInt, UInt)
  Red
  Green
  Blue
  White
  Black
  Gray
  Yellow
  Purple
  Cyan
  Orange
  Pink
  RawString(String)
  Transparent
} derive(Eq)

///|
/// Convert a UInt to a 2-digit hexadecimal string
fn uint_to_hex(value : UInt) -> String {
  let hex_digits = [
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f",
  ]
  let high = (value / 16).to_int()
  let low = (value % 16).to_int()
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
pub(all) enum CssDisplay {
  Block
  Inline
  InlineBlock
  Flex
  InlineFlex
  Grid
  InlineGrid
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
pub(all) enum CssFlexWrap {
  Wrap
  Nowrap
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
pub(all) enum CssFlexDirection {
  Row
  RowReverse
  Column
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
pub(all) enum CssVerticalAlign {
  Top
  Middle
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
pub(all) enum CssFlexJustifyContent {
  FlexStart
  FlexEnd
  Center
  SpaceBetween
  SpaceAround
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
pub(all) enum CssFlexAlignItems {
  FlexStart
  FlexEnd
  Center
  Baseline
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
pub(all) enum CssFlexAlignContent {
  FlexStart
  FlexEnd
  Center
  SpaceBetween
  SpaceAround
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
pub(all) enum CssBorderStyle {
  Solid
  Dashed
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
pub(all) enum CssBackgroundSize {
  Cover
  Contain
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
pub(all) enum CssOverflow {
  Visible
  Hidden
  Scroll
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
pub(all) enum CssTransform {
  Translate(Int, Int)
  TranslateX(Int)
  TranslateY(Int)
  Scale(Float)
  Rotate(Int)
  Skew(Int, Int)
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
pub(all) enum CssTimingFunction {
  Ease
  Linear
  EaseIn
  EaseOut
  EaseInOut
  StepStart
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
pub(all) enum CssTextOverflow {
  Clip
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
pub(all) enum CssBoxSizing {
  BorderBox
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
pub(all) enum CssTextAlign {
  Left
  Right
  Center
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
pub(all) enum CssFontWeight {
  Normal
  Bold
  Bolder
  Lighter
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
pub(all) enum CssTextDecoration {
  None
  Underline
  Overline
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
pub(all) enum CssCursor {
  Auto
  Default
  None
  Pointer
  ContextMenu
  Help
  Progress
  Wait
  Cell
  Crosshair
  Text
  VerticalText
  Alias
  Copy
  Move
  NoDrop
  NotAllowed
  Grab
  Grabbing
  AllScroll
  ColResize
  RowResize
  NResize
  EResize
  SResize
  WResize
  NeResize
  NwResize
  SeResize
  SwResize
  EwResize
  NsResize
  NeswResize
  NwseResize
  ZoomIn
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
pub(all) enum CssContentVisibility {
  Visible
  Hidden
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
/// https://developer.mozilla.org/en-US/docs/Web/CSS/filter
pub(all) enum CssFilter {
  None
  Blur(Float)
  Brightness(Float)
  Contrast(Float)
  Grayscale(Float)
  HueRotate(Float)
  Invert(Float)
  Opacity(Float)
  Saturate(Float)
  Sepia(Float)
  DropShadow(Float, Float, Float, CssColor)
  Url(String)
  Revert
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
pub(all) enum CssObjectFit {
  Fill
  Contain
  Cover
  None
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
pub(all) enum CssOverscrollBehavior {
  Auto
  Contain
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
pub(all) enum CssGridTemplateColumns {
  None
  Auto
  Repeat(Int, CssSize)
  Fr(Array[Float])
  Sizes(Array[CssSize])
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
pub(all) enum CssGridTemplateRows {
  None
  Auto
  Repeat(Int, CssSize)
  Fr(Array[Float])
  Sizes(Array[CssSize])
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
pub(all) enum CssGridArea {
  Auto
  Span(Int)
  Line(Int)
  Named(String)
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
pub(all) enum CssAnimationDirection {
  Normal
  Reverse
  Alternate
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
pub(all) enum CssFunction {
  Calc(String)
  Min(Array[CssSize])
  Max(Array[CssSize])
  Clamp(CssSize, CssSize, CssSize)
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
