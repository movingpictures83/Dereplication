#First must have dada2 and Bioconductor installed: https://benjjneb.github.io/dada2/dada-installation.html 
#Must also have phyloseq installed: http://joey711.github.io/phyloseq/install.html
dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")

library(dada2); 
packageVersion("dada2")


input <- function(inputfile) {
  pfix <<- prefix()
  if (length(pfix) != 0) {
     pfix <<- paste(pfix, "/", sep="")
  }

  filterdir <<- inputfile
  #print(filterdir)
}

run <- function() {
path <<- filterdir # CHANGE ME to the directory containing the fastq files after unzipping.
#print(list.files(path))
#print(path)

# Forward and reverse fastq filenames have format: SAMPLENAME_R1_001.fastq and SAMPLENAME_R2_001.fastq
filtFs <<- sort(list.files(path, pattern="_F_filt.fastq", full.names = TRUE))
filtRs <<- sort(list.files(path, pattern="_R_filt.fastq", full.names = TRUE))

#print(filtFs)
#print(filtRs)

}

output <- function(outputfile) {
derep_forward <- derepFastq(filtFs, verbose=TRUE)
derep_reverse <- derepFastq(filtRs, verbose=TRUE)
#print(typeof(derep_forward))
#print(str(derep_forward))
i=1
for (fn in names(derep_forward)) {
   uniquesToFasta(derep_forward[[i]], paste(outputfile, fn, sep="."))
   i <- i+1
}
i=1
for (fn in names(derep_reverse)) {
   uniquesToFasta(derep_reverse[[i]], paste(outputfile, fn, sep="."))
   i <- i+1
}
saveRDS(derep_forward, file=paste(outputfile, ".forward.rds", sep=""))
saveRDS(derep_reverse, file=paste(outputfile, ".reverse.rds", sep=""))
}

