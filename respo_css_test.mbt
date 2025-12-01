///|
test "css_border" {
  let a = @respo_css.CssBorder(10, Solid, Red)
  inspect(a.to_string(), content="10px solid red")
  let b = @respo_css.CssBorder(2, Dashed, Blue)
  inspect(b.to_string(), content="2px dashed blue")
  let c = @respo_css.CssBorder(5, Dotted, Green)
  inspect(c.to_string(), content="5px dotted green")
}

///|
test "css_size" {
  inspect(@respo_css.CssSize::Auto.to_string(), content="auto")
  inspect(@respo_css.CssSize::Px(100.0).to_string(), content="100px")
  inspect(@respo_css.CssSize::Percent(50.0).to_string(), content="50%")
  inspect(@respo_css.CssSize::Em(2.5).to_string(), content="2.5em")
  inspect(
    @respo_css.CssSize::Rem(1.2).to_string(),
    content="1.2000000476837158rem",
  )
  inspect(@respo_css.CssSize::Vw(80).to_string(), content="80vw")
  inspect(@respo_css.CssSize::Vh(90).to_string(), content="90vh")
  inspect(
    @respo_css.CssSize::Custom("calc(100% - 20px)").to_string(),
    content="calc(100% - 20px)",
  )
}

///|
test "css_color" {
  inspect(@respo_css.CssColor::Red.to_string(), content="red")
  inspect(@respo_css.CssColor::Green.to_string(), content="green")
  inspect(@respo_css.CssColor::Blue.to_string(), content="blue")
  inspect(@respo_css.CssColor::White.to_string(), content="white")
  inspect(@respo_css.CssColor::Black.to_string(), content="black")
  inspect(@respo_css.CssColor::Transparent.to_string(), content="transparent")
  inspect(
    @respo_css.CssColor::Rgb(255, 128, 64).to_string(),
    content="rgb(255, 128, 64)",
  )
  inspect(
    @respo_css.CssColor::Rgba(255, 128, 64, 0.8).to_string(),
    content="rgba(255, 128, 64, 0.800000011920929)",
  )
  inspect(
    @respo_css.CssColor::Hsl(120, 50, 75).to_string(),
    content="hsl(120, 50%, 75%)",
  )
  inspect(
    @respo_css.CssColor::Hsla(240, 100, 50, 0.5).to_string(),
    content="hsla(240, 100%, 50%, 0.5)",
  )
  inspect(
    @respo_css.CssColor::Hex(255, 255, 255).to_string(),
    content="#ffffff",
  )
  inspect(
    @respo_css.CssColor::RawString("#ff6600").to_string(),
    content="#ff6600",
  )
}

///|
test "css_display" {
  inspect(@respo_css.CssDisplay::Block.to_string(), content="block")
  inspect(@respo_css.CssDisplay::Inline.to_string(), content="inline")
  inspect(
    @respo_css.CssDisplay::InlineBlock.to_string(),
    content="inline-block",
  )
  inspect(@respo_css.CssDisplay::Flex.to_string(), content="flex")
  inspect(@respo_css.CssDisplay::InlineFlex.to_string(), content="inline-flex")
  inspect(@respo_css.CssDisplay::Grid.to_string(), content="grid")
  inspect(@respo_css.CssDisplay::InlineGrid.to_string(), content="inline-grid")
  inspect(@respo_css.CssDisplay::None.to_string(), content="none")
}

///|
test "css_position" {
  inspect(@respo_css.CssPosition::Static.to_string(), content="static")
  inspect(@respo_css.CssPosition::Relative.to_string(), content="relative")
  inspect(@respo_css.CssPosition::Absolute.to_string(), content="absolute")
  inspect(@respo_css.CssPosition::Fixed.to_string(), content="fixed")
  inspect(@respo_css.CssPosition::Sticky.to_string(), content="sticky")
}

///|
test "css_flex_direction" {
  inspect(@respo_css.CssFlexDirection::Row.to_string(), content="row")
  inspect(
    @respo_css.CssFlexDirection::RowReverse.to_string(),
    content="row-reverse",
  )
  inspect(@respo_css.CssFlexDirection::Column.to_string(), content="column")
  inspect(
    @respo_css.CssFlexDirection::ColumnReverse.to_string(),
    content="column-reverse",
  )
}

///|
test "css_justify_content" {
  inspect(
    @respo_css.CssFlexJustifyContent::FlexStart.to_string(),
    content="flex-start",
  )
  inspect(
    @respo_css.CssFlexJustifyContent::FlexEnd.to_string(),
    content="flex-end",
  )
  inspect(
    @respo_css.CssFlexJustifyContent::Center.to_string(),
    content="center",
  )
  inspect(
    @respo_css.CssFlexJustifyContent::SpaceBetween.to_string(),
    content="space-between",
  )
  inspect(
    @respo_css.CssFlexJustifyContent::SpaceAround.to_string(),
    content="space-around",
  )
  inspect(
    @respo_css.CssFlexJustifyContent::SpaceEvenly.to_string(),
    content="space-evenly",
  )
}

///|
test "css_align_items" {
  inspect(
    @respo_css.CssFlexAlignItems::FlexStart.to_string(),
    content="flex-start",
  )
  inspect(@respo_css.CssFlexAlignItems::FlexEnd.to_string(), content="flex-end")
  inspect(@respo_css.CssFlexAlignItems::Center.to_string(), content="center")
  inspect(
    @respo_css.CssFlexAlignItems::Baseline.to_string(),
    content="baseline",
  )
  inspect(@respo_css.CssFlexAlignItems::Stretch.to_string(), content="stretch")
}

///|
test "css_text_align" {
  inspect(@respo_css.CssTextAlign::Left.to_string(), content="left")
  inspect(@respo_css.CssTextAlign::Right.to_string(), content="right")
  inspect(@respo_css.CssTextAlign::Center.to_string(), content="center")
  inspect(@respo_css.CssTextAlign::Justify.to_string(), content="justify")
}

