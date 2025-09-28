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
  inspect(@respo_css.CssSize::Rem(1.2).to_string(), content="1.2000000476837158rem")
  inspect(@respo_css.CssSize::Vw(80).to_string(), content="80vw")
  inspect(@respo_css.CssSize::Vh(90).to_string(), content="90vh")
  inspect(@respo_css.CssSize::Custom("calc(100% - 20px)").to_string(), content="calc(100% - 20px)")
}

///|
test "css_color" {
  inspect(@respo_css.CssColor::Red.to_string(), content="red")
  inspect(@respo_css.CssColor::Green.to_string(), content="green")
  inspect(@respo_css.CssColor::Blue.to_string(), content="blue")
  inspect(@respo_css.CssColor::White.to_string(), content="white")
  inspect(@respo_css.CssColor::Black.to_string(), content="black")
  inspect(@respo_css.CssColor::Transparent.to_string(), content="transparent")
  
  inspect(@respo_css.CssColor::Rgb(255, 128, 64).to_string(), content="rgb(255, 128, 64)")
  inspect(@respo_css.CssColor::Rgba(255, 128, 64, 0.8).to_string(), content="rgba(255, 128, 64, 0.800000011920929)")
  inspect(@respo_css.CssColor::Hsl(120, 50, 75).to_string(), content="hsl(120, 50%, 75%)")
  inspect(@respo_css.CssColor::Hsla(240, 100, 50, 0.5).to_string(), content="hsla(240, 100%, 50%, 0.5)")
  inspect(@respo_css.CssColor::Hex(255, 255, 255).to_string(), content="#255255255")
  inspect(@respo_css.CssColor::RawString("#ff6600").to_string(), content="#ff6600")
}

///|
test "css_display" {
  inspect(@respo_css.CssDisplay::Block.to_string(), content="block")
  inspect(@respo_css.CssDisplay::Inline.to_string(), content="inline")
  inspect(@respo_css.CssDisplay::InlineBlock.to_string(), content="inline-block")
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
  inspect(@respo_css.CssFlexDirection::RowReverse.to_string(), content="row-reverse")
  inspect(@respo_css.CssFlexDirection::Column.to_string(), content="column")
  inspect(@respo_css.CssFlexDirection::ColumnReverse.to_string(), content="column-reverse")
}

///|
test "css_justify_content" {
  inspect(@respo_css.CssFlexJustifyContent::FlexStart.to_string(), content="flex-start")
  inspect(@respo_css.CssFlexJustifyContent::FlexEnd.to_string(), content="flex-end")
  inspect(@respo_css.CssFlexJustifyContent::Center.to_string(), content="center")
  inspect(@respo_css.CssFlexJustifyContent::SpaceBetween.to_string(), content="space-between")
  inspect(@respo_css.CssFlexJustifyContent::SpaceAround.to_string(), content="space-around")
  inspect(@respo_css.CssFlexJustifyContent::SpaceEvenly.to_string(), content="space-evenly")
}

///|
test "css_align_items" {
  inspect(@respo_css.CssFlexAlignItems::FlexStart.to_string(), content="flex-start")
  inspect(@respo_css.CssFlexAlignItems::FlexEnd.to_string(), content="flex-end")
  inspect(@respo_css.CssFlexAlignItems::Center.to_string(), content="center")
  inspect(@respo_css.CssFlexAlignItems::Baseline.to_string(), content="baseline")
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
  inspect(@respo_css.CssTextDecoration::Underline.to_string(), content="underline")
  inspect(@respo_css.CssTextDecoration::Overline.to_string(), content="overline")
  inspect(@respo_css.CssTextDecoration::LineThrough.to_string(), content="line-through")
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
  inspect(@respo_css.CssTransform::Translate(10, 20).to_string(), content="translate(10px, 20px)")
  inspect(@respo_css.CssTransform::TranslateX(15).to_string(), content="translateX(15px)")
  inspect(@respo_css.CssTransform::TranslateY(25).to_string(), content="translateY(25px)")
  inspect(@respo_css.CssTransform::Scale(1.5).to_string(), content="scale(1.5)")
  inspect(@respo_css.CssTransform::Rotate(45).to_string(), content="rotate(45deg)")
  inspect(@respo_css.CssTransform::Skew(10, 20).to_string(), content="skew(10deg, 20deg)")
  inspect(@respo_css.CssTransform::Matrix(1.0, 0.0, 0.0, 1.0, 10.0, 20.0).to_string(), content="matrix(1, 0, 0, 1, 10, 20)")
}

///|
test "css_filter" {
  inspect(@respo_css.CssFilter::None.to_string(), content="none")
  inspect(@respo_css.CssFilter::Blur(5.0).to_string(), content="blur(5px)")
  inspect(@respo_css.CssFilter::Brightness(1.2).to_string(), content="brightness(1.2000000476837158)")
  inspect(@respo_css.CssFilter::Contrast(0.8).to_string(), content="contrast(0.800000011920929)")
  inspect(@respo_css.CssFilter::Grayscale(0.5).to_string(), content="grayscale(0.5)")
  inspect(@respo_css.CssFilter::HueRotate(90.0).to_string(), content="hue-rotate(90deg)")
  inspect(@respo_css.CssFilter::Invert(1.0).to_string(), content="invert(1)")
  inspect(@respo_css.CssFilter::Opacity(0.7).to_string(), content="opacity(0.699999988079071)")
  inspect(@respo_css.CssFilter::Saturate(1.5).to_string(), content="saturate(1.5)")
  inspect(@respo_css.CssFilter::Sepia(0.3).to_string(), content="sepia(0.30000001192092896)")
  inspect(@respo_css.CssFilter::DropShadow(2.0, 2.0, 4.0, Black).to_string(), content="drop-shadow(2px 2px 4px black)")
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
  inspect(@respo_css.CssBoxSizing::ContentBox.to_string(), content="content-box")
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
    height=Px(100.0)
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
    gap=Px(10.0)
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
    z_index=100
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
    padding_right=Px(35.0)
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
    border=border,
    border_radius=5.0,
    box_shadow="2px 2px 4px rgba(0,0,0,0.3)",
    opacity=0.8,
    transform=Scale(1.1)
  )
  
  let style_str = effects_style.to_string()
  inspect(style_str.contains("border:2px dashed green"), content="true")
  inspect(style_str.contains("border-radius:5px"), content="true")
  inspect(style_str.contains("box-shadow:2px 2px 4px rgba(0,0,0,0.3)"), content="true")
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
