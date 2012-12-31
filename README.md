Verve
===

Verve is a lightweight technology stack for modern web development. It was build to target mobile apps using [Apache Cordova](http://cordova.apache.org) aka [PhoneGap](http://phonegap.com).

## Quick Overview

Verve is combining the use of the following open source projects:

* __CoffeeScript__ Scripting
* __Stylus__ CSS
* __Hogan__ HTML Templates
* __Mocha__ Test engine
* __Should__ BDD style assertions
* __Casper.js__ Functional testing
* __L__ Localization
* __Hammer.js__ Touch events
* __JQuery__ DOM, AJAX
* __spin.js__ No image, no CSS spinner
* __docco__ Docs
* __Coffeelint__ Lint code

## How it works

The core of the Verve engine is the `Cakefile` which watches all CoffeeScript, Stylus and Hogan files. Whenever a file changes it automatically gets compiled into the output directory. You can invoke the Cakefile directly:

    $ cake --config ios.json dev

or invoke it with the short handle through the Makefile:

    $ make ios

__Hint__: If `make` is not found you need to install the Command Line Tools: XCode->Settings->Downloads

For [Growl notifications support](https://github.com/visionmedia/node-growl) install growlnotify. On OS X 10.8, Notification Center is supported using terminal-notifier. To install:

    $ sudo gem install terminal-notifier

## Setup

In order to use Verve you need to install [node.js](http://nodejs.org) and Coffeescript:

    $ sudo npm install -g coffee-script

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
You can change the source and destination directories for
CoffeeScript, Stylus, Hogan.js and HTML page. For now you will need one configuration for each platform (iOS, Android, ...) since the cordova.js is platform specific. This will change in a future release of Verve to avoid duplication.

### CoffeeScript for JavaScript

[CoffeeScript](http://coffeescript.org) is used instead of JavaScript.  
Starting point: `src/coffeescripts/Main.coffee`

### Stylus for CSS

[Stylus](http://learnboost.github.com/stylus/) is a great minimalistic CSS language with lots of great features to take the pain out of writing plain CSS.  

Verve comes with some default styles and mixins: `src/stylesheets/main.styl`

### Localization

Localization is done using [L](https://github.com/srohde/L). Declare your locales in `src/locales.json`:

    L.initFile "locales.json", =>
      console.log L.get("greeting", "Verve")

### JQuery

[JQuery](http://jquery.com/) is included from `libs/client/jquery.1.7.1.min.js`.

### Hogan.js Templates

[Hogan.js](http://twitter.github.com/hogan.js/) is a compact JS templating engine. It is a JavaScript implementation of the popular [Mustache](http://mustache.github.com/) template engine. Verve automatically compiles all templates into the `T` namespace.  

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

__Note__: To test your client side CoffeeScript classes your exports at the bottom of the class file look like this:

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

### IPA File

Edit the `build.properties` and add the name of your XCode project and scheme name.

Create the IPA file using:

    $ ant

You can use the IPA file to distribute your app to test users using [Testflight](http://testflightapp.com).

### Docs

Docs are generated using [docco](http://jashkenas.github.com/docco/) and [Pygments](http://pygments.org).

    $ sudo easy_install Pygments
    $ make docs

### Lint

CoffeeLint is used for linting the code.  
Config file: `test/config/coffeelint.coffee`  
Run it with:

    $ make lint
    
You'll see a couple of errors about trailing whitespaces which is because of this [open issue](https://github.com/clutchski/coffeelint/issues/39).

## License

(The MIT License)

Copyright (c) 2012 Sönke Rohde http://soenkerohde.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.