
# -- Private --------------------------------------------


# -- Public --------------------------------------------
class AntiSpam

  @parser: (string) ->

    if (string.indexOf('AT') > 0 and string.indexOf('.') > 0)
      result = string.replace('AT', '@')
      return result

    if (string.indexOf('AT') > 0 and string.indexOf('DOT') > 0)
      at_position = string.indexOf('AT')
      dot_position = string.indexOf('DOT')

      if dot_position < at_position
        return string

      else
        result = string.replace('AT', '@').replace('DOT', '.')
        return result

    else
      string
















# -- Exports --------------------------------------------
exports = module.exports = AntiSpam
