///|
test "enhanced css properties" {
  let style = @respo_css.respo_style(
    border_radius_obj=@respo_css.CssBorderRadius::new(
      top_left=@respo_css.CssSize::Px(10.0),
      bottom_right=@respo_css.CssSize::Px(5.0),
    ),
    box_shadow_obj=@respo_css.CssBoxShadow::new(
      x=@respo_css.CssSize::Px(2.0),
      y=@respo_css.CssSize::Px(2.0),
      blur=@respo_css.CssSize::Px(4.0),
      color=@respo_css.CssColor::Black,
    ),
    background_image=@respo_css.CssBackgroundImage::LinearGradient(
      @respo_css.CssGradient::Linear(
        Some(@respo_css.CssGradientAngle::Deg(45)),
        [
          @respo_css.CssGradientStop::new(@respo_css.CssColor::Red),
          @respo_css.CssGradientStop::new(@respo_css.CssColor::Blue),
        ],
      ),
    ),
  )
  inspect(
    style,
    content="border-top-left-radius:10px; border-bottom-right-radius:5px; box-shadow:2px 2px 4px black; background-image:linear-gradient(45deg, red, blue); ",
  )
}

///|
test "keyframes" {
  let kf = @respo_css.CssKeyframes::new("fade-in", [
    @respo_css.CssKeyframe::new(0, [("opacity", "0")]),
    @respo_css.CssKeyframe::new(100, [("opacity", "1")]),
  ])
  inspect(
    kf.to_css_string(),
    content=(
      #|@keyframes fade-in {
      #|  0% {
      #|    opacity: 0;
      #|  }
      #|  100% {
      #|    opacity: 1;
      #|  }
      #|}
      #|
    ),
  )
}
