# -- Public --------------------------------------------
class MailNormalizer

  _existDOTbeforeAT: (word) ->
    word.indexOf('DOT') < word.indexOf('AT')

  _contains: (word, delimiter) ->
    word.indexOf(delimiter) > 0

  _normalizePossibleEmailIn: (word) ->
    if (@_contains(word,'AT') and @_contains(word,'.'))
      return word.replace('AT', '@')
    if (@_contains(word,'AT') and @_contains(word,'DOT'))
      unless @_existDOTbeforeAT(word)
        return word.replace('AT', '@').replace('DOT', '.')
    word

  parse: (text) ->
    words = text.split(" ")
    for word, index in words
      words[index] = @_normalizePossibleEmailIn(word)
    words.join(" ")

# -- Exports --------------------------------------------
exports = module.exports = MailNormalizer
