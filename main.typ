#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)
#show figure.caption: emph

#set text(size: 14pt)
#set page(width: 20cm, height: auto, margin: 1.5cm)
#set heading(numbering: "1.")

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain("corollary", "Corollary", base: "theorem", titlefmt: strong)
#let definition = thmbox("definition", "Definition")
#let proposition = thmbox("proposition", "Proposition")

#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#outline(indent: auto)
#pagebreak()

= What is asymptotic notation?
In computer science and related disciplines, asymptotic notation describes the
behavior of a function as its input size (often denoted by n) tends towards
infinity. It focuses on the dominant terms that influence the function's growth
rate, ignoring constant factors and lower-order terms.

= Why use asymptotic notation?
It allows researchers to compare and evaluate algorithms' efficiency without
getting bogged down by specific hardware or implementation details. By focusing
on asymptotic behavior, researchers can make general statements about how well
algorithms scale with increasing input sizes.

#pagebreak()

= Types of asymptotic notation

== Big O notation ($O$-notation)
$O$-notation provides an asymptotic *upper bound*.
#figure(image("img/big-O.png", width: 10cm), caption: $f(n) = O(g(n))$)
#definition[
    $ O(g(n)) := { f(n): exists c, n_0 > 0 "such that" 0 <= f(n) <= c g(n)", " forall n >= n_0} $
]
#definition[
    $ f(n) := O(g(n)) arrow.l.r.double f(n) in O(g(n)) $
]
#example[
    $ln(n) = O(n)$
]

== Big Omega notation ($Omega$-notation)
$Omega$-notation provides an asymptotic *lower bound*.
#figure(image("img/big-Omega.png", width: 10cm), caption: $f(n) = Omega(g(n))$)
#definition[
    $ Omega(g(n)) := { f(n): exists c, n_0 > 0 "such that" 0 <= c g(n) <= f(n)", " forall n >= n_0} $
]
#definition[
    $ f(n) := Omega(g(n)) arrow.l.r.double f(n) in Omega(g(n)) $
]
#example[
    $n^2 + n = Omega(n^2)$
]

== Theta notation ($Theta$-notation)
$Theta$-notation provides an asymptotic *tight bound*.
#figure(image("img/Theta.png", width: 10cm), caption: $f(n) = Theta(g(n))$)
#definition[
    $ Theta(g(n)) := { f(n): exists c_1, c_2, n_0 > 0 "such that" 0 <= c_1 g(n) <= f(n) <= c_2 g(n)", " forall n >= n_0} $
]
#definition[
    $ f(n) := Theta(g(n)) arrow.l.r.double f(n) in Theta(g(n)) $
]
#example[
    $Theta(n^2) = n^2$
]

== Little o notation ($o$-notation)
$o$-notation denotes an *upper bound* that is *not asymptotically tight*
#definition[
    $ o(g(n)) := { f(n): forall epsilon > 0: exists n_0 > 0 "such that" 0 <= f(n) < epsilon g(n)", " forall n >= n_0 } $
]
#proposition[
    $
        g(n) > 0 => o(g(n)) = { f(n): f(n) >= 0 "and "lim_(n -> infinity) f(n)/g(n) = 0}.
    $
]
#definition[
    $ f(n) := o(g(n)) arrow.l.r.double f(n) in o(g(n)) $
]
#example[
    $ln(n) = o(n)$
]

== Little omega notation ($omega$-notation)
$omega$-notation denotes an *lower bound* that is *not asymptotically tight*
#definition[
    $ omega(g(n)) := { f(n): forall epsilon > 0: exists n_0 > 0 "such that" 0 <= epsilon g(n) < f(n)", " forall n >= n_0 } $
]
#definition[
    $ f(n) := omega(g(n)) arrow.l.r.double f(n) in omega(g(n)) $
]
#proposition[
    $
        f(n) := omega(g(n)) => lim_(n -> infinity) f(n)/g(n) = infinity ", if the limit exists."
    $
]
#example[
    $n^2 = omega(n)$
]

#pagebreak()

