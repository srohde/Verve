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

should = require 'should'
L = require '../../src/coffeescripts/L'

describe 'L', ->

  before () ->
    L.changeLocale "br"
    L.initJSON
      brazil:
        br: "Brasil"
        en: "Brazil"
        de: "Brasilien"
      title:
        br: "Foo {0} Bar {1} Test"
        de: "Foo {0} Bar {1} Test"
        en: "Foo {0} Bar {1} Test"


  describe '#get()', ->
    it 'should return the value for a string key with default locale', ->
      L.get("brazil").should.equal "Brasil"

    it 'should return replace arguments', ->
      L.get("title", "a", "b").should.equal "Foo a Bar b Test"

    it 'should return the value the changed locale', ->
      L.changeLocale "en"
      L.get("brazil").should.equal "Brazil"
      L.changeLocale "de"
      L.get("brazil").should.equal "Brasilien"

    it 'should return the value with ??? when key not found', ->
      L.get("brasil").should.equal "brasil???"