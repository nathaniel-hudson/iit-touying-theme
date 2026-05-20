#import "@preview/touying:0.7.3": *

#let serif-font = ("Source Serif 4", "Source Serif", "Georgia")
#let sans-font = ("Source Sans Pro", "Source Sans", "Arial")

#let slide(title: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  // set page
  let header(self) = {
    set align(top)
    show: components.cell.with(fill: self.colors.primary, inset: 1em)
    set align(horizon)
    set text(
      font: serif-font,
      fill: self.colors.neutral-lightest, 
      size: .7em,
    )
    utils.display-current-heading(level: 1)
    linebreak()
    set text(size: 1.5em)
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    } else {
      utils.display-current-heading(level: 2)
    }
  }
  let footer(self) = {
    set align(bottom)
    show: components.cell.with(
      fill: self.colors.tertiary, 
      inset: 0.75em,
    )
    set text(fill: self.colors.neutral-darkest, size: .8em)
    utils.call-or-display(self, self.store.footer)
    h(1fr)
    context utils.slide-counter.display() + " / " + utils.last-slide-number
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, ..args)
})


#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()

  let width = self.page.at("width", default: 254mm)   // 254mm = default Touying slide width
  let height = self.page.at("height", default: 143mm)
  let margin = self.page.at("margin")

  let body = {
    set align(left + horizon)

    // Title Block
    place(
      dx: -margin.x,
      dy: -margin.y,
      block(
        fill: self.colors.primary,
        width: width + 2.05 * margin.x,
        height: (height + 2 * margin.y) * 0.5,
        inset: (x: 3em, y: 1em),
        align(
          bottom + left,
          text(
            size: 2em, 
            fill: self.colors.white, 
            font: serif-font,
            weight: "bold", 
            info.title,
          ),
        ),
      )
    )

    // Subtitle Block
    place(
      dy: (height * 0.5) + 2em,
      block(
        fill: self.colors.white,
        if info.subtitle != none { 
          text(
            font: sans-font,
            size: 1.5em,
            weight: "bold",
            info.subtitle,
          )
        }
      )
    )

    // Author and Date Block
    place(
      dy: (height * 0.9),
      block(
        fill: self.colors.white,
        height: height * 0.05,
        if info.subtitle != none { 
          text(
            font: sans-font,
            weight: "regular",
            [#info.author~~$bullet$~~#info.date.display("[month repr:long] [day], [year]")],
          )
        }
      )
    )

    // Illinois Tech Logo
    place(
      dy: (height * 0.9),
      block(
        height: height * 0.05,
        width: 100%,
        align(
          right,
          image("iit_red_logo.png", height: height * 0.05),
        )
      )
    )

    // set text(fill: self.colors.neutral-darkest)
    // if info.subtitle != none {
    //   block(info.subtitle)
    // }
    // if info.author != none {
    //   block(info.author)
    // }
    // if info.date != none {
    //   block(utils.display-info-date(self))
    // }
    // if info.contact != none {
    //   block(info.contact)
    // }
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    set align(center + horizon)
    set text(size: 2em, fill: self.colors.primary, weight: "bold", style: "italic")
    utils.display-current-heading(level: 1)
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: self.colors.primary,
      margin: 2em,
    ),
  )
  set text(fill: self.colors.neutral-lightest, size: 2em)
  touying-slide(self: self, align(horizon + center, body))
})



#let iit-theme(
  aspect-ratio: "16-9",
  footer: none,
  ..args,
  body,
) = {
  set text(
    font: sans-font,
    size: 20pt,
  )

  show: touying-slides.with(
    config-page(paper: "presentation-" + aspect-ratio),
    config-common(
      slide-fn: slide,
    ),
    config-info(
      // title: ["title goes here"]
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: rgb("#CC0000"),
      secondary: rgb("FF9900"),
      tertiary: rgb("#F0F0F0"),
      black: rgb("#000000"),
      gray: rgb("#76777B"),
      white: rgb("FFFFFF"),
    ),
    config-store(
      title: none,
      footer: footer,
    ),
    ..args,
  )

  body
}