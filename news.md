# coursehand 0.3.1

## Enhancement

+ Added support for new stream codes.


# coursehand 0.3.0

## Enhancement

+ Added `check_links()` and `get_links_from_html()` functions for checking responses from vectors of URL links, and extracting links from html files, respectively.

+ `check_module_list()` is now documented and exported.

+ `check_module_list()` performs checks for the existence of URLs to module pages, and checks on responses from URLs to module pages.

+ Added `check_book_links()` for checking responses from the various URL links in the html versions of the handbooks.

# coursehand 0.2.6

## Bug fix

* fixed a bug where modules with no links would be printed with an empty link.

# coursehand 0.2.5

## Bug fix

+ fixed a bug where `compile_book()` would not include the specified common sections for `"external"`.


# coursehand 0.2.4

## Bug fix

+ fixed a bug where `compile_book()` would not include the common sections for `"msc"` if that was called after another course.

# coursehand 0.2.3

## Enhancement

+ non-exported `check_module_list()` gets `modules_with_differences` argument for modules to ignore.

# coursehand 0.2.2

## Enhancement

+ `compile_book()` now supports the "intercalated" handbook.

# coursehand 0.2.1

## Bug fix

Each handbook is expected to have a distinct _bookdown.yml in its `Rmd/` directory.

# coursehand 0.2

## Enhancement

+ `compile_book()` now supports the "external" handbook.

# coursehand 0.1.9

## Enhancement

+ Added `compile_book()` method for compiling handbooks using **bookdown**.

# coursehand 0.1.8

## Enhancement

+ Added support for BSc and MSc specific common files (using "-BSc" and "-MSc" suffix to the Rmd name in common)

# coursehand 0.1.7

## Enhancement

+ Added support for the MSc handbook

# coursehand 0.1.6

## Bug fix

+ Fixed a bug in `print()` method for `module_list` objects, where a hard-to-decipher error would be produced if the object had not modules

# coursehand 0.1.5

## Enhancement

+ Added `keep_URL` argument to the `print()` method for `"module_list"` objects

# coursehand 0.1.4

## Enhancement

+ Added more checks in the non-exported `coursehand:::check_module_list()`, and a print method for its output


# coursehand 0.1.3

## Enhancement

+ Added `type = "word_cloud"` in `summary.module_list()`

# coursehand 0.1.2

## Enhancement
+ Added new tests in `check_module_lists` (not exported)

# coursehand 0.1.1

## Enhancement
* If module is suspended and has URL no link is added

# coursehand 0.1

* First public release
