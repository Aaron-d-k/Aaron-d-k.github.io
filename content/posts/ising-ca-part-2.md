---
title: 'The Ising Model and CA, Part II: Thermodynamics in CA'
date: 2025-10-09T15:56:05+05:30
draft: true
---

> <span style="color: gray;"></span>

<sub><sup>*I just re-read my older posts and realized how bad I am at writing for an audience made of people other than myself... I am actively going to try and use less jargon from now on....*</sup></sub>

In the last post, we saw how thermodynamics in general works in CA. Now, we will specifically look at the Ising model.

## The Ising CA
This one is not actually my invention, it has been explored by some of the earliest explorers of cellular automata. It has two states, 'up' and 'down'. The rules are pretty simple:

We will only update a cell if the follwing two conditions are met:
- (x+y+t) is even (i.e. it followes an alternating chessboard pattern)
- The state flips if there are two adjacent up's and two adjacent down's