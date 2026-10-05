# hkustgz-typst-thesis-template

HKUST (GZ) Typst thesis template, LYC's variant.

## Typst Usage

### Preparation

- Install [Typst](https://github.com/typst/typst).
- Install [VSCode](https://code.visualstudio.com/).
- Install [Tinymist Typst VSCode Extension](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist).
- Install [Typst Companion VSCode Extension](https://marketplace.visualstudio.com/items?itemName=CalebFiggers.typst-companion).

### Compilation

- Open project root directory as a project with VSCode.
- Open file `./thesis/thesis.typ`.
- Click "Show exported PDF" in the top-right corner to compile.
  - If you use a command-line interface, you can compile with command `typst compile --root <path-> <path->/thesis/thesis.typ` where `<path->` is `<path-to-this-repository>`.
- Edit `*.typ` and `*.bib` files to add custom contents.

### Notes

- The cause of `error: array index out of bounds (index: 0, len: 0) and no default value was specified @preview/alexandria:0.2.2\src\state.typ:117:20 help: error occurred in this call of function get-citation @preview/alexandria:0.2.2\src\lib.typ:19:32` is 2 or more invocations of `#show: alexandria(prefix: "bib-", read: path => read(path))` throughout the project.
  - :warning: You need to make sure that for each `prefix`, you should **only invoke `#show: alexandria(prefix: prefix, read: path => read(path))` for once** throughout the project, no matter if the invocation is explicit or implicit.
  - For the same `prefix`, multiple invocations of `#show: alexandria(prefix: prefix, read: path => read(path))` can occur implicitly in composite `show` rule applications.

### Upstream Templates

- [@HKFoggyU, hkust-thesis-typst](https://github.com/HKFoggyU/hkust-thesis-typst)
  - Permitted to use under the [LPPL-1.3c License](https://www.latex-project.org/lppl/lppl-1-3c.txt).

## Copyright
### Textual and Code Contents

```
Copyright (C) 2026 Yucheng Liu. Under the AGPL 3.0 License.
AGPL 3.0 License: https://www.gnu.org/licenses/agpl-3.0.txt .
```

- [The AGPL 3.0 License.](./license)

### Non-textual or Non-code Contents

```
Copyright (C) 2026 Yucheng Liu. Under the CC-BY-SA 4.0 License.
CC-BY-SA 4.0 License: https://creativecommons.org/licenses/by-sa/4.0/legalcode.txt .
```

- [The CC-BY-SA 4.0 License.](./license-2)
