Verve
===

Verve is a lightweight technology stack for modern web development targeting mobile apps using [Apache Cordova](http://cordova.apache.org) aka [PhoneGap](http://phonegap.com).  
Instead of using plain HTML, CSS and JavaScript you can
use a combination of great open source projects which make
web development fast, easy and fun. While the main focus are mobile apps Verve can also be used for web apps as well.

## Getting started
Clone repos, create a new project, install dependencies and compile resources:

    $ cd <your_work_dir>
    $ git clone git@github.com:phonegap/phonegap.git
    $ git clone git@github.com:srohde/Verve.git
    $ phonegap/lib/ios/bin/create <project_dir> <package_name> <project_name>
    $ ditto Verve <project_dir>
    $ cd <project_dir>
    $ rm -rf .git
    $ npm install .
    $ make ios

`make ios` will compile CoffeeScript to JavaScript, Stylus to CSS and Hogan to HTML to the `www` directory.

Open the project with XCode and run it in the simulator. You should see "Hello Verve."

When you try to preview `www/index.html` in your browser you'll get this error: _Origin null is not allowed by Access-Control-Allow-Origin._

To preview in your browser instead of the iOS simulator the usage of Chrome Canary is recommended. Open Canary with the necessary flags:

    $ make canary

__NOTE__: Don't use this browser instance for anything but development since it has disabled web security.

Open your favorite editor and start hacking on:

* src/coffeescripts/Main.coffee
* src/stylesheets/main.styl
* src/templates/main.hogan
* src/locales.json

## Features

### JSON Configuration

The project configuration is defined in `ios.json`.
You can change the the source and destination directories for
CoffeeScript, Stylus, Hogan.js and HTML page. For now you will need one configuration for each platform (iOS, Android, ...) since the cordova.js is platform specific. This will change in a future release to avoid duplication.

### CoffeeScript for JavaScript

Use [CoffeeScript](http://coffeescript.org) on top of JavaScript for client side scripting.  
Starting point: `src/coffeescript/Main.coffee`

### Stylus for CSS

[Stylus](http://learnboost.github.com/stylus/) is an expressive CSS language with lots of great features to take the pain
out of writing plain CSS. It is very similar to LESS or SASS but is even more
minimalistic dropping brackets, colons and semicolons.

Verve comes with some default styles and mixins: `src/stylesheets/main.styl`

### Localization

Localization is done with using [L](https://github.com/srohde/L). Declare your locales in `src/locales.json`:

    L.initFile "locales.json", =>
      console.log L.get("greeting", "Verve")

### JQuery

[JQuery](http://jquery.com/) is included in from `libs/client/jquery.1.7.1.min.js`.

### Hogan.js Templates

[Hogan.js](http://twitter.github.com/hogan.js/) is a compact JS templating engine. It is a JavaScript implementation of the popular [Mustache](http://mustache.github.com/) template engine:

    template = new Hogan.Template T.main
    $someDiv.append template.render(partial)

### Hammer.js for Touch Events

[Hammer.js](http://eightmedia.github.com/hammer.js) is included to support touch events:

    $("#someButton").hammer().on "tap", (event) ->
      console.log "button tapped"

### Spin.js

[Spin.js](http://fgnass.github.com/spin.js/) is included to have an awesome "no image, no CSS" spinner:

    $('body').spin "large", "white"

### Unit Tests with Mocha and Should

[Mocha](http://visionmedia.github.com/mocha/) a feature-rich JavaScript test framework and [should.js](https://github.com/visionmedia/should.js/tree/) and
expressive, readable, test framework agnostic, assertion library.  
Both combined together offer a very minimalistic but powerful
way to unit test your code.
See `test/client/LTest.coffee` for an example test.

    $ make tddClient

All tests get executed whenever a file changes. TDD TFW.

__Note__: To test your client side CoffeeScript classes your exports at the buttom of the class file look like this:

    window?.<class_name> = <class_name>
    module?.exports = <class_name>

### Functional Tests with CasperJS

[CasperJS](http://casperjs.org/) is a testing engine on top of the headless webkit browser [PhantomJS](http://phantomjs.org/)  
Casper needs to be installed explicitly:

    $ brew install casperjs

Starting point: `test/functional/casper.coffee`  
Run it with:

    $ make casper

Check out the screenshot in the temp directory.

### Docs

Docs are generated using [docco](http://jashkenas.github.com/docco/) and [Pygments](http://pygments.org).

    $ sudo easy_install Pygments
    $ make docs

### Lint

CoffeeLint is used for linting the code.  
Config file: `test/config/coffeelint.coffee`  
Run it with:

    $ make lint
    
You'll see a couple of errors about trailing whitespaces which is because of this (open issue)[https://github.com/clutchski/coffeelint/issues/39].

## License

[Apache License 2](http://www.apache.org/licenses/LICENSE-2.0.html)