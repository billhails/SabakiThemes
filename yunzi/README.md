# Yunzi Theme for Sabaki

A theme with [Yunzi](https://en.wikipedia.org/wiki/Yunzi) stones for [Sabaki](http://sabaki.yichuanshen.de/).
Rendered in [Blender](https://www.blender.org/).

I've used a single consistent HDRI lighting setup for all the components so they should fit together well. The stones
are rendered on the board but while rendering the stones the board is set to "PassThrough" for camera rays so it
provides reflection while appearing transparent. I could include the `.blend` files if anyone asks but for most
people they're unneccessary.

![Screenshot](YunziScreenshot.png)

## Installation

[Download](https://github.com/billhails/SabakiThemes/releases) the theme file and install it directly inside Sabaki
under 'Preferences' > 'Themes' > 'Install Theme...'.

## Build

To create a Sabaki theme archive, install dependencies using npm, then run the build script:

~~~
npm install
npm run build
~~~

This will create `yunzi.sabakitheme.asar`.

## License

Everything is released under [public domain](http://creativecommons.org/publicdomain/zero/1.0/).
