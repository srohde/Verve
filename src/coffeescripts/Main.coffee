###
Copyright (c) 2012 Sönke Rohde (http://soenkerohde.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
###

class Main

  constructor: ->
    @init()

  # init locales
  init: ->
    # Store reference to the #app div. See `src/views/index.hogan`
    @app = $ "#app"

    # Set client locale
    L.changeLocale "en"

    # Load locales
    L.initFile "locales.json", => @main() 

  # render first view
  main: ->
    # create main template
    template = new Hogan.Template T.main
    # render and append main template to DOM
    @app.append template.render(greeting: L.get("greeting", "Verve"))

window.Main = Main

# JQuery ready handler
$ ->
  main = new Main()