# HelpBrowsinator

## A help browser window for IRE games

A tabbed window for browsing HELP, CHELP, GHELP, and AB output in IRE games. I get so tired of trying to scroll back and forth and muddying my logs. the Pop-it! package on the Aetolia discord was pretty good for helping with this, but then I kept thinking of little things I wanted to add and now here we are.

## Installation

You can install HelpBrowsinator through the Package Manager in Mudlet (alt+o to open) or by copying and pasting the following into your Mudlet command line (for older versions of Mudlet)

`lua installPackage("https://github.com/demonnic/HelpBrowsinator/releases/latest/download/HelpBrowsinator.mpackage")`

## Usage

This package aliases over `help`, `ghelp`, `chelp`, and `ab` commands and will open the browser the first time you use one of them.

### Aliases

* `help <optional topic>`
  * Opens the browsinator if it isn't already opened, and runs the help command, redirecting the output to the browsinator.
    * `help time`
* `chelp <optional topic>`
  * Opens the browsinator if it isn't already opened, and runs the chelp command, redirecting the output to the browsinator.
    * `chelp advancement`
* `ghelp <optional topic>`
  * Opens the browsinator if it isn't already opened, and runs the ghelp command, redirecting the output to the browsinator.
    * `ghelp welcome`
* `ab <optional topic>`
  * Opens the browsinator if it isn't already opened, and runs the ab command, redirecting the output to the browsinator.
    * `ab necromancy`
