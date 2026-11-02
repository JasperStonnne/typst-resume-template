#import "@preview/basic-resume:0.2.9": *
#import "@preview/showybox:2.0.4": showybox

#let sub(
  it,
) = {
  v(-.65em)
  it
  v(-.65em)
  line(stroke: (paint: gray, cap: "round", thickness: .5pt), length: 42%)
}


#let awards-list(awards) = {
  // set table(stroke: 1pt)
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

// Fictional sample. Replace these placeholders before you publish.
#let name = "Alex Chen"
#let phone = "+00 000 000 0000"
#let location = "City, Country"
#let email = "alex.chen@example.com"
#let github = "github.com/alexchen-dev"
#let linkedin = none
#let personal-site = "alexchen-dev.example.com"

#show: resume.with(
  author: name,
  // All the lines below are optional.
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: location,
  email: email,
  github: github,
  // linkedin: linkedin,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#B52323",
  font: ("New Computer Modern", "KaiTi"),
  paper: "a4",
  author-position: left,
  personal-info-position: left,
)



/*
 * Lines that start with == are formatted into section headings
 * You can use the specific formatting functions if needed
 * The following formatting functions are listed below
 * #edu(dates: "", degree: "", gpa: "", institution: "", location: "")
 * #work(company: "", dates: "", location: "", title: "")
 * #project(dates: "", name: "", role: "", url: "")
 * #extracurriculars(activity: "", dates: "")
 * There are also the following generic functions that don't apply any formatting
 * #generic-two-by-two(top-left: "", top-right: "", bottom-left: "", bottom-right: "")
 * #generic-one-by-two(left: "", right: "")
 */
#place(top + right)[
  #block(width: 10%)[
    #text(fill: rgb("#858585"))[
      #block(width: 200pt, stroke: none)[
        #set par(spacing: .5em)
        #smallcaps[Fall 2026\ ]
      ]
    ]
  ]
]
== Education

#edu(
  institution: "Example University | 985 Project",
  location: "City, Country",
  dates: dates-helper(start-date: "Sep 2025", end-date: "Jun 2029"),
  degree: [*Computer Science*, Bachelor of Engineering],
  consistent: true,
)
#[
  #set terms(hanging-indent: 0em)
  / Honors: Academic Excellence Scholarship, Systems Studio Student Lead
  / Core Courses: Computer Organization, Data Structures, Operating Systems, Computer Networks, Database Systems, Distributed Systems, Computer Architecture, Compilers
  / Interests: Storage engines, networked systems, backend infrastructure
]


