# Touying Illinois Tech Theme

Making slides can be time-consuming, especially with conventional GUI software (e.g., Powerpoint, Keynote, Google Slides). Alternatively, text-based solutions (e.g., LaTeX via Beamer or Markdown-based software) can boost ease of rapid slide production. LaTeX---despite its power---struggles being an attractive option because of its verbosity. In contrast, Markdown lacks many necessary features and it renders inconsistently across Markdown readers/editors. *Typst* strikes a fine balance between LaTeX and Markdown. 

This repository is a simple theme, based on the style of Illinois Tech. Feel free to use or customize as much as you please.

## Getting Started

Assuming you wish to use the theme as is, you will first need to download the repository (i.e., `iit-theme.typ` and the images). Then, a simple working version can be implemented as follows:

```typst
#import "@preview/touying:0.7.3": *
#import "iit-theme.typ": *

// Enter Presentation metainformation
#show: iit-theme.with(
  aspect-ratio: "16-9", 
  config-info(
    title: [Introduction to Object-Oriented Programming],
    author: [Bob Smith],
    contact: [bob.smith\@illinoistech.edu]
    institution: [Illinois Institute of Technology],
    subtitle: [CS XXX: Elementary Programming], // optional
    date: datetime(day: 1, month: 1, year: 2026), // will default to TODAY
  ),
)

= Section Name 

== Slide 1 Title
This the text of a slide with bullets:
- bullet 1
- bullet 2
- ...

Math can also be done with Typst's own math language (similar to LaTeX):

$$ f(x) = 3x^2 + 7x + 1 $$

== ...
```