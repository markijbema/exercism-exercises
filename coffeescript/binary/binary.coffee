class Binary
  constructor: (string) ->
    @string = string.replace /[^01]/g, ''

  toDecimal: ->
    (digit * Math.pow(2, i++) for digit, i in @digits()).reduce(sum, 0)

  digits: ->
    (@string.charCodeAt(i) - 48 for i in [0...@string.length]).reverse()

sum = (a, b) -> a + b

module.exports = Binary
