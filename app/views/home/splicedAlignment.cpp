 /* 3.    (25 pts) Implement the spliced alignment algorithm.

Input:

g)    seqRNA: an RNA sequence (using letter A, C, G, U)

h)    seqDNA: a single strand genomic DNA sequence (using letter A, C, G, T)

i)      matScore: a 4x4 scoring matrix

j)      penGapOpen: gap opening penalty

k)    penGapExt: gap extension penalty

l)      threshold: an alignment score threshold

m)  listExons: a list of putative exons with coordinates on the DNA genomic sequence

Output:

a) gene: an ordered list of non-overlapping putative exons that maximizes the alignment score between the exon sequence on the gene and the RNA sequence.

*/