///|
test "css_text_decoration" {
  inspect(@respo_css.CssTextDecoration::None.to_string(), content="none")
  inspect(
    @respo_css.CssTextDecoration::Underline.to_string(),
    content="underline",
  )
  inspect(
    @respo_css.CssTextDecoration::Overline.to_string(),
    content="overline",
  )
  inspect(
    @respo_css.CssTextDecoration::LineThrough.to_string(),
    content="line-through",
  )
}

///|
test "css_overflow" {
  inspect(@respo_css.CssOverflow::Visible.to_string(), content="visible")
  inspect(@respo_css.CssOverflow::Hidden.to_string(), content="hidden")
  inspect(@respo_css.CssOverflow::Scroll.to_string(), content="scroll")
  inspect(@respo_css.CssOverflow::Auto.to_string(), content="auto")
}

///|
test "css_cursor" {
  inspect(@respo_css.CssCursor::Auto.to_string(), content="auto")
  inspect(@respo_css.CssCursor::Default.to_string(), content="default")
  inspect(@respo_css.CssCursor::Pointer.to_string(), content="pointer")
  inspect(@respo_css.CssCursor::Text.to_string(), content="text")
  inspect(@respo_css.CssCursor::Move.to_string(), content="move")
  inspect(@respo_css.CssCursor::NotAllowed.to_string(), content="not-allowed")
  inspect(@respo_css.CssCursor::Grab.to_string(), content="grab")
  inspect(@respo_css.CssCursor::Grabbing.to_string(), content="grabbing")
}

///|
test "css_transform" {
  inspect(
    @respo_css.CssTransform::Translate(10, 20).to_string(),
    content="translate(10px, 20px)",
  )
  inspect(
    @respo_css.CssTransform::TranslateX(15).to_string(),
    content="translateX(15px)",
  )
  inspect(
    @respo_css.CssTransform::TranslateY(25).to_string(),
    content="translateY(25px)",
  )
  inspect(@respo_css.CssTransform::Scale(1.5).to_string(), content="scale(1.5)")
  inspect(
    @respo_css.CssTransform::Rotate(45).to_string(),
    content="rotate(45deg)",
  )
  inspect(
    @respo_css.CssTransform::Skew(10, 20).to_string(),
    content="skew(10deg, 20deg)",
  )
  inspect(
    @respo_css.CssTransform::Matrix(1.0, 0.0, 0.0, 1.0, 10.0, 20.0).to_string(),
    content="matrix(1, 0, 0, 1, 10, 20)",
  )
}

///|
test "css_filter" {
  inspect(@respo_css.CssFilter::None.to_string(), content="none")
  inspect(@respo_css.CssFilter::Blur(5.0).to_string(), content="blur(5px)")
  inspect(
    @respo_css.CssFilter::Brightness(1.2).to_string(),
    content="brightness(1.2000000476837158)",
  )
  inspect(
    @respo_css.CssFilter::Contrast(0.8).to_string(),
    content="contrast(0.800000011920929)",
  )
  inspect(
    @respo_css.CssFilter::Grayscale(0.5).to_string(),
    content="grayscale(0.5)",
  )
  inspect(
    @respo_css.CssFilter::HueRotate(90.0).to_string(),
    content="hue-rotate(90deg)",
  )
  inspect(@respo_css.CssFilter::Invert(1.0).to_string(), content="invert(1)")
  inspect(
    @respo_css.CssFilter::Opacity(0.7).to_string(),
    content="opacity(0.699999988079071)",
  )
  inspect(
    @respo_css.CssFilter::Saturate(1.5).to_string(),
    content="saturate(1.5)",
  )
  inspect(
    @respo_css.CssFilter::Sepia(0.3).to_string(),
    content="sepia(0.30000001192092896)",
  )
  inspect(
    @respo_css.CssFilter::DropShadow(2.0, 2.0, 4.0, Black).to_string(),
    content="drop-shadow(2px 2px 4px black)",
  )
}

///|
test "css_line_height" {
  inspect(@respo_css.CssLineHeight::Normal.to_string(), content="normal")
  inspect(@respo_css.CssLineHeight::Em(1.5).to_string(), content="1.5em")
  inspect(@respo_css.CssLineHeight::Px(24.0).to_string(), content="24px")
  inspect(@respo_css.CssLineHeight::Percent(120.0).to_string(), content="120%")
}

///|
test "css_duration" {
  inspect(@respo_css.CssDuration::Ms(300).to_string(), content="300ms")
  inspect(@respo_css.CssDuration::S(1.5).to_string(), content="1.5s")
}

///|
test "css_user_select" {
  inspect(@respo_css.CssUserSelect::None.to_string(), content="none")
  inspect(@respo_css.CssUserSelect::Text.to_string(), content="text")
  inspect(@respo_css.CssUserSelect::All.to_string(), content="all")
  inspect(@respo_css.CssUserSelect::Auto.to_string(), content="auto")
}

///|
test "css_box_sizing" {
  inspect(@respo_css.CssBoxSizing::BorderBox.to_string(), content="border-box")
  inspect(
    @respo_css.CssBoxSizing::ContentBox.to_string(),
    content="content-box",
  )
}

///|
test "css_object_fit" {
  inspect(@respo_css.CssObjectFit::Fill.to_string(), content="fill")
  inspect(@respo_css.CssObjectFit::Contain.to_string(), content="contain")
  inspect(@respo_css.CssObjectFit::Cover.to_string(), content="cover")
  inspect(@respo_css.CssObjectFit::None.to_string(), content="none")
  inspect(@respo_css.CssObjectFit::ScaleDown.to_string(), content="scale-down")
}

