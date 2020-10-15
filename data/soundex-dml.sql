-- The absolute path should be provided to the copy statemet
-- COPY soundex.word (word) FROM 'D:\\codecool\\data-implementing-algorithms-in-sql\\soundex-words-2643.txt'; -- Source: https://www.randomlists.com/random-words (quantity setting: 3000)
-- COPY soundex.word (word) FROM 'D:\\codecool\\data-implementing-algorithms-in-sql\\soundex-words-58110.txt'; -- Source: http://www.mieliestronk.com/wordlist.html (corncob_lowercase.txt)
COPY soundex.word (word) FROM 'D:\\codecool\\data-implementing-algorithms-in-sql\\soundex-words-370101.txt'; -- Source: https://github.com/dwyl/english-words (words_alpha.txt)
