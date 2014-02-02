class Bob
  hey: (message) ->
    if silence(message)
      "Fine. Be that way!"
    else if shouting(message)
      "Woah, chill out!"
    else if question(message)
      "Sure."
    else
      "Whatever."

  silence = (message) ->
    message.trim() == ''

  shouting = (message) ->
    message.toUpperCase() == message

  question = (message) ->
    message.slice(-1) == '?'

module.exports = Bob