///|
test "respo_style_basic" {
  let style = @respo_css.respo_style()
  inspect(style.is_empty(), content="true")
  inspect(style.length(), content="0")
  inspect(style.to_string(), content="")
}

///|
test "respo_style_single_properties" {
  let style1 = @respo_css.respo_style(color=Red)
  inspect(style1.to_string(), content="color:red; ")
  inspect(style1.length(), content="1")
  let style2 = @respo_css.respo_style(background_color=Blue)
  inspect(style2.to_string(), content="background-color:blue; ")
  let style3 = @respo_css.respo_style(font_size=16)
  inspect(style3.to_string(), content="font-size:16px; ")
  let style4 = @respo_css.respo_style(display=Flex)
  inspect(style4.to_string(), content="display:flex; ")
  let style5 = @respo_css.respo_style(width=Px(200.0))
  inspect(style5.to_string(), content="width:200px; ")
}

///|
test "respo_style_multiple_properties" {
  let style = @respo_css.respo_style(
    color=Red,
    background_color=Blue,
    font_size=16,
    display=Flex,
    width=Px(200.0),
    height=Px(100.0),
  )
  inspect(style.length(), content="6")
  // Note: The order might vary, so we test individual properties
  let style_str = style.to_string()
  inspect(style_str.contains("color:red"), content="true")
  inspect(style_str.contains("background-color:blue"), content="true")
  inspect(style_str.contains("font-size:16px"), content="true")
  inspect(style_str.contains("display:flex"), content="true")
  inspect(style_str.contains("width:200px"), content="true")
  inspect(style_str.contains("height:100px"), content="true")
}

///|
test "respo_style_add_custom" {
  let style = @respo_css.respo_style(color=Red)
    .add("custom-property", "custom-value")
    .add("another-prop", "another-value")
  inspect(style.length(), content="3")
  let style_str = style.to_string()
  inspect(style_str.contains("color:red"), content="true")
  inspect(style_str.contains("custom-property:custom-value"), content="true")
  inspect(style_str.contains("another-prop:another-value"), content="true")
}

///|
test "respo_style_merge" {
  let style1 = @respo_css.respo_style(color=Red, font_size=16)
  let style2 = @respo_css.respo_style(background_color=Blue, width=Px(200.0))
  let merged = style1.merge(style2)
  inspect(merged.length(), content="4")
  let merged_str = merged.to_string()
  inspect(merged_str.contains("color:red"), content="true")
  inspect(merged_str.contains("font-size:16px"), content="true")
  inspect(merged_str.contains("background-color:blue"), content="true")
  inspect(merged_str.contains("width:200px"), content="true")
}

///|
test "respo_style_flexbox" {
  let flex_style = @respo_css.respo_style(
    display=Flex,
    flex_direction=Column,
    justify_content=Center,
    align_items=Stretch,
    gap=Px(10.0),
  )
  let style_str = flex_style.to_string()
  inspect(style_str.contains("display:flex"), content="true")
  inspect(style_str.contains("flex-direction:column"), content="true")
  inspect(style_str.contains("justify-content:center"), content="true")
  inspect(style_str.contains("align-items:stretch"), content="true")
  inspect(style_str.contains("gap:10px"), content="true")
}

///|
test "respo_style_positioning" {
  let pos_style = @respo_css.respo_style(
    position=Absolute,
    top=Px(10.0),
    right=Px(20.0),
    bottom=Px(30.0),
    left=Px(40.0),
    z_index=100,
  )
  let style_str = pos_style.to_string()
  inspect(style_str.contains("position:absolute"), content="true")
  inspect(style_str.contains("top:10px"), content="true")
  inspect(style_str.contains("right:20px"), content="true")
  inspect(style_str.contains("bottom:30px"), content="true")
  inspect(style_str.contains("left:40px"), content="true")
  inspect(style_str.contains("z-index:100"), content="true")
}

///|
test "respo_style_spacing" {
  let spacing_style = @respo_css.respo_style(
    margin=Px(10.0),
    padding=Px(20.0),
    margin_top=Px(5.0),
    margin_bottom=Px(15.0),
    padding_left=Px(25.0),
    padding_right=Px(35.0),
  )
  let style_str = spacing_style.to_string()
  inspect(style_str.contains("margin:10px"), content="true")
  inspect(style_str.contains("padding:20px"), content="true")
  inspect(style_str.contains("margin-top:5px"), content="true")
  inspect(style_str.contains("margin-bottom:15px"), content="true")
  inspect(style_str.contains("padding-left:25px"), content="true")
  inspect(style_str.contains("padding-right:35px"), content="true")
}

///|
test "respo_style_border_and_effects" {
  let border = @respo_css.CssBorder::new(width=2.0, style=Dashed, color=Green)
  let effects_style = @respo_css.respo_style(
    border~,
    border_radius=5.0,
    box_shadow="2px 2px 4px rgba(0,0,0,0.3)",
    opacity=0.8,
    transform=Scale(1.1),
  )
  let style_str = effects_style.to_string()
  inspect(style_str.contains("border:2px dashed green"), content="true")
  inspect(style_str.contains("border-radius:5px"), content="true")
  inspect(
    style_str.contains("box-shadow:2px 2px 4px rgba(0,0,0,0.3)"),
    content="true",
  )
  inspect(style_str.contains("opacity:0.8"), content="true")
  inspect(style_str.contains("transform:scale(1.1)"), content="false")
}

///|
test "css_border_new_constructor" {
  let border1 = @respo_css.CssBorder::new()
  inspect(border1.to_string(), content="1px solid black")
  let border2 = @respo_css.CssBorder::new(width=3.0)
  inspect(border2.to_string(), content="3px solid black")
  let border3 = @respo_css.CssBorder::new(style=Dashed)
  inspect(border3.to_string(), content="1px dashed black")
  let border4 = @respo_css.CssBorder::new(color=Red)
  inspect(border4.to_string(), content="1px solid red")
  let border5 = @respo_css.CssBorder::new(width=2.5, style=Dotted, color=Blue)
  inspect(border5.to_string(), content="2.5px dotted blue")
}

