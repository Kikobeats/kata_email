
# -- Private --------------------------------------------


# -- Public --------------------------------------------
class AntiSpam

  @parser: (string) ->

    if (string.indexOf('AT') > 0 and string.indexOf('.com') > 0)
      result = string.replace('AT', '@')
      return result
    else
      string
















# -- Exports --------------------------------------------
exports = module.exports = AntiSpam
