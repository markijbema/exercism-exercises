function silent(message){
  return message === '';
}

function shouted(message){
  return message.toUpperCase() === message;
}

function questioning(message){
  return message.substr(-1) == '?';
}

Bob = function(){};
Bob.prototype.hey = function(message){
  if (silent(message))
    return 'Fine, be that way!';
  else if (shouted(message))
    return 'Woah, chill out!';
  else if (questioning(message))
    return "Sure.";
  else
    return "Whatever.";
};

module.exports = Bob;