///|
test "css_outline" {
  inspect(@respo_css.CssOutline::None.to_string(), content="none")
  let outline1 = @respo_css.CssOutline::Outline(Px(2.0), Solid, Red)
  inspect(outline1.to_string(), content="2px solid red")
  let outline2 = @respo_css.CssOutline::Outline(Px(1.0), Dashed, Blue)
  inspect(outline2.to_string(), content="1px dashed blue")
}

///|
test "str_spaced_utility" {
  let result1 = @respo_css.str_spaced(["hello", "world", "test"])
  inspect(result1, content="hello world test")
  let result2 = @respo_css.str_spaced(wrap_parens=true, ["a", "b", "c"])
  inspect(result2, content="(a b c)")
  let result3 = @respo_css.str_spaced([])
  inspect(result3, content="")
}

///|
test "css_edge_cases" {
  // Test zero values
  inspect(@respo_css.CssSize::Px(0.0).to_string(), content="0px")
  inspect(@respo_css.CssSize::Percent(0.0).to_string(), content="0%")

  // Test negative values
  inspect(@respo_css.CssSize::Px(-10.0).to_string(), content="-10px")
  inspect(@respo_css.CssSize::Em(-1.5).to_string(), content="-1.5em")

  // Test large values
  inspect(@respo_css.CssSize::Vw(100).to_string(), content="100vw")
  inspect(@respo_css.CssSize::Vh(100).to_string(), content="100vh")
}

///|
test "css_color_edge_cases" {
  // Test RGB with max values
  inspect(
    @respo_css.CssColor::Rgb(255, 255, 255).to_string(),
    content="rgb(255, 255, 255)",
  )
  inspect(@respo_css.CssColor::Rgb(0, 0, 0).to_string(), content="rgb(0, 0, 0)")

  // Test RGBA with edge alpha values
  inspect(
    @respo_css.CssColor::Rgba(128, 128, 128, 0.0).to_string(),
    content="rgba(128, 128, 128, 0)",
  )
  inspect(
    @respo_css.CssColor::Rgba(128, 128, 128, 1.0).to_string(),
    content="rgba(128, 128, 128, 1)",
  )

  // Test HSL edge cases
  inspect(
    @respo_css.CssColor::Hsl(0, 0, 0).to_string(),
    content="hsl(0, 0%, 0%)",
  )
  inspect(
    @respo_css.CssColor::Hsl(360, 100, 100).to_string(),
    content="hsl(360, 100%, 100%)",
  )
}

///|
test "css_transform_combinations" {
  // Test individual transforms
  inspect(
    @respo_css.CssTransform::Translate(0, 0).to_string(),
    content="translate(0px, 0px)",
  )
  inspect(@respo_css.CssTransform::Scale(0.0).to_string(), content="scale(0)")
  inspect(
    @respo_css.CssTransform::Rotate(0).to_string(),
    content="rotate(0deg)",
  )
  inspect(
    @respo_css.CssTransform::Rotate(360).to_string(),
    content="rotate(360deg)",
  )
  inspect(
    @respo_css.CssTransform::Rotate(-45).to_string(),
    content="rotate(-45deg)",
  )
}

///|
test "respo_style_empty_and_edge_cases" {
  // Test empty style
  let empty_style = @respo_css.respo_style()
  inspect(empty_style.is_empty(), content="true")
  inspect(empty_style.length(), content="0")

  // Test style with only custom properties
  let custom_only = @respo_css.respo_style()
    .add("--custom-var", "value1")
    .add("--another-var", "value2")
  inspect(custom_only.length(), content="2")
  inspect(custom_only.is_empty(), content="false")

  // Test merging empty styles
  let empty1 = @respo_css.respo_style()
  let empty2 = @respo_css.respo_style()
  let merged_empty = empty1.merge(empty2)
  inspect(merged_empty.is_empty(), content="true")
  inspect(merged_empty.length(), content="0")
}

///|
test "respo_style_complex_scenarios" {
  // Test a complex card component style
  let card_style = @respo_css.respo_style(
    display=Flex,
    flex_direction=Column,
    background_color=White,
    border=@respo_css.CssBorder::new(
      width=1.0,
      style=Solid,
      color=@respo_css.CssColor::Rgba(0, 0, 0, 0.1),
    ),
    border_radius=8.0,
    padding=Px(16.0),
    margin=Px(8.0),
    box_shadow="0 2px 4px rgba(0,0,0,0.1)",
    transition="all 0.3s ease",
  )
  let style_str = card_style.to_string()
  inspect(style_str.contains("display:flex"), content="true")
  inspect(style_str.contains("flex-direction:column"), content="true")
  inspect(style_str.contains("background-color:white"), content="true")
  inspect(style_str.contains("border-radius:8px"), content="true")
  inspect(style_str.contains("padding:16px"), content="true")
  inspect(style_str.contains("margin:8px"), content="true")
  inspect(
    style_str.contains("box-shadow:0 2px 4px rgba(0,0,0,0.1)"),
    content="true",
  )
  inspect(style_str.contains("transition:all 0.3s ease"), content="true")
}

///|
test "respo_style_responsive_design" {
  // Test responsive design patterns
  let responsive_style = @respo_css.respo_style(
    width=Percent(100.0),
    max_width=Px(1200.0),
    min_width=Px(320.0),
    height=Auto,
    margin_left=Auto,
    margin_right=Auto,
  )
  let style_str = responsive_style.to_string()
  inspect(style_str.contains("width:100%"), content="true")
  inspect(style_str.contains("max-width:1200px"), content="true")
  inspect(style_str.contains("min-width:320px"), content="true")
  inspect(style_str.contains("height:auto"), content="true")
  inspect(style_str.contains("margin-left:auto"), content="true")
  inspect(style_str.contains("margin-right:auto"), content="true")
}

