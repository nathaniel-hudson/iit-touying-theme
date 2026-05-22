#import "@preview/touying:0.7.3": *
#import "iit-theme.typ": *

#show: iit-theme.with(
  aspect-ratio: "16-9", 
  config-info(
    title: [Introduction to Object-Oriented Programming],
    subtitle: [CS XXX: Elementary Programming],
    author: [Bob Smith],
    date: datetime(day: 1, month: 1, year: 2026),
    institution: [Illinois Institute of Technology],
    contact: [nhudson5\@illinoistech.edu]
  ),
)

#title-slide()

#focus-slide([Objects])


= Logistic Regression

== First Slide

A _slide_ with a title and an *important* information.

+ Hello world
+ Goodbye!

```python
class Person:
  def __init__(self, name: str, age: int):
    self.name = name 
    self.age = age
```

#pause

=== Federated Averaging

$ omega^(t+1) = sum_(k=1)^(K) n_k/n omega_(k)^(t+1) $

Hello, this is a function: $f(x)$.

== Second Slide 

+ Hello
+ Goodbye!

== Edge Purpose and Definition

#lorem(30)

// - #lorem(17ß)
- #lorem(30)
- #lorem(15)

=== #lorem(12)