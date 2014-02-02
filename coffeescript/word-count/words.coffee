class Words
  constructor: (sentence) ->
    @count = word_count(sentence)

  word_count = (sentence) ->
    count = {}
    sentence.toLowerCase()
      .replace /\w+/g, (word) =>
        count[word] ?= 0
        count[word]++
    count

module.exports = Words
