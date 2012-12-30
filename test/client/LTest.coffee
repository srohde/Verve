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