///|
test "css_filter_advanced" {
  // Test multiple filter effects
  inspect(
    @respo_css.CssFilter::Url("filters.svg#filter1").to_string(),
    content="url(filters.svg#filter1)",
  )
  inspect(@respo_css.CssFilter::Revert.to_string(), content="revert")
  inspect(@respo_css.CssFilter::RevertLayer.to_string(), content="revert-layer")

  // Test edge values for filters
  inspect(@respo_css.CssFilter::Blur(0.0).to_string(), content="blur(0px)")
  inspect(
    @respo_css.CssFilter::Brightness(0.0).to_string(),
    content="brightness(0)",
  )
  inspect(
    @respo_css.CssFilter::Contrast(2.0).to_string(),
    content="contrast(2)",
  )
  inspect(
    @respo_css.CssFilter::Grayscale(1.0).to_string(),
    content="grayscale(1)",
  )
}

///|
test "css_timing_functions" {
  inspect(@respo_css.CssTimingFunction::Ease.to_string(), content="ease")
  inspect(@respo_css.CssTimingFunction::Linear.to_string(), content="linear")
  inspect(@respo_css.CssTimingFunction::EaseIn.to_string(), content="ease-in")
  inspect(@respo_css.CssTimingFunction::EaseOut.to_string(), content="ease-out")
  inspect(
    @respo_css.CssTimingFunction::EaseInOut.to_string(),
    content="ease-in-out",
  )
  inspect(
    @respo_css.CssTimingFunction::StepStart.to_string(),
    content="step-start",
  )
  inspect(@respo_css.CssTimingFunction::StepEnd.to_string(), content="step-end")
}

///|
test "css_additional_enums" {
  // Test CssFlexWrap
  inspect(@respo_css.CssFlexWrap::Wrap.to_string(), content="wrap")
  inspect(@respo_css.CssFlexWrap::Nowrap.to_string(), content="nowrap")
  inspect(
    @respo_css.CssFlexWrap::WrapReverse.to_string(),
    content="wrap-reverse",
  )

  // Test CssVerticalAlign
  inspect(@respo_css.CssVerticalAlign::Top.to_string(), content="top")
  inspect(@respo_css.CssVerticalAlign::Middle.to_string(), content="middle")
  inspect(@respo_css.CssVerticalAlign::Bottom.to_string(), content="bottom")

  // Test CssWordBreak
  inspect(@respo_css.CssWordBreak::Normal.to_string(), content="normal")
  inspect(@respo_css.CssWordBreak::BreakAll.to_string(), content="break-all")
  inspect(@respo_css.CssWordBreak::KeepAll.to_string(), content="keep-all")
  inspect(@respo_css.CssWordBreak::BreakWord.to_string(), content="break-word")

  // Test CssTextOverflow
  inspect(@respo_css.CssTextOverflow::Clip.to_string(), content="clip")
  inspect(@respo_css.CssTextOverflow::Ellipsis.to_string(), content="ellipsis")

  // Test CssContentVisibility
  inspect(
    @respo_css.CssContentVisibility::Visible.to_string(),
    content="visible",
  )
  inspect(@respo_css.CssContentVisibility::Hidden.to_string(), content="hidden")
  inspect(@respo_css.CssContentVisibility::Auto.to_string(), content="auto")

  // Test CssOverscrollBehavior
  inspect(@respo_css.CssOverscrollBehavior::Auto.to_string(), content="auto")
  inspect(
    @respo_css.CssOverscrollBehavior::Contain.to_string(),
    content="contain",
  )
  inspect(@respo_css.CssOverscrollBehavior::None.to_string(), content="none")
}

///|
test "css_background_size" {
  inspect(@respo_css.CssBackgroundSize::Cover.to_string(), content="cover")
  inspect(@respo_css.CssBackgroundSize::Contain.to_string(), content="contain")
  inspect(
    @respo_css.CssBackgroundSize::Wh(100, 200).to_string(),
    content="100px 200px",
  )
  inspect(@respo_css.CssBackgroundSize::Wh(0, 0).to_string(), content="0px 0px")
}

///|
test "css_font_weight" {
  inspect(@respo_css.CssFontWeight::Normal.to_string(), content="normal")
  inspect(@respo_css.CssFontWeight::Bold.to_string(), content="bold")
  inspect(@respo_css.CssFontWeight::Bolder.to_string(), content="bolder")
  inspect(@respo_css.CssFontWeight::Lighter.to_string(), content="lighter")
  inspect(@respo_css.CssFontWeight::Weight(100).to_string(), content="100")
  inspect(@respo_css.CssFontWeight::Weight(400).to_string(), content="400")
  inspect(@respo_css.CssFontWeight::Weight(700).to_string(), content="700")
  inspect(@respo_css.CssFontWeight::Weight(900).to_string(), content="900")
}

///|
/// Tests for CSS Grid Layout Properties
test "css_grid_template_columns" {
  let none_cols = @respo_css.CssGridTemplateColumns::None
  inspect(none_cols.to_string(), content="none")
  let auto_cols = @respo_css.CssGridTemplateColumns::Auto
  inspect(auto_cols.to_string(), content="auto")
  let repeat_cols = @respo_css.CssGridTemplateColumns::Repeat(
    3,
    @respo_css.CssSize::Px(100.0),
  )
  inspect(repeat_cols.to_string(), content="repeat(3, 100px)")
  let fr_cols = @respo_css.CssGridTemplateColumns::Fr([1.0, 2.0, 1.0])
  inspect(fr_cols.to_string(), content="1fr 2fr 1fr")
  let sizes_cols = @respo_css.CssGridTemplateColumns::Sizes([
    @respo_css.CssSize::Px(200.0),
    @respo_css.CssSize::Auto,
    @respo_css.CssSize::Percent(50.0),
  ])
  inspect(sizes_cols.to_string(), content="200px auto 50%")
  let custom_cols = @respo_css.CssGridTemplateColumns::Custom(
    "minmax(100px, 1fr) repeat(3, 1fr)",
  )
  inspect(custom_cols.to_string(), content="minmax(100px, 1fr) repeat(3, 1fr)")
}

