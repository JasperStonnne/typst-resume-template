#import "@preview/basic-resume:0.2.9": *
#import "@preview/showybox:2.0.4": showybox

#let sub(it) = {
  v(-.65em)
  it
  v(-.65em)
  line(stroke: (paint: gray, cap: "round", thickness: .5pt), length: 42%)
}

#let awards-list(awards) = {
  set table(stroke: none)
  set text(size: 9pt)
  set align(center)
  table(
    align: (left, center, left),
    columns: (1fr, auto, auto),
    ..for award in awards {
      (award.name, award.level, str(award.date))
    },
  )
}

#let skills-box(title: none, points: (), side: "left") = {
  showybox(
    title-style: (
      weight: 900,
      color: red.darken(40%),
      sep-thickness: 0pt,
      align: center,
    ),
    frame: (
      title-color: rgb("#f2f2f2"),
      border-color: red.darken(40%),
      thickness: if side == "left" { (left: 1pt) } else { (right: 1pt) },
      radius: 0pt,
    ),
    title: title,
  )[
    #for point in points [
      - #point
    ]
  ]
}

// Replace these placeholders with your own details.
#let name = "Your Name"
#let phone = "+00 000 000 0000"
#let location = "City, Country"
#let email = "your.email@example.com"
#let github = "github.com/yourname"
#let personal-site = "yourname.example.com"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#B52323",
  font: ("New Computer Modern", "KaiTi"),
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)

#place(top + right)[
  #block(width: 10%)[
    #text(fill: rgb("#858585"))[
      #block(width: 200pt, stroke: none)[
        #set par(spacing: .5em)
        #smallcaps[Updated 2026]
      ]
    ]
  ]
]

== Education

#edu(
  institution: "Example University",
  location: "City, Country",
  dates: dates-helper(start-date: "Sep 2020", end-date: "Jun 2024"),
  degree: [*Your Major*, Bachelor of Engineering],
  consistent: true,
)
#[
  #set terms(hanging-indent: 0em)
  / Honors: Scholarship, Dean's List
  / Core Courses: Data Structures, Operating Systems, Computer Networks, Database Systems
  / Interests: Distributed Systems, Networking, Storage
]

== Profile Highlights

#{
  set text(font: ("SF Pro", "Hack Nerd Font"), size: 20pt)
  set table(stroke: .0pt, inset: 8pt)
  v(-.6em)
  table(
    columns: for i in range(12) { (1fr,) },
    align: alignment.horizon + center,
    [#h(-4pt)\u{f17c}], [\u{e691}], [\u{e61e}], [\u{e724}],
    [\u{e68b}], [\u{e76d}], [\u{e76e}], [\u{e7f5}],
    [#h(-2pt)\u{e7b0}], [#h(-3pt)\u{e702}], [#h(-3pt)\u{e794}],
    [#set text(size: 15pt); \u{f37f}],
  )
  v(-1.5em)
  set text(size: 7pt, font: "New Computer Modern")
  table(
    columns: for i in range(12) { (1fr,) },
    align: alignment.horizon + center,
    inset: 0em,
    stroke: none,
    [Linux], [Shell], [C], [Go], [Rust], [Redis], [Postgres], [gRPC], [Docker], [Git], [CMake], [Typst],
  )
}

#[
  #set text(size: 8pt)
  #table(
    stroke: none,
    columns: (2fr, 2fr),
    align: center,
    table.vline(x: 1, start: 0, end: 2, stroke: (paint: gray, cap: "round", thickness: .2pt)),
    [#skills-box(title: "Backend Services", side: "left", points: (
      "Design request paths, APIs, and service boundaries in C and Go.",
      "Handle timeouts, retries, and partial failure without hidden state.",
    ))],
    [#skills-box(title: "Systems Engineering", side: "right", points: (
      "Work on Linux services where CPU, memory, and I/O stay predictable.",
      "Use tracing and benchmarks to explain a performance change.",
    ))],
    [#skills-box(title: "Storage & Networking", side: "left", points: (
      "Shape key-value and persistence layouts around recovery and correctness.",
      "Debug packet paths, including RDMA-style links and eBPF probes.",
    ))],
    [#skills-box(title: "Engineering Delivery", side: "right", points: (
      "Ship with tests, reproducible builds, and short operational notes.",
      "Own rollout, measurement, and follow-up after a change lands.",
    ))],
  )
]

== Work Experience

#work(
  company: "Example Technology Co.",
  dates: dates-helper(start-date: "Jul 2024", end-date: "Present"),
  location: "City, Country",
  title: "Backend Engineer",
)

- Designed a Go service that routes requests and stores metadata for internal teams.
- Tuned Redis-backed reads and the persistence path for common queries.
- Automated test and release checks so deploys no longer depended on a manual list.

#work(
  company: "Example Systems Group",
  dates: dates-helper(start-date: "Jun 2023", end-date: "Jun 2024"),
  location: "City, Country",
  title: "Systems Engineering Intern",
)

- Prototyped a Linux networking datapath and recorded throughput under load.
- Wrote recovery notes for a key-value store used by internal services.

== Projects

#project(
  name: "Example KV Store",
  role: "Lead Developer",
  dates: dates-helper(start-date: "2024", end-date: "Present"),
  url: "github.com/yourname/project-one",
)

A small persistent key-value store. Summarize the on-disk layout, crash recovery, and your contribution here.

#project(
  name: "Example Network Toolkit",
  role: "Creator",
  dates: dates-helper(start-date: "2023", end-date: "2024"),
  url: "github.com/yourname/project-two",
)

Utilities for inspecting Linux packet paths, with sample eBPF probes and an RDMA-style transport experiment.

== Competitions and Awards

#awards-list(yaml("awards.yaml"))

== Additional Information

- *Languages:* English, another language
- *Leadership and Activities:* Student organization, open-source community
- *Interests:* Distributed systems, networking, technical writing
