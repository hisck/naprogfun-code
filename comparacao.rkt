#lang racket
(require math/statistics)
(require rackunit)
(require rackunit/text-ui)
(require "jaccard-similarity.rkt")
(require "levenshtein.rkt")

;;0.05
(define textA "The Jaccard index, also known as Intersection over Union and the Jaccard similarity coefficient (originally given the French name coefficient de communauté by Paul Jaccard), is a statistic used for gauging the similarity and diversity of sample sets. The Jaccard coefficient measures similarity between finite sample sets, and is defined as the size of the intersection divided by the size of the union of the sample sets.")
(define textB "The Jaccard similarity index (sometimes called the Jaccard similarity coefficient) compares members for two sets to see which members are shared and which are distinct. It’s a measure of similarity for the two sets of data, with a range from 0% to 100%. The higher the percentage, the more similar the two populations. Although it’s easy to interpret, it is extremely sensitive to small samples sizes and may give erroneous results, especially with very small samples or data sets with missing observations.")

;;0.80
(define textC "In information theory, linguistics and computer science, the Levenshtein distance is a string metric for measuring the difference between two sequences. Informally, the Levenshtein distance between two words is the minimum number of single-character edits (insertions, deletions or substitutions) required to change one word into the other. It is named after the Soviet mathematician Vladimir Levenshtein, who considered this distance in 1965. Levenshtein distance may also be referred to as edit distance, although that term may also denote a larger family of distance metrics. It is closely related to pairwise string alignments.")
(define textD "The Levenshtein distance is a string metric for measuring the difference between two sequences. Informally, the Levenshtein distance between two words is the minimum number of single-character edits (i.e. insertions, deletions, or substitutions) required to change one word into the other. It is named after Vladimir Levenshtein, who discovered this equation in 1965. Levenshtein distance may also be referred to as edit distance, although it may also denote a larger family of distance metrics. It is closely related to pairwise string alignments.")

;;0.05
(define textE "Longest Common SubString (LCS) algorithm considers the similarity between two strings is based on the length of contiguous chain of characters that exist in both strings.")
(define textF "The longest common subsequence (LCS) is the problem of finding the longest subsequence that is present in given two sequences in the same order. i.e. find a longest sequence which can be obtained from the first original sequence by deleting some items , and from the second original sequence by deleting others.")

;;0.15
(define textG "President Trump slammed Chicago’s police superintendent for skipping his speech in protest at the International Association of Chiefs of Police conference in the Chicago. “There is one person that’s not here today. I said, ‘Where is he, I want to talk to him. In fact, more than anyone else, this person should be here because maybe he could learn something. And that’s the superintendent of Chicago Police chief Eddie Johnson,” the president said in the Windy City. “A few days ago, Johnson said quote, ‘The values of the people of Chicago are more important than anything President Trump could have decided.’ I don’t think so. Because it’s a very insulting statement,” Trump told the crowd, who’d been fired up as “Macho Man” blared from the McCormick Place ballroom speakers just before he spoke. “After all I’ve done, and I’ve done more than any other president. Here’s a man that could not bother to show up for a meeting of police chiefs, the most respected people, in his hometown. And with the president of the United States.” “And you know why, it’s because he’s not doing his job. Last year, 565 people were murdered in Chicago. Since Eddie Johnson has been policing, more than 1,500 people have been murdered in Chicago and 13,067 people have been shot. During the first weekend of August 2019, seven people were murdered.”He also pointed to Chicago’s tough gun laws, asserting that they did not good, though most weapons police confiscate are purchased elsewhere.")
(define textH "President Donald Trump on Monday used a speech to a gathering of international police chiefs to tear into his host city of Chicago, calling its violence worse than Afghanistan's, while also singling out the city’s police superintendent for snubbing his visit. “It is embarrassing to us as a nation,” Trump said at an annual gathering of the International Association of Chiefs of Police of Chicago’s crime rate. “All over the world they're talking about Chicago. Afghanistan is a safe place by comparison,” he said, recycling an attack he's used before to disparage cities. Story Continued Below Trump has railed against Chicago’s high rates of violent crime, even threatening at points to have the federal government intervene in the city. But on Monday, the president specifically trained his focus on Eddie Johnson, Chicago’s superintendent of police, who boycotted Trump’s appearance at the IACP convention, citing “not just my personal feelings about it, but our core values as a city.” “There is one person that’s not here today — we’re in Chicago,” Trump said toward the start of his speech Monday. “I said where is he? I want to talk to him. In fact, more than anyone else, this person should be here because maybe he could learn something,” he continued, pausing for cheers in the audience. “And that's the superintendent of Chicago police Eddie Johnson. He said the values of the people of Chicago are more important than anything President Trump would have to say.” Trump denounced the snub as a “very insulting statement after all I've done for the police,” beginning to rattle off statistics about gun violence in the city. He also ripped Chicago's status as a sanctuary city, claiming that Johnson had denied more than 1,000 requests from immigration officials to detain immigrants in Cook County, which contains Chicago. “Eddie Johnson wants to talk about values?” he asked. “No, people like Johnson put criminals and illegal aliens before the citizens of Chicago and those are his values and frankly, those values to me are a disgrace.”")

(define coefA (jaccard-similarity textA textB))
(define coefB (jaccard-similarity textC textD))
(define coefC (jaccard-similarity textE textF))
(define coefD (jaccard-similarity textG textH))

(define definitions (list 0.05 0.80 0.05 0.15))

(define coefE (levenshtein textA textB))
(define coefF (levenshtein textC textD))
(define coefG (levenshtein textE textF))
(define coefH (levenshtein textG textH))

(define listJaccard (list coefA coefB coefC coefD))
(define listLevenshtein (list coefE coefF coefG coefH))

(define correlationJaccard (correlation definitions listJaccard))
(define correlationLevenshtein (correlation definitions listLevenshtein))

(define timeJaccard (time(jaccard-similarity textA textB)))
(define timeLevenshtein (time(levenshtein textA textB)))

(printf "Jaccard: ~a, ~a, ~a, ~a\n" coefA coefB coefC coefD)
(printf "Levenshtein: ~a, ~a, ~a, ~a\n" coefE coefF coefG coefH)

(define (msg n1 n2)
    (if (> n1 n2) 
    (printf "O algoritmo Jaccard possui a maior correlação cerca de: ~a, em relação ao Levenshtein: ~a\n" n1 n2)
    (printf "O algoritmo Levenshtein possui a maior correlação cerca de: ~a, em relação ao Jaccard: ~a\n" n1 n2))    
)

(msg correlationJaccard correlationLevenshtein)