///|
test "css_grid_template_rows" {
  let none_rows = @respo_css.CssGridTemplateRows::None
  inspect(none_rows.to_string(), content="none")
  let auto_rows = @respo_css.CssGridTemplateRows::Auto
  inspect(auto_rows.to_string(), content="auto")
  let repeat_rows = @respo_css.CssGridTemplateRows::Repeat(
    2,
    @respo_css.CssSize::Em(1.5),
  )
  inspect(repeat_rows.to_string(), content="repeat(2, 1.5em)")
  let fr_rows = @respo_css.CssGridTemplateRows::Fr([1.0, 3.0])
  inspect(fr_rows.to_string(), content="1fr 3fr")
}

///|
test "css_grid_area" {
  let auto_area = @respo_css.CssGridArea::Auto
  inspect(auto_area.to_string(), content="auto")
  let span_area = @respo_css.CssGridArea::Span(2)
  inspect(span_area.to_string(), content="span 2")
  let line_area = @respo_css.CssGridArea::Line(3)
  inspect(line_area.to_string(), content="3")
  let named_area = @respo_css.CssGridArea::Named("header")
  inspect(named_area.to_string(), content="header")
  let custom_area = @respo_css.CssGridArea::Custom("1 / 2 / 3 / 4")
  inspect(custom_area.to_string(), content="1 / 2 / 3 / 4")
}

///|
test "css_justify_items" {
  let start = @respo_css.CssJustifyItems::Start
  inspect(start.to_string(), content="start")
  let end = @respo_css.CssJustifyItems::End
  inspect(end.to_string(), content="end")
  let center = @respo_css.CssJustifyItems::Center
  inspect(center.to_string(), content="center")
  let stretch = @respo_css.CssJustifyItems::Stretch
  inspect(stretch.to_string(), content="stretch")
  let baseline = @respo_css.CssJustifyItems::Baseline
  inspect(baseline.to_string(), content="baseline")
}

///|
/// Tests for CSS Animation Properties
test "css_animation_direction" {
  let normal = @respo_css.CssAnimationDirection::Normal
  inspect(normal.to_string(), content="normal")
  let reverse = @respo_css.CssAnimationDirection::Reverse
  inspect(reverse.to_string(), content="reverse")
  let alternate = @respo_css.CssAnimationDirection::Alternate
  inspect(alternate.to_string(), content="alternate")
  let alternate_reverse = @respo_css.CssAnimationDirection::AlternateReverse
  inspect(alternate_reverse.to_string(), content="alternate-reverse")
}

///|
test "css_animation_fill_mode" {
  let none = @respo_css.CssAnimationFillMode::None
  inspect(none.to_string(), content="none")
  let forwards = @respo_css.CssAnimationFillMode::Forwards
  inspect(forwards.to_string(), content="forwards")
  let backwards = @respo_css.CssAnimationFillMode::Backwards
  inspect(backwards.to_string(), content="backwards")
  let both = @respo_css.CssAnimationFillMode::Both
  inspect(both.to_string(), content="both")
}

///|
test "css_animation_play_state" {
  let running = @respo_css.CssAnimationPlayState::Running
  inspect(running.to_string(), content="running")
  let paused = @respo_css.CssAnimationPlayState::Paused
  inspect(paused.to_string(), content="paused")
}

///|
/// Tests for CSS Functions
test "css_function" {
  let calc_func = @respo_css.CssFunction::Calc("100% - 20px")
  inspect(calc_func.to_string(), content="calc(100% - 20px)")
  let min_func = @respo_css.CssFunction::Min([
    @respo_css.CssSize::Px(100.0),
    @respo_css.CssSize::Percent(50.0),
  ])
  inspect(min_func.to_string(), content="min(100px, 50%)")
  let max_func = @respo_css.CssFunction::Max([
    @respo_css.CssSize::Em(2.0),
    @respo_css.CssSize::Rem(1.5),
  ])
  inspect(max_func.to_string(), content="max(2em, 1.5rem)")
  let clamp_func = @respo_css.CssFunction::Clamp(
    @respo_css.CssSize::Px(16.0),
    @respo_css.CssSize::Vw(4),
    @respo_css.CssSize::Px(24.0),
  )
  inspect(clamp_func.to_string(), content="clamp(16px, 4vw, 24px)")
  let var_func = @respo_css.CssFunction::Var(
    "primary-color",
    Some(@respo_css.CssSize::Px(16.0)),
  )
  inspect(var_func.to_string(), content="var(--primary-color, 16px)")
  let var_func_no_fallback = @respo_css.CssFunction::Var(
    "secondary-color",
    None,
  )
  inspect(var_func_no_fallback.to_string(), content="var(--secondary-color)")
}