= Properties
== Transitivity
#block[$ \
        & f(n) = Theta(g(n)) " and " g(n) = Theta(h(n)) => f(n) = Theta(h(n)) \
        & f(n) = O(g(n)) " and " g(n) = O(h(n)) => f(n) = O(h(n)) \
        & f(n) = Omega(g(n)) " and " g(n) = Omega(h(n)) => f(n) = Omega(h(n)) \
        & f(n) = o(g(n)) " and " g(n) = o(h(n)) => f(n) = o(h(n)) \
        & f(n) = omega(g(n)) " and " g(n) = omega(h(n)) => f(n) = omega(h(n)) $]
== Reflexivity
#block[$ \
        & f(n) = Theta(f(n)) \
        & f(n) = O(f(n)) \
        & f(n) = Omega(f(n))$]
== Symmetry
$f(n) = Theta(g(n)) arrow.l.r.double g(n) = Theta(f(n))$
== Transpose symmetry
#block[$ \
        & f(n) = O(g(n)) arrow.l.r.double g(n) = Omega(f(n)) \
        & f(n) = o(g(n)) arrow.l.r.double g(n) = omega(f(n)) $]
== Some useful identities
#block[$ \
        & Theta(Theta(f(n))) = Theta(f(n)) \
        & Theta(f(n)) + O(f(n)) = Theta(f(n)) \
        & Theta(f(n)) + Theta(g(n)) = Theta(f(n)+g(n)) \
        & Theta(f(n)) dot Theta(g(n)) = Theta(f(n) dot g(n)) $]

= Common types of asymptotic bound
#block[$ \
        & p(n) := sum_(k=0)^(d) a_k n^k", " forall k >= 0: a_k > 0\
        & "1. " p(n) = O(n^k)", " forall k >= d \
        & "2. " p(n) = Omega(n^k)", " forall k <= d \
        & "3. " p(n) = Theta(n^k)"if " k = d \
        & "4. " p(n) = o(n^k)", " forall k > d \
        & "5. " p(n) = omega(n^k)", " forall k < d $]
#block[$ \
        & n! = sqrt(2 pi n) (n/e)^n (1 + Theta(1/n)) \
        & log(n!) = Theta(n log(n)) $]

#pagebreak()

= Methods for proving asymptotic bounds
== Using definitions
#example[
    $
        ln(n) <= n ", " forall n >= 1 " " (c = 1", " n_0 = 1)\
        => ln(n) = O(n)
    $
]
#example[
    $
        0 <= n^2 <= n^2 + n ", " forall n >= 1 " " (c = 1", " n_0 = 1) \
        => n^2 + n = Omega(n^2)
    $
]
#example[
    $
        0 <= n^2 <= n^2 + n <= 2 n^2", " forall n >= 1 " " (c_1 = 1", " c_2 = 2", " n_0 = 1)\
        => Theta(n^2) = n^2
    $
]
#example[
    $
        cases(
            reverse: #true, ln(n) >= 0", " forall n >= 1, lim_(n arrow infinity) ln(n)/n = lim_(n -> infinity) 1/n = 0,

        )
        => ln(n) = o(n)
    $
]
#example[
    $
        forall epsilon > 0: 0 <= epsilon n < n^2 ", " forall n >= epsilon + 1 " " (n_0 = epsilon + 1)\
        => n^2 = omega(n)
    $
]
== Substitution method
The substitution method comprises two steps:
- Guess the form of the solution using symbolic constants.
- Use mathematical induction to show that the solution works, and find the
    constants.
This method is powerful, but it requires experience and creativity to make a
good guess.

