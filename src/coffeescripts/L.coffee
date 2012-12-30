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

# L is a leightweight localization solution.
# The locales have to be provided in JSON format.
# Placeholders are supported using curly brackets like  
# `Hello {0}.`
class L

  # _private_ Default locale
  @_locale: "br"

  # `locales` Path the the locales JSON file.  
  # `callback` Callback function invoked when file is loaded.
  @initFile: (locales, callback) ->
    $.getJSON locales, (json) ->
      L.initJSON json
      callback json

  # `json` Locales in JSON format.
  @initJSON: (json) ->
    L._l = json

  # `locale` Locale identifier like "en" or "de"
  @changeLocale: (locale) ->
    L._locale = locale

  # `key` Key of the string to look up  
  # `args...` Placeholder values
  @get: (key, args...) ->
    keyValue = L._l[key]
    if keyValue?
      value = keyValue[L._locale]
      if args
        for arg, i in args
          value = value.replace "{#{i}}", args[i]
      return value
    return "#{key}???"

window?.L = L
module?.exports = L