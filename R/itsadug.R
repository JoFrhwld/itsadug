#' Interpreting Time Series, Autocorrelated Data Using GAMMs (itsadug)
#'
#' Itsadug provides a set of functions that facilitate the evaluation, 
#' interpretation, and visualization of GAMM models that are implemented in 
#' the package \code{\link[mgcv]{mgcv}}. 
#'
#' @section Evaluation:
#' \itemize{
#'   \item The function \code{\link{compareML}} compares two GAMM models based 
#' on their selection scores and degrees of freedom.
#'   \item The function \code{\link{check_resid}} allows for a quick inspection
#' of the residuals. It shows the distribution and autocorrelation.
#'   \item The functions \code{\link{acf_resid}}, \code{\link{acf_plot}}, 
#' and \code{\link{acf_n_plots}} allow for a more precise inspection of the 
#' autocorrelation in the model residuals.
#'   \item The function \code{\link{resid_gam}} gives back the corrected 
#' residuals of a GAMM that includes an AR1 model.
#' }
#' 
#' @section Interpretation and visualization:
#' The vignettes "overview" and "plotfunctions" 
#' (\code{vignette("overview", package="itsadug")} and 
#' \code{vignette("plotfunctions", package="itsadug")}) 
#' provide more 
#' info and examples on the different plot functions, and how they related to 
#' \code{mgcv}'s default plot functions. Here's a short list of the functions 
#' for visualizing model terms and interactions:
#' \itemize{
#'   \item \code{\link{pvisgam}} plots partial interaction surfaces; it also 
#' allows for visualizing 3-way or higher interactions.
#'   \item \code{\link{fvisgam}} plots summed interaction surfaces, with the 
#' possibility to exclude random effects.
#'   \item \code{\link{plot_smooth}} plots 1D model estimates, and has the 
#' possibility to exclude random effects. 
#'   \item \code{\link{plot_parametric}} plot group estimates.
#'   \item \code{\link{plot_diff2}} plots a \emph{difference} surface 
#' (difference between two nonlinear interaction surfaces).
#'   \item \code{\link{plot_diff}} plots a \emph{difference} smooth.
#' }
#'
#' @section Predictions:
#' Further, there are some wrappers around the \code{\link[mgcv]{predict.gam}}
#' function to facilitate the extraction of model predictions. These can be 
#' used for customized plots. See for an example in the vignette 
#' "plotfunctions" 
#' (\code{vignette("plotfunctions", package="itsadug")}).
#' \itemize{
#'   \item \code{\link{get_predictions}} for getting the estimates for given 
#' settings of some or all of the model predictors;
#'   \item \code{\link{get_difference}} for extracting the difference between 
#' two conditions or two smooths or two surfaces.
#'   \item \code{\link{get_modelterm}} for extracting the smooth term (
#' partial) estimates.
#'   \item \code{\link{get_random}} for extracting random effects only.
#' }
#'
#' @section Additional functions:
#' There are more functions, mostly utility functions. But the ones mentioned 
#' here may be worth to try:
#' \itemize{
#'   \item The function \code{\link{gamtabs}} is a wrapper around 
#' \code{print.xtable} (package xtable) for including model summaries 
#' in a \code{knitr} file.
#'   \item \code{\link{find_difference}} returns where a smooth is 
#' significantly different from zero. 
#'   \item \code{\link{fadeRug}} uses transparency to overlay data 
#' observations on a surface.
#'   \item \code{\link{gradientLegend}} for adding a color legend to a plot.
#' }
#' The additional functions are mostly convenience functions for plotting, 
#' such as \code{\link{emptyPlot}}, \code{\link{plot_error}} for quickly 
#' plotting smooth terms with shaded errors, and \code{\link{addInterval}}
#' for drawing interval indication.
#'
#' @author
#' Jacolien van Rij, Martijn Wieling, R.Harald Baayen, Hedderik van Rijn
#'
#' Maintainer: Jacolien van Rij (\email{vanrij.jacolien@@gmail.com})
#'
#' University of Tuebingen, Germany
#' @docType package
#' @name itsadug
NULL