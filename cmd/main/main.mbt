///|
fn main {
  // 测试基础样式
  let basic_style = @lib.respo_style(
    color=@lib.CssColor::Hex(255, 0, 0),
    background_color=@lib.CssColor::Blue,
    font_size=16,
    margin=@lib.CssSize::Px(10.0),
  )
  println("Basic style: " + basic_style.to_string())

  // 测试CSS函数
  let function_style = @lib.respo_style(
    width_extended=@lib.CssSize::Function(
      @lib.CssFunction::Clamp(
        @lib.CssSize::Px(200.0),
        @lib.CssSize::Vw(50.0),
        @lib.CssSize::Px(800.0),
      ),
    ),
    height_extended=@lib.CssSize::Dvh(100.0),
  )
  println("Function style: " + function_style.to_string())

  // 测试Grid布局
  let grid_style = @lib.respo_style(
    display=@lib.CssDisplay::Grid,
    grid_template_columns=@lib.CssGridTemplateColumns::Fr([1.0, 2.0, 1.0]),
    gap=@lib.CssSize::Px(16.0),
  )
  println("Grid style: " + grid_style.to_string())

  // 测试动画
  let animation_style = @lib.respo_style(
    animation_name="fadeIn",
    animation_duration=@lib.CssDuration::S(2.0),
    animation_timing_function=@lib.CssTimingFunction::Ease,
    animation_direction=@lib.CssAnimationDirection::Alternate,
  )
  println("Animation style: " + animation_style.to_string())

  // 测试边界情况
  let edge_cases = @lib.respo_style(
    color=@lib.CssColor::Hex(0, 0, 0), // 测试0值
    background_color=@lib.CssColor::Hex(255, 255, 255), // 测试最大值
    width_extended=@lib.CssSize::Px(0.0), // 测试0像素
    margin_extended=@lib.CssSize::Percent(-10.0), // 测试负值
  )
  println("Edge cases: " + edge_cases.to_string())

  // 测试复杂CSS函数
  let complex_functions = @lib.respo_style(
    width_extended=@lib.CssSize::Function(
      @lib.CssFunction::Min([@lib.CssSize::Px(300.0), @lib.CssSize::Vw(80.0)]),
    ),
    height_extended=@lib.CssSize::Function(
      @lib.CssFunction::Max([@lib.CssSize::Px(200.0), @lib.CssSize::Vh(50.0)]),
    ),
  )
  println("Complex functions: " + complex_functions.to_string())
}
