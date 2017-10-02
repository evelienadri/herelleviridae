# Import table
gene_presence_absence <- read.delim("~/path_to_file/filename", row.names=1)
m <- as.matrix(gene_presence_absence)

# Make a vector with the column sums 
s <- as.vector(colSums(m))

# Pairwise sums between all columns into out matrix
n <- seq_len(ncol(m))
id <- expand.grid(n,n)
out <- matrix(colSums(m[ , id[,1]] + m[ , id[,2]] == 2), ncol = length(n))
diag(out) <- 1

# Add headers to out matrix
headers <- as.list(colnames(m))
colnames(out) <- headers
rownames(out) <- headers

# Divide out matrix by sum vector to get percentages
p <- out/s
diag(p) <- 1

write.table(p, file = "pairwise_comp.txt", sep = "\t")
