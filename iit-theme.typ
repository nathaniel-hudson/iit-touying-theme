#import "@preview/touying:0.7.3": *

#let serif-font = ("Source Serif 4", "Source Serif", "Georgia")
#let sans-font = ("Source Sans Pro", "Source Sans", "Arial")

// ========================================================================= //

/**
 * This function implements footer style with a PROGRESS BAR in our slides. 
 */
#let my-footer(self) = {

  let width = self.page.at("width", default: 254mm)   // 254mm = default Touying slide width
  let height = self.page.at("height", default: 143mm)
  let margin = self.page.at("margin")

  // Text footer content
  place(
    right, 
    dx: -margin.x,
    block(
      width: 100%, 
      height: 100%,
      align(
        right + horizon,
        text(
          size: 12pt, 
          font: sans-font,
          weight: "regular",
          fill: self.colors.secondary,
          // utils.display-current-heading(depth: 1)
          context utils.slide-counter.display() + " / " + utils.last-slide-number
        )
      )
    )
  )

  // Progress bar pinned to the bottom
  place(
    bottom, 
    dy: 1pt, // without this, the progress bar roughly *one* pixel above the bottom of the slide
    components.progress-bar(
      height: 3pt,
      self.colors.secondary,        // filled (completed) colour
      self.colors.primary-light,  // unfilled (remaining) colour
    )
  )
}

// ========================================================================= //

#let slide(title: auto, ..args) = touying-slide-wrapper(self => {

  let width = self.page.at("width", default: 254mm)   // 254mm = default Touying slide width
  let height = self.page.at("height", default: 143mm)
  let margin = self.page.at("margin")

  if title != auto {
    self.store.title = title
  }
  
  let header(self) = {
    set align(top)
    show: components.cell.with(fill: self.colors.primary, inset: 1em)
    set align(horizon)
    set text(
      font: serif-font,
      fill: self.colors.neutral-lightest, 
      weight: "bold",
      size: 1.25em,
    )
    set text()
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    } else {
      utils.display-current-heading(level: 2)
    }
    h(1fr)
    text(
      font: sans-font,
      weight: "regular",
      size: 0.75em,
      "(" + utils.display-current-heading(level: 1) + ")"
    )
  }

  let footer = my-footer
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )

  set par(justify: true)

  touying-slide(self: self, setting: body => align(horizon, body), ..args)
})

// ========================================================================= //

#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()

  let width = self.page.at("width", default: 254mm)   // 254mm = default Touying slide width
  let height = self.page.at("height", default: 143mm)
  let margin = self.page.at("margin")

  self = utils.merge-dicts(
    self,
    config-page(
      footer: my-footer,
    ),
  )

  let body = {
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
      dy: (height * 0.5) + 1em,
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

  }
  touying-slide(self: self, body)
})

// ========================================================================= //

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {

  self = utils.merge-dicts(
    self,
    config-page(
      footer: my-footer,
    ),
  )

  let width = self.page.at("width", default: 254mm)   // 254mm = default Touying slide width
  let height = self.page.at("height", default: 143mm)
  let margin = self.page.at("margin")

  let main-body = {
    // Visual Block
    place(
      dx: -margin.x,
      dy: -margin.y,
      block(
        fill: self.colors.primary,
        width: (width + 2 * margin.x) / 3,
        height: (height + 2 * margin.y),
        // inset: (x: 3em, y: 1em),
      )
    )

    // Text Block
    place(
      dx: (-2 * margin.x + width) / 3 + 1em,
      dy: -margin.y,
      block(
        width: (width + 2 * margin.x) / 3 * 2,
        height: (height + 2 * margin.y),
        // stroke: 1pt,
        inset: 2em,
        align(
          left + horizon,
          text(
            font: serif-font,
            fill: self.colors.primary,
            weight: "bold",
            size: 2em,
            utils.display-current-heading(level: 1),
          )
        )
      )
    )

  }
  touying-slide(self: self, main-body)
})

// ========================================================================= //

#let focus-slide(body) = touying-slide-wrapper(self => {

  let width = self.page.at("width", default: 254mm)   // 254mm = default Touying slide width
  let height = self.page.at("height", default: 143mm)
  let margin = self.page.at("margin")
  
  self = utils.merge-dicts(
    self,
    config-page(
      fill: self.colors.primary,
      footer: my-footer,
    ),
  )

  set text(fill: self.colors.neutral-lightest, size: 2em, weight: "bold", font: serif-font)
  touying-slide(
    self: self,
    align(
      center + horizon, 
      body
    )
  )
})

// ========================================================================= //

// #let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
//   let main-body = {
//     set align(center + horizon)
//     set text(size: 2em, fill: self.colors.primary, weight: "bold", style: "italic")
//     utils.display-current-heading(level: 1)
//   }
//   touying-slide(self: self, main-body)
// })

// ========================================================================= //

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
    config-page(
      paper: "presentation-" + aspect-ratio,
      // footer: my-footer,
      // footer-style: (self) => (height: 1.5em),  // give footer room for bar
    ),
    config-common(
      default-preamble: self => {
        set align(horizon)
      },
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-info(
      date: datetime.today(),
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