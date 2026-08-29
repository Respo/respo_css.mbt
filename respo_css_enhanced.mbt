///|
/// Enhanced CSS Properties and Builders for respo_css

///|
/// Border Radius Properties
pub(all) struct CssBorderRadius {
  top_left : CssSize?
  top_right : CssSize?
  bottom_left : CssSize?
  bottom_right : CssSize?
}

///|
pub fn CssBorderRadius::new(
  top_left? : CssSize,
  top_right? : CssSize,
  bottom_left? : CssSize,
  bottom_right? : CssSize,
) -> CssBorderRadius {
  CssBorderRadius::{ top_left, top_right, bottom_left, bottom_right, }
}

///|
pub fn CssBorderRadius::to_string(self : CssBorderRadius) -> String {
  let parts = []
  if self.top_left is Some(v) {
    parts.push("border-top-left-radius: " + v.to_string())
  }
  if self.top_right is Some(v) {
    parts.push("border-top-right-radius: " + v.to_string())
  }
  if self.bottom_left is Some(v) {
    parts.push("border-bottom-left-radius: " + v.to_string())
  }
  if self.bottom_right is Some(v) {
    parts.push("border-bottom-right-radius: " + v.to_string())
  }
  parts.join(";")
}

///|
pub fn CssBorderRadius::to_styles(
  self : CssBorderRadius,
) -> Array[(String, String)] {
  let styles = []
  if self.top_left is Some(v) {
    styles.push(("border-top-left-radius", v.to_string()))
  }
  if self.top_right is Some(v) {
    styles.push(("border-top-right-radius", v.to_string()))
  }
  if self.bottom_left is Some(v) {
    styles.push(("border-bottom-left-radius", v.to_string()))
  }
  if self.bottom_right is Some(v) {
    styles.push(("border-bottom-right-radius", v.to_string()))
  }
  styles
}

///|
/// Box Shadow Builder
pub(all) enum CssBoxShadowType {
  Outer
  Inset
} derive(Eq)

///|
pub(all) struct CssBoxShadow {
  x : CssSize
  y : CssSize
  blur : CssSize
  spread : CssSize?
  color : CssColor
  shadow_type : CssBoxShadowType
}

///|
pub fn CssBoxShadow::new(
  x? : CssSize = Px(0.0),
  y? : CssSize = Px(0.0),
  blur? : CssSize = Px(0.0),
  spread? : CssSize,
  color? : CssColor = Black,
  shadow_type? : CssBoxShadowType = Outer,
) -> CssBoxShadow {
  CssBoxShadow::{ x, y, blur, spread, color, shadow_type, }
}

///|
pub impl Show for CssBoxShadow with fn output(self, logger) {
  let mut ret = ""
  if self.shadow_type == Inset {
    ret = ret + "inset "
  }
  ret = ret +
    self.x.to_string() +
    " " +
    self.y.to_string() +
    " " +
    self.blur.to_string() +
    " "
  if self.spread is Some(v) {
    ret = ret + v.to_string() + " "
  }
  ret = ret + self.color.to_string()
  logger.write_string(ret)
}

///|
/// Linear Gradient Builder
pub(all) enum CssGradientAngle {
  Deg(Int)
  Direction(String)
} derive(Eq)

///|
pub(all) struct CssGradientStop {
  color : CssColor
  position : CssSize?
} derive(Eq)

///|
pub fn CssGradientStop::new(
  color : CssColor,
  position? : CssSize,
) -> CssGradientStop {
  CssGradientStop::{ color, position, }
}

///|
pub(all) enum CssGradient {
  Linear(CssGradientAngle?, Array[CssGradientStop])
  Radial(Array[CssGradientStop])
  Conic(CssGradientAngle?, Array[CssGradientStop])
} derive(Eq)

///|
pub impl Show for CssGradient with fn output(self, logger) {
  let ret = match self {
    Linear(angle, stops) => {
      let mut result = "linear-gradient("
      match angle {
        Some(Deg(d)) => result = result + d.to_string() + "deg, "
        Some(Direction(dir)) => result = result + dir + ", "
        None => ()
      }
      let stop_strs = stops.map(fn(stop) {
        let color_str = stop.color.to_string()
        match stop.position {
          Some(pos) => color_str + " " + pos.to_string()
          None => color_str
        }
      })
      result = result + stop_strs.join(", ")
      result + ")"
    }
    Radial(stops) => {
      let mut result = "radial-gradient("
      let stop_strs = stops.map(fn(stop) {
        let color_str = stop.color.to_string()
        match stop.position {
          Some(pos) => color_str + " " + pos.to_string()
          None => color_str
        }
      })
      result = result + stop_strs.join(", ")
      result + ")"
    }
    Conic(angle, stops) => {
      let mut result = "conic-gradient("
      match angle {
        Some(Deg(d)) => result = result + "from " + d.to_string() + "deg, "
        Some(Direction(dir)) => result = result + "from " + dir + ", "
        None => ()
      }
      let stop_strs = stops.map(fn(stop) {
        let color_str = stop.color.to_string()
        match stop.position {
          Some(pos) => color_str + " " + pos.to_string()
          None => color_str
        }
      })
      result = result + stop_strs.join(", ")
      result + ")"
    }
  }
  logger.write_string(ret)
}

///|
/// Transition Builder
pub(all) struct CssTransitionProperty {
  property : String
  duration : CssDuration
  timing_function : CssTimingFunction?
  delay : CssDuration?
}

