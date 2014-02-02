alphagram = function(word) {
  return word.split('').sort().join('');
};

are_anagrams = function(l, r){
  left = l.toLowerCase();
  right = r.toLowerCase();

  if (left == right ) return false;

  return alphagram(left) == alphagram(right);
};

Anagram = function(word){
  this.word = word;
};
Anagram.prototype.match = function(words){
  return words.filter(function(word){
    return are_anagrams(this.word, word);
  },this);
};

module.exports = Anagram;
