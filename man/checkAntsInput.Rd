% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checkAntsInput.R
\name{checkAntsInput}
\alias{checkAntsInput}
\title{checkAntsInput}
\usage{
checkAntsInput(input, checkHeaders = F)
}
\arguments{
\item{input}{the variable to be checked}

\item{checkHeaders}{make sure all images have
the same headers}
}
\value{
Type of variable (antsImage, antsImageList, antsFiles)
         or error if variable cannot be established.
}
\description{
Function to check a variable whether is composed
of an antsImage, list of antsImages, or simply filenames.
If none of the above, an error is returned.
}
\examples{
\dontrun{
        files = Sys.glob('/data/jag/nifti/*.nii.gz')
         myimagelist = imageFileNames2ImageList(files)
         checkAntsInput(myimagelist) # returns 'antsImageList'
         checkAntsInput(antsFiles) # returns 'antsFiles'
         checkAntsInput(myimagelist[[1]]) # returns 'antsImage'
         }
}
\author{
Dorian Pustina
}
