% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lsm_BMfast.R
\name{lsm_BMfast}
\alias{lsm_BMfast}
\title{lsm_BMfast}
\usage{
lsm_BMfast(lesmat, behavior, permuteNthreshold = 9, alternative = "greater",
  statOnly = FALSE, nperm = 1000, npermBM = 20000, FWERperm = FALSE,
  v = 1, pThreshold = 0.05, permuteAllVoxelsBM = FALSE,
  showInfo = FALSE, ...)
}
\arguments{
\item{lesmat}{binary matrix (0/1) of voxels (columns)
and subjects (rows).}

\item{behavior}{vector of behavioral scores.}

\item{permuteNthreshold}{(default=9) Voxels lesioned in less than
this number will undergo permutation based thresholding.
See Medina et al 2010.}

\item{alternative}{(default="greater") It is assumed that
healthy voxels (0) have greater behavioral scores. If your
data follow an inverted relationship choose "less" or
"two.sided".}

\item{statOnly}{logical (default=FALSE), skips some computations,
mostly for internal use to speed up some things.}

\item{nperm}{(default=1000) Number of permutations to perform on
entire volumes when needed for multiple comparisons corrections
(i.e., in FWERperm).}

\item{npermBM}{(default=20000) Number of permutations to perform
at every single voxel below \code{permuteNthrehsold}. Note, this
argument is different from \code{nperm}, which controls volume-based
permutations to perform multiple comparison corrections with FWERperm.}

\item{FWERperm}{logical (default=FALSE) whether to perform permutation
based FWER thresholding.}

\item{v}{(default=1) which voxel to record at each permutation with
FWERperm. All software use the peak voxel (v=1), but you can choose
a voxel further down the list to relax the threshold (i.e., v=10
for 10 highest voxel)
(see \href{https://www.ncbi.nlm.nih.gov/pubmed/12704393}{Mirman (2017)}).}

\item{pThreshold}{(default=0.05) what threshold to use for FWER}

\item{permuteAllVoxelsBM}{(default=FALSE) whether to force the
permutation-based p-value calulation for all voxels, instead of
applying only to voxels below \code{permuteNthrehsold}. Setting this
option to TRUE will force all voxels  undergo permutation-based
p-value calculation.}

\item{showInfo}{display info messagges when running the function.}

\item{...}{other arguments received from \code{\link{lesymap}}.}
}
\value{
List of objects returned:
\itemize{
\item\code{statistic} - vector of statistical values
\item\code{pvalue} - vector of pvalues
\item\code{zscore} - vector of zscores
\item\code{perm.vector} - (optional) vector of permuted statistics
\item\code{perm.FWERthresh} - (optional) permutation threshold established
from the distribution of \code{perm.vector}
}
}
\description{
Lesion to symptom mapping performed on a prepared matrix.
Brunner-Munzel tests are performed using each column
of the matrix to split the behavioral scores in two
groups. This function relies on a compiled version for
fast processing.
}
\examples{
{
set.seed(123)
lesmat = matrix(rbinom(200,1,0.5), ncol=2)
set.seed(123)
behavior = rnorm(100)
result = lsm_BMfast(lesmat, behavior)
}

}
\author{
Dorian Pustina

Note on zscores
qnorm gives same values as MRIcron
and relies on the normal distribution.
however, we are computing t-scores, and
should have relied on that distribution,
which is the t-score itself.
}