#example[
    $ T(n) := cases(
        Theta(1)", " forall n: 4 > n >= 2, T(floor(n/2)) + d " " (d > 0) ", " forall n >= 4,

    ) $
    #block(
        inset: (x: 1.2em),
    )[
        To guess the solution easily, we will assume that: $T(n) = T(n/2) + d$ \
        $
            T(n) &= T(n/2) + d \
                 &= T(n/4) + 2d \
                 &= T(n/2^k) + (k-1)d \
                 &= T(c) + (log(n/c) - 1)d \
                 &= d log(n) + (T(c) - log(c) - d)
        $ \
        So we will make a guess: $T(n) = O(log(n))$
    ]
    #block(inset: (x: 1.2em))[
        Define $c := max{T(2), T(3), d}$\
        Assume $T(n) <= c log(n) ", " forall n: k > n$ \
        $
            T(k) &= T(floor(k/2)) + d \
                 &<= c log(floor(k/2)) + d \
                 &<= c log(k/2) + d \
                 &<= c log(k) - c + d \
                 &<= c log(k)" (1)"
        $ \
        $ T(n) <= c log(n) forall n: 4 > n >= 2 " (2)" $\
        From (1), (2) $ => T(n) = O(log(n))$
    ]
]
== Master theorem
#theorem(
    "Master theorem",
)[ \

    $ T(n) := a T(n/b) + f(n) $
    #text(style: "italic")[where:]
    #block(inset: (x: 1.2em, y: 0em))[
        - $a > 0$ \
        - $b > 1$ \
        - $exists n_0 > 0: f(n) > 0", " forall n >= n_0$
    ] \ \
    $
        => T(n) = cases(
            Theta(n^(log_b a))", if " exists epsilon > 0: f(n) = O(n^(log_b a - epsilon )), Theta(n^(log_b a) log(n)^(k+1))", if " exists k >= 0: f(n) = Theta(n^(log_b a) log(n)^k), Theta(f(n))", if " cases(
                exists epsilon > 0: f(n) = Omega(n^(log_b a + epsilon )), exists n_0 > 0", " c < 1 :a f(n/b) <= c f(n)", " forall n >= n_0,

            ),

        )
    $ ] <master_theorem>
#example[
    Solve the recurrence for merge sort: $T(n) = 2T(n/2) + Theta(n)$ \ \
    We have $f(n) = Theta(n) = Theta(n^(log_2 2) log(n)^0)$, hence $T(n) = Theta(n^(log_2 2) log(n)^1) = Theta(n log(n))$ (according
    to $2^"nd"$ case of @master_theorem)
]
== Akra-Bazzi method
#theorem("Akra-Bazzi method")[ \
    $ T(x) := g(x) + sum_(i = 1)^k a_i T(b_i x + h_i (x)) $
    #text(style: "italic")[where:]
    #block(inset: (x: 1.2em, y: 0em))[
        - $a_i > 0", " forall i >= 1$ \
        - $0 < b_i < 1", " forall i >= 1$ \
        - $exists c in NN: abs(g'(x)) = O(x^c)$
        - $abs(h_i (x)) = O(x/log(x)^2)$
    ] \ \
    $ => T(x) = Theta(x^p (1 + integral_1^x g(u)/(u^(p+1)) dif u )) $
    #text(style: "italic")[where:] $sum_(i = 1)^k a_i b_i^p = 1$ ] <akra_bazzi_method>
#example[
    Solve the recurrence: $T(x) = T(x/2) + T(x/3) + T(x/6) + x log(x)$
    $
        |(x log x)'| = |log x + 1| <= x ", "forall x >= 1 \
        => |(g(x))'| = O(x) " (1)"
    $
    $
        |h_i(x)| = 0 = O(x/log(x) ^2) " (2)"
    $
    $
        (1/2) ^ 1 + (1/3) ^ 1 + (1/6) ^1 = 1 " (3)"
    $
    From (1), (2), and (3), we can apply @akra_bazzi_method to get:
    $
        T(x) &= Theta(x (1 + integral_1^x (u log(u))/(u^2) dif u)) \
             &= Theta(x (1 + integral_1^x log(u)/u dif u )) \
             &= Theta(x (1 + 1/2 lr(log(u)^2 bar) ^x_1)) \
             &= Theta(x (1 + 1/2 log(x)^2 )) \
             &= Theta(x + 1/2 x log(x)^2) \
             &= Theta(x log(x)^2) \
    $
]

#pagebreak()

= Finding asymptotic bound of an algorithm
== Exact step-counting analysis
The asymptotic bound of an algorithm can be calculated by following the steps
below:
- Break the program into smaller segments
- Find the number of operations performed in each segment
- Add up all the number of operations, call it T(n)
- Find the asymptotic bound of T(n)

