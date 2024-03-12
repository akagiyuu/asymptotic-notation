#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

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

= Why use asymptotic notation?

#pagebreak()

= Types of asymptotic notation

== Big O notation ($O$-notation)
$O$-notation provides an asymptotic *upper bound*.
#image("img/big-O.png", width: 10cm)
#definition[
    $O(g(n)) := { f(n): exists c, n_0 > 0 "such that" 0 <= f(n) <= c g(n)", " forall n >= n_0}$.
]
#definition[
    $f(n) := O(g(n)) arrow.l.r.double f(n) in O(g(n))$.
]
#example[
    $ln(n) = O(n)$
]

== Big Omega notation ($Omega$-notation)
$Omega$-notation provides an asymptotic *lower bound*.
#image("img/big-Omega.png", width: 10cm)
#definition[
    $Omega(g(n)) := { f(n): exists c, n_0 > 0 "such that" 0 <= c g(n) <= f(n)", " forall n >= n_0}$.
]
#definition[
    $f(n) := Omega(g(n)) arrow.l.r.double f(n) in Omega(g(n))$.
]
#example[
    $n^2 + n = Omega(n^2)$
]

== Theta notation ($Theta$-notation)
$Theta$-notation provides an asymptotic *tight bound*.
#image("img/Theta.png", width: 10cm)
#definition[
    $Theta(g(n)) := { f(n): exists c_1, c_2, n_0 > 0 "such that" 0 <= c_1 g(n) <= f(n) <= c_2 g(n)", " forall n >= n_0}$.
]
#definition[
    $f(n) := Theta(g(n)) arrow.l.r.double f(n) in Theta(g(n))$.
]
#example[
    $Theta(n^2) = n^2$
]

== Little o notation ($o$-notation)
$o$-notation denotes an *upper bound* that is *not asymptotically tight*
#definition[
    $o(g(n)) := { f(n): forall epsilon > 0: exists n_0 > 0 "such that" 0 <= f(n) < epsilon g(n)", " forall n >= n_0 }$.
]
#proposition[
    $
        g(n) > 0 => o(g(n)) = { f(n): f(n) >= 0 "and "lim_(n -> infinity) f(n)/g(n) = 0}.
    $
]
#definition[
    $f(n) := o(g(n)) arrow.l.r.double f(n) in o(g(n))$.
]
#example[
    $ln(n) = o(n)$
]

== Little omega notation ($omega$-notation)
$omega$-notation denotes an *lower bound* that is *not asymptotically tight*
#definition[
    $omega(g(n)) := { f(n): forall epsilon > 0: exists n_0 > 0 "such that" 0 <= epsilon g(n) < f(n)", " forall n >= n_0 }$.
]
#definition[
    $f(n) := omega(g(n)) arrow.l.r.double f(n) in omega(g(n))$.
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
        & p(n) = sum_(k=0)^(d) a_k n^k", " forall k >= 0: a_k > 0\
        & => p(n) = O(n^k)", " forall k >= d \
        & => p(n) = Omega(n^k)", " forall k <= d \
        & => p(n) = Theta(n^k)"if " k = d \
        & => p(n) = o(n^k)", " forall k > d \
        & => p(n) = omega(n^k)", " forall k < d $]
#block[$ \
        & n! = sqrt(2 pi n) (n/e)^n (1 + Theta(1/n)) \
        & log(n!) = Theta(n log(n)) $]

#pagebreak()

= Methods for proving asymptotic bounds
== Using definitions
#example[
    #block[$ \
            &ln(n) <= n ", " forall n >= 1 " " (c = 1", " n_0 = 1)\
            &=> ln(n) = O(n) $]
]
#example[
    #block[$ \
            &0 <= n^2 <= n^2 + n ", " forall n >= 1 " " (c = 1", " n_0 = 1) \
            &=> n^2 + n = Omega(n^2) $]
]
#example[
    #block[$ \
            &0 <= n^2 <= n^2 + n <= 2 n^2", " forall n >= 1 " " (c_1 = 1", " c_2 = 2", " n_0 = 1)\
            &=> Theta(n^2) = n^2 $]
]
#example[
    #block[$
            cases(
                reverse: #true, ln(n) >= 0", " forall n >= 1, lim_(n arrow infinity) ln(n)/n = lim_(n -> infinity) 1/n = 0,

            )
            => ln(n) = o(n)
        $]
]
#example[
    #block[$ \
            &forall epsilon > 0: 0 <= epsilon n < n^2 ", " forall n >= epsilon + 1 " " (n_0 = epsilon + 1)\
            &=> n^2 = omega(n) $]
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
        $c := max{T(2), T(3), d}$\
        Assume: $T(n) <= c log(n) ", " forall n: k > n$ \
        #block(inset: (x: 0em))[
            $
                T(k) &= T(floor(k/2)) + d \
                     &<= c log(floor(k/2)) + d \
                     &<= c log(k/2) + d \
                     &<= c log(k) - c + d \
                     &<= c log(k)" (1)"
            $
        ] \
        $ T(n) <= c log(n) forall n: 4 > n >= 2 " (2)" $\
        (1), (2) $ => T(n) = O(log(n))$
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
    to 2nd case of @master_theorem)
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
    From (1), (2), and (3), we can apply <akra_bazzi_method> to get:
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

= Finding asymptotic bound of a function in code

#pagebreak()

= References
- https://mitpress.mit.edu/9780262046305/introduction-to-algorithms/
- https://en.wikipedia.org/wiki/Master_theorem_(analysis_of_algorithms)
- https://en.wikipedia.org/wiki/Akra%E2%80%93Bazzi_method#Formulation
- https://ocw.mit.edu/courses/6-042j-mathematics-for-computer-science-fall-2010/b6c5cecb1804b69a6ad12245303f2af3_MIT6_042JF10_rec14_sol.pdf