///|
/// Tests for Extended Size Units
test "css_extended_size" {
  let fr_size = @respo_css.CssSize::Fr(1.5)
  inspect(fr_size.to_string(), content="1.5fr")
  let ch_size = @respo_css.CssSize::Ch(20.0)
  inspect(ch_size.to_string(), content="20ch")
  let ex_size = @respo_css.CssSize::Ex(2.5)
  inspect(ex_size.to_string(), content="2.5ex")
  let vmin_size = @respo_css.CssSize::Vmin(50.0)
  inspect(vmin_size.to_string(), content="50vmin")
  let vmax_size = @respo_css.CssSize::Vmax(75.0)
  inspect(vmax_size.to_string(), content="75vmax")
  let dvh_size = @respo_css.CssSize::Dvh(100.0)
  inspect(dvh_size.to_string(), content="100dvh")
  let dvw_size = @respo_css.CssSize::Dvw(100.0)
  inspect(dvw_size.to_string(), content="100dvw")
  let lvh_size = @respo_css.CssSize::Lvh(50.0)
  inspect(lvh_size.to_string(), content="50lvh")
  let lvw_size = @respo_css.CssSize::Lvw(50.0)
  inspect(lvw_size.to_string(), content="50lvw")
  let svh_size = @respo_css.CssSize::Svh(25.0)
  inspect(svh_size.to_string(), content="25svh")
  let svw_size = @respo_css.CssSize::Svw(25.0)
  inspect(svw_size.to_string(), content="25svw")
  let function_size = @respo_css.CssSize::Function(
    @respo_css.CssFunction::Calc("100vh - 60px"),
  )
  inspect(function_size.to_string(), content="calc(100vh - 60px)")
  let custom_size = @respo_css.CssSize::Custom("fit-content(300px)")
  inspect(custom_size.to_string(), content="fit-content(300px)")
}

///|
/// Tests for Enhanced Typography
test "css_font_style" {
  let normal = @respo_css.CssFontStyle::Normal
  inspect(normal.to_string(), content="normal")
  let italic = @respo_css.CssFontStyle::Italic
  inspect(italic.to_string(), content="italic")
  let oblique_no_angle = @respo_css.CssFontStyle::Oblique(None)
  inspect(oblique_no_angle.to_string(), content="oblique")
  let oblique_with_angle = @respo_css.CssFontStyle::Oblique(Some(15.0))
  inspect(oblique_with_angle.to_string(), content="oblique 15deg")
}

///|
test "css_font_variant" {
  let normal = @respo_css.CssFontVariant::Normal
  inspect(normal.to_string(), content="normal")
  let small_caps = @respo_css.CssFontVariant::SmallCaps
  inspect(small_caps.to_string(), content="small-caps")
  let all_small_caps = @respo_css.CssFontVariant::AllSmallCaps
  inspect(all_small_caps.to_string(), content="all-small-caps")
  let petite_caps = @respo_css.CssFontVariant::PetiteCaps
  inspect(petite_caps.to_string(), content="petite-caps")
  let all_petite_caps = @respo_css.CssFontVariant::AllPetiteCaps
  inspect(all_petite_caps.to_string(), content="all-petite-caps")
  let unicase = @respo_css.CssFontVariant::Unicase
  inspect(unicase.to_string(), content="unicase")
  let titling_caps = @respo_css.CssFontVariant::TitlingCaps
  inspect(titling_caps.to_string(), content="titling-caps")
}

///|
test "css_text_transform" {
  let none = @respo_css.CssTextTransform::None
  inspect(none.to_string(), content="none")
  let capitalize = @respo_css.CssTextTransform::Capitalize
  inspect(capitalize.to_string(), content="capitalize")
  let uppercase = @respo_css.CssTextTransform::Uppercase
  inspect(uppercase.to_string(), content="uppercase")
  let lowercase = @respo_css.CssTextTransform::Lowercase
  inspect(lowercase.to_string(), content="lowercase")
  let full_width = @respo_css.CssTextTransform::FullWidth
  inspect(full_width.to_string(), content="full-width")
  let full_size_kana = @respo_css.CssTextTransform::FullSizeKana
  inspect(full_size_kana.to_string(), content="full-size-kana")
}

///|
/// Tests for Modern CSS Features
test "css_container_type" {
  let normal = @respo_css.CssContainerType::Normal
  inspect(normal.to_string(), content="normal")
  let size = @respo_css.CssContainerType::Size
  inspect(size.to_string(), content="size")
  let inline_size = @respo_css.CssContainerType::InlineSize
  inspect(inline_size.to_string(), content="inline-size")
  let block_size = @respo_css.CssContainerType::BlockSize
  inspect(block_size.to_string(), content="block-size")
}

///|
test "css_logical_property" {
  let inline_start = @respo_css.CssLogicalProperty::InlineStart
  inspect(inline_start.to_string(), content="inline-start")
  let inline_end = @respo_css.CssLogicalProperty::InlineEnd
  inspect(inline_end.to_string(), content="inline-end")
  let block_start = @respo_css.CssLogicalProperty::BlockStart
  inspect(block_start.to_string(), content="block-start")
  let block_end = @respo_css.CssLogicalProperty::BlockEnd
  inspect(block_end.to_string(), content="block-end")
}

///|
test "css_aspect_ratio" {
  let auto = @respo_css.CssAspectRatio::Auto
  inspect(auto.to_string(), content="auto")
  let ratio = @respo_css.CssAspectRatio::Ratio(16.0, 9.0)
  inspect(ratio.to_string(), content="16 / 9")
  let value = @respo_css.CssAspectRatio::Value(1.5)
  inspect(value.to_string(), content="1.5")
}

///|
test "css_scroll_behavior" {
  let auto = @respo_css.CssScrollBehavior::Auto
  inspect(auto.to_string(), content="auto")
  let smooth = @respo_css.CssScrollBehavior::Smooth
  inspect(smooth.to_string(), content="smooth")
}

///|
test "css_resize" {
  let none = @respo_css.CssResize::None
  inspect(none.to_string(), content="none")
  let both = @respo_css.CssResize::Both
  inspect(both.to_string(), content="both")
  let horizontal = @respo_css.CssResize::Horizontal
  inspect(horizontal.to_string(), content="horizontal")
  let vertical = @respo_css.CssResize::Vertical
  inspect(vertical.to_string(), content="vertical")
  let block = @respo_css.CssResize::Block
  inspect(block.to_string(), content="block")
  let inline = @respo_css.CssResize::Inline
  inspect(inline.to_string(), content="inline")
}

