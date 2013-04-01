# Copyright (c) 2013 Sönke Rohde http://soenkerohde.com
# 
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the 'Software'), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

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

    $content = @app.find("#content")
    $content.on 'tap', (event) =>
      console.log "tap detected"
    @dragExample $content

  dragExample: (dom) ->
    startPos = {x:0,y:0}
    currentPos = {x:0,y:0}
    direction = ''
    dom.on 'touchstart', (event) =>
      console.log "touchstart"
      startPos = Touch.getPos event
    .on 'touchmove', (event) =>
      currentPos = Touch.getPos event
      angle = Touch.getAngle(startPos, currentPos)
      direction = Touch.getDirectionFromAngle angle
      console.log "drag: #{direction}"
      posX = currentPos.x - startPos.x
      posY = currentPos.y - startPos.y
      window.webkitRequestAnimationFrame =>
        dom.css '-webkit-transform', "translate3d(#{posX}px, #{posY}px, 0)"
    .on 'touchend', (event) =>
      console.log "touchend"
      dom.animate translate3d:"0,0,0", 250, 'ease-out'

window.Main = Main

# Ready handler
$ ->
  main = new Main()