# kingraph

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/vorburger/kingraph.svg?style=flat-square)](https://codeclimate.com/github/vorburger/kingraph)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/vorburger/kingraph/issues)

> 👪 Plots family trees using JavaScript and Graphviz

A family tree plotter with a very simple syntax. It probably doesn't cover everything [bigger tools](https://gramps-project.org/) do, but covers 90% of it for the sake of simplicity.

![Example Graph](examples/intro.png)

## Getting started

A family tree is a [YAML](http://yaml.org/) file. To get started, store the following text in a file called `family.yaml`:

```yaml
families:
  - parents: [Marge, Homer]
    children: [Bart, Lisa, Maggie]
  - parents: [Lisa, Milhouse]
    children: [Zia]

people:
  Marge:
    fullname: Marjorie Bouvier Simpson
```

Use `kingraph` via Docker to transform this YAML e.g. into a SVG:

```sh
docker build -t kingraph .
docker run --rm -v $(pwd):/data kingraph --format=svg family.yaml >family.svg
open family.svg
```

_TODO: You can also generate a PDF: [This does not work, yet.]_

```sh
docker run --rm -v $(pwd):/data kingraph --format=dot family.yaml | dot -Tpdf -o family.pdf
open family.pdf
```

## Further Examples

Spoiler alerts, view at your own risk :)

<details>
<summary><b>Simpsons</b> (simple)</summary>

Source: *[simpsons.yaml](examples/simpsons.yaml)*

> ![Simpsons Example](examples/simpsons.png)
</details>

<details>
<summary><b>Modern Family</b> (simple with houses)</summary>

Source: *[modernfamily.yaml](examples/modernfamily.yaml)*

> ![Modern Family Example](examples/modernfamily.png)
</details>

<details>
<summary><b>Harry Potter</b> (larger tree)</summary>

Source: *[potter.yaml](examples/potter.yaml)*

> ![Potter Example](examples/potter.png)
</details>

<details>
<summary><b>Game of Thrones</b> (overly complicated)</summary>

Source: *[got.yaml](examples/got.yaml)*

> ![GOT Example](examples/got.png)
</details>

## Documentation

For further reading:

- [Getting started](docs/getting_started.md)
- [Advanced usage](docs/advanced.md)
- [Schema](docs/schema.md)

## Develop

As per the [`Dockerfile`](Dockerfile), you need Node.js, and then in order to locally hack on this code, just do:

    npm install
    bin/kingraph

## Thanks

Authored and initially maintained by Rico Sta. Cruz with help from contributors ([list][contributors]).

> [ricostacruz.com](http://ricostacruz.com) &nbsp;&middot;&nbsp;
> GitHub [@rstacruz](https://github.com/rstacruz) &nbsp;&middot;&nbsp;
> Twitter [@rstacruz](https://twitter.com/rstacruz)

[contributors]: http://github.com/vorburger/kingraph/contributors