///|
/// Tests for RespoStyle with new CSS features
test "respo_style_grid_layout" {
  let grid_style = @respo_css.respo_style(
    display=@respo_css.CssDisplay::Grid,
    grid_template_columns=@respo_css.CssGridTemplateColumns::Fr([1.0, 2.0, 1.0]),
    grid_template_rows=@respo_css.CssGridTemplateRows::Repeat(
      3,
      @respo_css.CssSize::Auto,
    ),
    gap=@respo_css.CssSize::Px(20.0),
    justify_items=@respo_css.CssJustifyItems::Center,
    align_items_grid=@respo_css.CssAlignItems::Stretch,
  )
  inspect(grid_style.is_empty(), content="false")
  inspect(grid_style.length(), content="6")
}

///|
test "respo_style_animation" {
  let animation_style = @respo_css.respo_style(
    animation_name="fadeIn",
    animation_duration=@respo_css.CssDuration::S(2.0),
    animation_timing_function=@respo_css.CssTimingFunction::Ease,
    animation_direction=@respo_css.CssAnimationDirection::Alternate,
    animation_fill_mode=@respo_css.CssAnimationFillMode::Both,
    animation_play_state=@respo_css.CssAnimationPlayState::Running,
    animation_iteration_count="infinite",
  )
  inspect(animation_style.is_empty(), content="false")
  inspect(animation_style.length(), content="7")
}

///|
test "respo_style_enhanced_typography" {
  let typography_style = @respo_css.respo_style(
    font_style=@respo_css.CssFontStyle::Italic,
    font_variant=@respo_css.CssFontVariant::SmallCaps,
    text_transform_enhanced=@respo_css.CssTextTransform::Capitalize,
    font_size=18,
  )
  inspect(typography_style.is_empty(), content="false")
  inspect(typography_style.length(), content="4")
}

///|
test "respo_style_modern_features" {
  let modern_style = @respo_css.respo_style(
    aspect_ratio=@respo_css.CssAspectRatio::Ratio(16.0, 9.0),
    scroll_behavior=@respo_css.CssScrollBehavior::Smooth,
    resize=@respo_css.CssResize::Both,
    container_type=@respo_css.CssContainerType::InlineSize,
    container_name="sidebar",
  )
  inspect(modern_style.is_empty(), content="false")
  inspect(modern_style.length(), content="5")
}

///|
test "respo_style_extended_sizes" {
  let extended_style = @respo_css.respo_style(
    width_extended=@respo_css.CssSize::Function(
      @respo_css.CssFunction::Clamp(
        @respo_css.CssSize::Px(200.0),
        @respo_css.CssSize::Vw(50),
        @respo_css.CssSize::Px(800.0),
      ),
    ),
    height_extended=@respo_css.CssSize::Dvh(100.0),
    margin_extended=@respo_css.CssSize::Ch(2.0),
    padding_extended=@respo_css.CssSize::Fr(1.0),
  )
  inspect(extended_style.is_empty(), content="false")
  inspect(extended_style.length(), content="4")
}

///|
/// Complex integration tests
test "respo_style_complex_grid_layout" {
  let complex_grid = @respo_css.respo_style(
    display=@respo_css.CssDisplay::Grid,
    grid_template_columns=@respo_css.CssGridTemplateColumns::Custom(
      "repeat(auto-fit, minmax(250px, 1fr))",
    ),
    grid_template_rows=@respo_css.CssGridTemplateRows::Sizes([
      @respo_css.CssSize::Auto,
      @respo_css.CssSize::Fr(1.0),
      @respo_css.CssSize::Auto,
    ]),
    gap=@respo_css.CssSize::Px(16.0),
    justify_items=@respo_css.CssJustifyItems::Stretch,
    align_items_grid=@respo_css.CssAlignItems::Start,
    padding=@respo_css.CssSize::Px(24.0),
    background_color=@respo_css.CssColor::Hex(248, 249, 250),
  )
  inspect(complex_grid.is_empty(), content="false")
  inspect(complex_grid.length(), content="8")
}

///|
test "respo_style_responsive_design_with_contained" {
  let responsive_style = @respo_css.respo_style(
    width_extended=@respo_css.CssSize::Function(
      @respo_css.CssFunction::Min([
        @respo_css.CssSize::Percent(100.0),
        @respo_css.CssSize::Px(1200.0),
      ]),
    ),
    margin_extended=@respo_css.CssSize::Function(
      @respo_css.CssFunction::Var(
        "container-margin",
        Some(@respo_css.CssSize::Auto),
      ),
    ),
    padding_extended=@respo_css.CssSize::Function(
      @respo_css.CssFunction::Clamp(
        @respo_css.CssSize::Px(16.0),
        @respo_css.CssSize::Vw(4),
        @respo_css.CssSize::Px(32.0),
      ),
    ),
    font_size=18,
    line_height=@respo_css.CssLineHeight::Em(1.6),
    container_type=@respo_css.CssContainerType::InlineSize,
  )
  inspect(responsive_style.is_empty(), content="false")
  inspect(responsive_style.length(), content="6")
}

///|
test "respo_style_animation_complex" {
  let complex_animation = @respo_css.respo_style(
    animation_name="slideInFadeOut",
    animation_duration=@respo_css.CssDuration::Ms(750),
    animation_timing_function=@respo_css.CssTimingFunction::EaseInOut,
    animation_delay=@respo_css.CssDuration::Ms(200),
    animation_direction=@respo_css.CssAnimationDirection::AlternateReverse,
    animation_fill_mode=@respo_css.CssAnimationFillMode::Forwards,
    animation_iteration_count="3",
    transform=@respo_css.CssTransform::Translate(0, -20),
    opacity=0.0,
  )
  inspect(complex_animation.is_empty(), content="false")
  inspect(complex_animation.length(), content="9")
}
