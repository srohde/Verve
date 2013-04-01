# Copyright (c) 2012 Sönke Rohde http://soenkerohde.com
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

# Heavily inspired by the Hammer.js implementation
class Touch

  @DOWN: "down"
  @LEFT: "left"
  @UP: "up"
  @RIGHT: "right"

  @getDirectionFromAngle: (angle) ->
    return Touch.DOWN  if angle >= 45 and angle < 135
    return Touch.LEFT  if angle >= 135 or angle <= -135
    return Touch.UP    if angle < -45 and angle > -135 
    return Touch.RIGHT if angle >= -45 and angle <= 45

  @getAngle: (pos1, pos2) ->
    Math.atan2(pos2.y - pos1.y, pos2.x - pos1.x) * 180 / Math.PI

  @getPos: (event) ->
    touch = event.touches[0]
    pos =
      x: touch.pageX
      y: touch.pageY

window.Touch = Touch