#example[
    Analyze insertion sort \ \
    We have the following analysis: \
    #figure(
        image("img/insertion-sort.png", width: 15cm), caption: "Pseudo code for insertion sort with analysis",
    )
    #text(style: "italic")[where:]
    #block(
        inset: (x: 1.2em, y: 0em),
    )[
        - $c_k$ denotes the cost of $k^"th"$ line\
        - $t_i$ denotes the number of times the while loop test in line 5 is executed for
            given $i$
    ] \ \

    From the analysis, we can see that:
    $
        T(n) &= c_1 n + c_2 (n - 1) + c_4 (n - 1) + c_5 sum_(i = 2)^n t_i \
             &" "" "" "+ c_6 sum_(i = 2)^n (t_i - 1) + c_7 sum_(i = 2)^n (t_i - 1) + c_8 (n - 1)
    $ \ \
    In the best case (when the array is already sorted), we have $t_i = 1$ for all $i$.
    $
        => T(n) &= c_1 n + c_2 (n - 1) + c_4 (n - 1) + c_5 sum_(i = 2)^n 1 \
                &" "" "" "+ c_6 sum_(i = 2)^n (1 - 1) + c_7 sum_(i = 2)^n (1 - 1) + c_8 (n - 1) \
                &= c_1 n + c_2 (n - 1) + c_4 (n - 1) + c_5 n + c_8 (n - 1) \
                &= (c_1 + c_2 + c_4 + c_5 + c_8) n - c_2 - c_4 - c_8 \
        => T(n) &= Omega(n)
    $
    \ \
    In the worst case, we have $t_i = i$ for all $i$.
    $
        => T(n) &= c_1 n + c_2 (n - 1) + c_4 (n - 1) + c_5 sum_(i = 2)^n i \
                &" "" "" "+ c_6 sum_(i = 2)^n (i - 1) + c_7 sum_(i = 2)^n (i - 1) + c_8 (n - 1) \
                &= c_1 n + c_2 (n - 1) + c_4 (n - 1) + c_5 ((n (n + 1))/ 2 - 1) \
                &" "" "" "+ c_6 (n (n - 1))/ 2 + c_7 (n (n - 1))/ 2 + c_8 (n - 1) \
                &= (c_5/2 + c_6/2 + c_7/2) n^2 \
                &" "" "" " + (c_1 + c_2 + c_4 + c_5 / 2 - c_6 / 2 - c_7 / 2 + c_8) n - c_2 - c_4 - c_5 - c_8 \
        => T(n) &= O(n^2)
    $ \ \

    In conclusion, we have $T(n) = Omega(n)$ and $T(n) = O(n^2)$
]

== Recurrence relation
#example[Calculate asymptotic bound of merge sort \ \
    Define $T(n)$ as the running time of the algorithm. \
    From the implementation of merge sort, we have: $T(n) = 2T(n/2) + Theta(n)$
    Applying @master_theorem, we can conclude that $T(n) = Theta(n log(n))$ ($2^"nd"$ case
    with $b = 2$, $a = 2$, $k = 0$) ]

#pagebreak()

= Asymptotic notation and running time
When using asymptotic notation to characterize an algorithm's running time, make
sure that the asymptotic notation used is as precise as possible without
overstating which running time it applies to.
#example[\
    In average case, quick sort runs in $Theta(n log n)$, so it also runs in $O(n^k)", " forall k >= 2$ \
    In the same way, merge sort's running time can be $O(n^l)", " forall l >= 2$ \ \
    Take $k = 2$ and $l = 3$, it's intuitive to conclude that quick sort is faster
    than merge sort for large enough $n$ since $n^2 < n^3$ \
    However, they both have the same asymptotic behavior (both runs in $Theta(n log n)$)
    \ \
    The error occurs due to the inaccuracy of the asymptotic notation used to
    compare 2 algorithms.] \
Asymptotic notations only give a bound for the running time of an algorithm when
n is large enough. Hence, comparing algorithms with asymptotic notation is only
applicable for large enough n.
#example[\
    Linear search's running time is $Theta(n)$ and binary search's running time is $Theta(log n)$ so
    one may attempt to conclude that binary search is faster than linear search for
    all n, which is a *wrong* statement. \
    Consider the following benchmark: ]

#pagebreak()

= References
- https://mitpress.mit.edu/9780262046305/introduction-to-algorithms/
- https://en.wikipedia.org/wiki/Master_theorem_(analysis_of_algorithms)
- https://en.wikipedia.org/wiki/Akra%E2%80%93Bazzi_method
- https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/b6c5cecb1804b69a6ad12245303f2af3_MIT6_042JF10_rec14_sol.pdf
- https://www.geeksforgeeks.org/asymptotic-notations-and-how-to-calculate-them/
- https://www.geeksforgeeks.org/step-count-method-for-time-complexity-analysis/
