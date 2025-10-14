---
title: 'Quadratic Fractals'
date: 2025-10-09T01:15:16+05:30
draft: false
---

> <span style="color: gray;">How to make pretty pictures?</span>

I love fractals! Mostly because I think they look really pretty, but also because they show us how much detail and complexity is hidden even in the simplest math.

Recently, I was trying to learn about heuristic algorithms. These are algorithms that don't always give the best answer, but they are usually much faster and easier to run. I thought that trying to find fractals that are as intricate as possible sounds like a nice problem to try, as it is very hard to go through all possibilities. Here are some samples of the results I managed to get: (Hopefully my color palette isn't too painful to look at)


![very dusty](https://raw.githubusercontent.com/Aaron-d-k/Quadratic-fractals/refs/heads/main/savedfracimg/fractal-1759949466.png "very dusty")
![reminds me of a sea shell](https://raw.githubusercontent.com/Aaron-d-k/Quadratic-fractals/refs/heads/main/savedfracimg/fractal-1759949559.png "reminds me of a sea shell")
![stretchy](https://raw.githubusercontent.com/Aaron-d-k/Quadratic-fractals/refs/heads/main/savedfracimg/fractal-1759949756.png "stretchy")
![boooo](https://raw.githubusercontent.com/Aaron-d-k/Quadratic-fractals/refs/heads/main/savedfracimg/fractal-1759951371.png "boooo")
![somehow looks muscular... lol](https://raw.githubusercontent.com/Aaron-d-k/Quadratic-fractals/refs/heads/main/savedfracimg/fractal-1759950038.png "somehow looks muscular... lol")

These fractals are all part of a family of fractals, very similar to a famous fractal called the 'filled julia set'. To understand what the image shows, we have to choose a function \(f:\mathbb{R}^2 \rightarrow \mathbb{R}^2\) 
$$
f(x,y)=(ax^2+bxy+cy^2+dx+ey,fx^2+gxy+hy^2+ix+jy)
$$
This takes in a point from the X-Y plane and returns another one. We plot the X-Y plane into the image with some scale, then we repeatedly apply this function (i.e. find \(f(f(\cdots f(p)\cdots))\) ) to every point of the image and see what happens.

We shall call the sequence of elements \(f(p),f(f(p)),f(f(f(p))),\cdots \) the 'iterates' of p.

In the preceding images, green represents the points whose iterates converge to zero, black/blue represents the points whose iterates keep getting bigger and red represents those doing neither (as far as the program could calculate). The brightness is how many times \(f\) was applied before the program could determine its behaviour.

The function \(f\) is determined by 10 numbers \(a,\cdots ,j\). It is very hard to find a good set of numbers, as most choices just lead to boring blobs or just emptiness. So, these numbers were determined using an algorithm called simulated annealing, which basically tries to mimic how nature seems to find good solutions by randomly jumping around. The objective it tried to maximise was basically the number of pixel changes at boundaries, i.e, it tried to make the boundary between the two regions as large as possible.

There is a famous family of fractals called [filled julia sets](https://en.wikipedia.org/wiki/Julia_set#Quadratic%20polynomials) which are related to another fractal called the Mandelbrot set. Some filled julia sets are associated with the main heart shaped region (i.e. cardioid) of the Mandelbrot set. It is interesting that these are a subset of our family of fractals, but they tend to look very different.

You can find the code I used to create these images [here](https://github.com/Aaron-d-k/Quadratic-fractals/tree/main). You can run it to try and create more such fractals (Also, it allows you to zoom in and out). I thought of embedding it here using emscripten, but it ends up being insanely slow on web.

Some interesting technical challenges I faced:
- I actually considered the more general 12 parameter functions with constant terms too. This includes famous fractals like the Hénon map. But I encountered a frustrating issue where there would be fractals that seemed to look intricate to my SA due to the limited number of iterations, but were actually just empty because there wasn't any attractor (i.e. all the points were black)! Another issue was that there was no fast way to determine convergence other than waiting and hoping everything else goes off to infinity. To fix these, I just decided to limit myself to functions with a fixed point at 0.

- How to determine if a point is going to converge to zero?
We can find out if points close to 0 always tend to get closer by calculating something called the [Jacobian matrix](https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant) of the map at 0. If all the eigenvalues of this matrix satisfy \(|\lambda|<1\), then it is attracting. The reason this works is actually pretty clever, the idea is that near the fixed point, the function behaves like its Jacobian. You can usually decompose any vector as the sum of two eigenvectors and If all the eigenvectors contract due to the mapping, it is apparent that their sum should also go to zero. 

- Using the previous proof to find a lower bound for the radius of the region where all points definitely converge to 0 is not trivial. You have to take care of the fact that even though the function might be squishing points towards 0 overall, it could temporarily cause some nearby points to go farther and take this into account when bounding the quadratic terms.

- Some fractals looked too ugly and dusty. I tried fixing it using a Gaussian blur, but that just made it look smudged. After trying a few techniques I felt that median blur seemed to look best.

This family of maps actually includes a lot of fractals called [strange attractors](https://en.wikipedia.org/wiki/Attractor#Strange_attractor) and what appears to be non-chaotic ring-shaped attractors but due to how my visualization works, you unfortunately cannot truly appreciate their beauty here. I actually want to try and explore the ring attractors and how they deform into strange attractors as the parameters continuously change, because that is something I have never seen before. 

<hr />

*Edited (Oct 14): Improved wording*