== Profile Highlights
#{
  set text(font: ("SF Pro", "Hack Nerd Font"), size: 20pt)
  set table(stroke: .0pt, inset: 8pt)
  v(-.6em)
  table(
    columns: for i in range(14) { (1fr,) },
    align: alignment.horizon + center,

    [#h(-4pt)\u{f17c}], // Linux
    [\u{e691}], // Shell
    [#h(-4pt)\u{e61e}], // C
    [#h(-2pt)\u{e724}], // Go
    [#h(-5pt)\u{e68b}], // Rust
    [#h(-5pt)\u{e73c}], // Python
    [#h(-2pt)\u{e76d}], // Redis
    [#h(-2pt)\u{e76e}], // Postgres
    [#h(-2pt)\u{e7b0}], // Docker
    [#h(-3pt)\u{e702}], // Git
    [#h(-3pt)\u{e794}], // CMake
    [#h(-2pt)\u{e776}], // Nginx
    [#h(-2pt)\u{e7c4}], // SQLite
    [#set text(size: 15pt); \u{f37f}], // Typst
  )
  v(-1.5em)
  set text(size: 7pt, font: "New Computer Modern")
  table(
    columns: for i in range(14) { (1fr,) },
    align: alignment.horizon + center,
    inset: 0em,
    stroke: none,
    [Linux], [Shell], [C], [Go], [Rust], [Python], [Redis], [Postgres], [Docker], [Git], [CMake], [Nginx], [SQLite], [Typst],
  )
}


#[
  #set text(size: 8pt)
  #table(
    stroke: none,
    columns: (2fr, 2fr),
    align: center,
    table.vline(x: 1, start: 0, end: 2, stroke: (paint: gray, cap: "round", thickness: .2pt)),

    [#skills-box(
      title: "Backend",
      side: "left",
      points: (
        "Design small Go services with explicit timeouts, structured logs, and narrow HTTP surfaces.",
        "Keep handlers thin and push storage, cache, and retry policy into modules that can be tested alone.",
        "Add integration tests that restart the process and check which acknowledged writes are still readable.",
      ),
    )],
    [#skills-box(
      title: "Systems",
      side: "right",
      points: (
        "Read and change C and Go around processes, files, sockets, and straightforward concurrency.",
        "Use Linux tooling to inspect file descriptors, latency, and resource limits while debugging.",
        "Prefer direct interfaces and visible failure paths over hidden shared state.",
      ),
    )],
    [#skills-box(
      title: "Storage & Networking",
      side: "left",
      points: (
        "Build a write-ahead log, a RESP-compatible command subset, and a primary-replica sketch in a course KV store.",
        "Trace socket lifetimes with generic eBPF probes and describe an RDMA-style register, post, and complete path without a vendor SDK.",
        "Reason about retries, backpressure, and which index a replica can safely acknowledge.",
      ),
    )],
    [#skills-box(
      title: "Engineering Delivery",
      side: "right",
      points: (
        "Keep lab builds reproducible with CMake, containers, and a short script checked into the repo.",
        "Write the interface, the benchmark command, and the rollback step next to the code they describe.",
        "Review changes for operability: config keys, a metric that should move, and a way to tell a deploy failed.",
      ),
    )],
  )
]

== Work Experience

#work(
  title: "Systems Maintainer",
  location: "City, Country",
  company: "Example University Systems Group",
  dates: dates-helper(start-date: "Sep 2025", end-date: "Present"),
)
- Maintain a shared Linux lab image and a container build used for storage and networking coursework.
- Reproduced the course key-value benchmark steps so classmates can compare results across machines.
- Documented build, load, and metrics commands in the group repository.

#work(
  title: "Backend Intern",
  location: "City, Country",
  company: "Example Systems Co.",
  dates: dates-helper(start-date: "Jun 2026", end-date: "Aug 2026"),
)
- Implemented a Go cache in front of an internal metadata service, with per-request timeouts and structured logs.
- Added an integration test that stops the process during a write and checks which keys remain readable after restart.
- Left a one-page runbook for the team: config keys, metrics worth watching, and how to roll a build back.

#pagebreak()
== Projects
#project(
  role: "Lead Developer",
  name: "LumenKV",
  url: "github.com/alexchen-dev/lumenkv",
  dates: dates-helper(start-date: "Feb 2026", end-date: "Present"),
)
#sub[_Example University Systems Studio_]
#v(-7pt)
#text(
  size: 10pt,
)[*A key-value store with write-ahead persistence, a RESP subset, and replication.*]
- Persist acknowledged writes in an append-only log and rebuild the in-memory index from that log after a restart.
- Accept a small RESP-compatible set (`GET`, `SET`, `DEL`) so ordinary Redis clients can talk to the server.
- Forward the log to one replica, and document that a disconnected replica does not advance the acknowledged index.

#v(1em)
#project(
  role: "Lead Developer",
  name: "Packetbench",
  url: "github.com/alexchen-dev/packetbench",
  dates: dates-helper(start-date: "Sep 2025", end-date: "Jan 2026"),
)
#sub[_Example University Coursework_]
#v(-7pt)
#text(
  size: 10pt,
)[*A lab toolkit for socket traces and a vendor-neutral sketch of RDMA-style memory registration.*]
- Attach eBPF probes to TCP connect and close events and export counters for a small local dashboard.
- Model an RDMA-style path as register, post, and complete steps without calling a vendor NIC SDK.
- Record latency for the same payload sizes on the kernel socket path and on the userspace sketch.

#v(1em)
#project(
  role: "Creator",
  name: "Harbor",
  url: "github.com/alexchen-dev/harbor",
  dates: dates-helper(start-date: "Jun 2026", end-date: "Present"),
)
#sub[_Personal Project_]
#v(-7pt)
#text(
  size: 10pt,
)[*A small Go service in front of LumenKV, with config, health checks, and metrics.*]
- Expose an HTTP health route and a thin RESP pass-through used by course demos.
- Read listen addresses, timeouts, and the replica target from a single configuration file.
- Count requests and failed log flushes so a demo board can show whether the process is keeping up.


== Competitions and Awards
#place(dx: 57%, dy: -1.7em)[
  #align(right)[
    #text(size: 8pt, fill: rgb("#858585"))[
      Includes awards from projects I substantially contributed to.
    ]
  ]
]
#awards-list(yaml("awards.yaml"))


== Additional Information
- *Languages:* English (working); Mandarin (reading).
- *Activities:* Example University Systems Reading Group; notes and lab images live in the group repository.
