
# -- Private --------------------------------------------


existDOTbeforeAT = (string) ->
  at_position = string.indexOf('AT')
  dot_position = string.indexOf('DOT')
  dot_position < at_position

replaceDOT = (string) ->
  string.replace('DOT', '.')

replaceAT = (string) ->
  string.replace('AT', '@')

contains = (string, delimiter) ->
  string.indexOf(delimiter) > 0


# -- Public --------------------------------------------
class AntiSpam

  @parser: (string) ->

    if (contains(string,'AT') and contains(string,'.'))
      return replaceAT(string)

    if (contains(string,'AT') and contains(string,'DOT'))
      if existDOTbeforeAT(string)
        return string
      else
        result = replaceAT(string)
        result = replaceDOT(result)
        return result

    string

# -- Exports --------------------------------------------
exports = module.exports = AntiSpam
