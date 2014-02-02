/*jslint node: true */
"use strict";

var count = function (words) {
    var cnt = {};
    words.forEach(function (word) {
        cnt[word] = cnt[word] || 0;
        cnt[word] += 1;
    });
    return cnt;
};

var Words = function (input) {
    var words = input.toLowerCase().match(/\w+/g);
    this.count = count(words);
};

module.exports = Words;
