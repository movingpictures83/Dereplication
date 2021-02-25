# Dereplication
# Language: R
# Input: DIRECTORY
# Output: PREFIX
# Tested with: PluMA 1.1, R 4.0.0
# dada2_1.18.0

PluMA plugin to take a set of reads and remove redundant reads, replacing them with a single read and a counter for efficiency.

The plugin takes as input a directory that contains reads assumed to be in FASTQ format.

Corresponding output dereplicated FASTQ files will be produced, starting with the user-specified prefix.

R objects of type derep-class (package: dada2) will also be output as prefix.forward.rds and prefix.reverse.rds)
