# -- Public --------------------------------------------
class MailNormalizer

  _replaceAll: (text, search, newstring) ->
    text.replace(new RegExp(search, 'g'), newstring)

  _countNumberOfCharacter: (text, char) ->
    text.split(char).length-1

  _existDOTbeforeAT: (word) ->
    word.indexOf('DOT') < word.indexOf('AT')

  _contains: (word, delimiter) ->
    word.indexOf(delimiter) > 0

  _normalizePossibleEmailIn: (word) ->
    if (@_contains(word,'AT') and @_contains(word,'.'))
      return word.replace('AT', '@')
    if (@_contains(word,'AT') and @_contains(word,'DOT'))
      result = word.replace('AT', '@')
      return @_replaceAll(result, 'DOT', '.')
    word

  parse: (text) ->
    words = text.split(" ")
    for word, index in words
      words[index] = @_normalizePossibleEmailIn(word)
    words.join(" ")

# -- Exports --------------------------------------------
exports = module.exports = MailNormalizer