///|
pub fn CssTransitionProperty::new(
  property : String,
  duration : CssDuration,
  timing_function? : CssTimingFunction,
  delay? : CssDuration,
) -> CssTransitionProperty {
  CssTransitionProperty::{ property, duration, timing_function, delay, }
}

///|
pub impl Show for CssTransitionProperty with fn output(self, logger) {
  let mut ret = self.property + " " + self.duration.to_string()
  if self.timing_function is Some(tf) {
    ret = ret + " " + tf.to_string()
  }
  if self.delay is Some(d) {
    ret = ret + " " + d.to_string()
  }
  logger.write_string(ret)
}

///|
/// Keyframes Definition
pub(all) struct CssKeyframe {
  position : Int
  styles : Array[(String, String)]
}

///|
pub fn CssKeyframe::new(
  position : Int,
  styles : Array[(String, String)],
) -> CssKeyframe {
  CssKeyframe::{ position, styles, }
}

///|
pub(all) struct CssKeyframes {
  name : String
  keyframes : Array[CssKeyframe]
}

///|
pub fn CssKeyframes::new(
  name : String,
  keyframes : Array[CssKeyframe],
) -> CssKeyframes {
  CssKeyframes::{ name, keyframes, }
}

///|
pub fn CssKeyframes::to_css_string(self : CssKeyframes) -> String {
  let mut css = "@keyframes " + self.name + " {\n"
  for keyframe in self.keyframes {
    css = css + "  " + keyframe.position.to_string() + "% {\n"
    for pair in keyframe.styles {
      let (prop, value) = pair
      css = css + "    " + prop + ": " + value + ";\n"
    }
    css = css + "  }\n"
  }
  css = css + "}\n"
  css
}

///|
/// Pointer Events
pub(all) enum CssPointerEvents {
  Auto
  None
  Visible
  Painted
  Fill
  Stroke
  All
  Inherit
} derive(Eq)

///|
pub impl Show for CssPointerEvents with fn output(self, logger) {
  let ret = match self {
    Auto => "auto"
    None => "none"
    Visible => "visible"
    Painted => "painted"
    Fill => "fill"
    Stroke => "stroke"
    All => "all"
    Inherit => "inherit"
  }
  logger.write_string(ret)
}

///|
/// Letter Spacing
pub(all) enum CssLetterSpacing {
  Normal
  Value(CssSize)
  Custom(String)
} derive(Eq)

///|
pub impl Show for CssLetterSpacing with fn output(self, logger) {
  let ret = match self {
    Normal => "normal"
    Value(size) => size.to_string()
    Custom(value) => value
  }
  logger.write_string(ret)
}

///|
/// Text Shadow
pub(all) struct CssTextShadow {
  x : CssSize
  y : CssSize
  blur : CssSize
  color : CssColor
}

///|
pub fn CssTextShadow::new(
  x? : CssSize = Px(0.0),
  y? : CssSize = Px(0.0),
  blur? : CssSize = Px(0.0),
  color? : CssColor = Black,
) -> CssTextShadow {
  CssTextShadow::{ x, y, blur, color, }
}

///|
pub impl Show for CssTextShadow with fn output(self, logger) {
  let ret = self.x.to_string() +
    " " +
    self.y.to_string() +
    " " +
    self.blur.to_string() +
    " " +
    self.color.to_string()
  logger.write_string(ret)
}

///|
/// Clip Path
pub(all) enum CssClipPath {
  Circle(CssSize, CssSize, CssSize)
  Ellipse(CssSize, CssSize, CssSize, CssSize)
  Inset(CssSize, CssSize, CssSize, CssSize)
  Polygon(Array[String])
  Url(String)
  Custom(String)
} derive(Eq)

///|
pub impl Show for CssClipPath with fn output(self, logger) {
  let ret = match self {
    Circle(radius, x, y) => {
      let r = radius.to_string()
      let px = x.to_string()
      let py = y.to_string()
      "circle(" + r + " at " + px + " " + py + ")"
    }
    Ellipse(rx, ry, x, y) => {
      let rx_str = rx.to_string()
      let ry_str = ry.to_string()
      let px = x.to_string()
      let py = y.to_string()
      "ellipse(" + rx_str + " " + ry_str + " at " + px + " " + py + ")"
    }
    Inset(top, right, bottom, left) => {
      let t = top.to_string()
      let r = right.to_string()
      let b = bottom.to_string()
      let l = left.to_string()
      "inset(" + t + " " + r + " " + b + " " + l + ")"
    }
    Polygon(points) => "polygon(" + points.join(", ") + ")"
    Url(url) => "url(" + url + ")"
    Custom(value) => value
  }
  logger.write_string(ret)
}

///|
/// Background Image
pub(all) enum CssBackgroundImage {
  LinearGradient(CssGradient)
  RadialGradient(CssGradient)
  ConicGradient(CssGradient)
  Url(String)
  Multiple(Array[CssBackgroundImage])
  None
  Custom(String)
} derive(Eq)

///|
pub impl Show for CssBackgroundImage with fn output(self, logger) {
  let ret = match self {
    LinearGradient(gradient) => gradient.to_string()
    RadialGradient(gradient) => gradient.to_string()
    ConicGradient(gradient) => gradient.to_string()
    Url(url) => "url(" + url + ")"
    Multiple(images) => images.map(fn(img) { img.to_string() }).join(", ")
    None => "none"
    Custom(value) => value
  }
  logger.write_string(ret)
}
