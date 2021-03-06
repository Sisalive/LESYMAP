% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checkImageList.R
\name{checkImageList}
\alias{checkImageList}
\title{checkImageList}
\usage{
checkImageList(imgList, showError = T, binaryCheck = F)
}
\arguments{
\item{imgList}{list of antsImages}

\item{showError}{boolean indicating whether to show the
exact error and interrupt the function (TRUE, default),
or don't show the error and return the check
status (FALSE). The returned values when
showError=F are T=passed or F=Failed.}

\item{binaryCheck}{boolean, check if images are binary (0/1 values).
Useful when checking masks or lesions.
This check slows the output of the function.}
}
\value{
True if list has images with same headers,
         otherwise False.
}
\description{
Function to check that all antsImages in a list have
the same orientation, origin, and resolution.
The function stops with an error if one of the images
has unusual headers. This behavior can be overcome
by setting showError=F, and using the returned status
(True=pass, False=fail) to make decisions outside this
function.
}
\examples{
\dontrun{
files = Sys.glob('/data/jag/nifti/*.nii.gz')
myimagelist = imageFileNames2ImageList(files)
checkImageList(myimagelist) # no value returned
checkImageList(lesions, showError=F) # True returned
myimagelist[[4]] = cropIndices(myimagelist[[4]], c(1,1,1), c(20,20,20))
checkImageList(myimagelist) # error on image 4
}

}
\author{
Dorian Pustina
}
