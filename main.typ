#import "@preview/touying:0.7.3": *
#import "iit-theme.typ": *

#show: iit-theme.with(
  aspect-ratio: "16-9", 
  config-info(
    title: [Random Forests],
    subtitle: [CS 480: Introduction to AI],
    author: [Nathaniel Hudson],
    date: datetime.today(),
    institution: [Illinois Institute of Technology],
    contact: [nhudson5\@illinoistech.edu]
  ),
)

#title-slide()

#focus-slide([AI Overview])


= First Section

== First Slide

A _slide_ with a title and an *important* information.

+ Hello world
+ Goodbye!

```rust 
fn main() {
  println!("Hello, world!");
}
```

#pause

=== Federated Averaging

$ omega^(t+1) = sum_(k=1)^(K) n_k/n omega_(k)^(t+1) $

Hello, this is a function: $f(x)$.