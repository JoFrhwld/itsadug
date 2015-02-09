#' Extract model residuals and remove the autocorrelation accounted for. 
#' 
#' @export
#' @aliases resid.gam
#' @param model A GAMM model build with \code{\link[mgcv]{gam}} or 
#' \code{\link[mgcv]{bam}}.
#' @param AR_start Optional: vector with logicals, indicating the start of 
#' events. 
#' Default is NULL, because generally the function can retrieve all necessary 
#' information from the model.
#' @param incl_na Whether or not to include missing values (NA)when returning 
#' the residuals. Defaults to FALSE.
#' @param return_all Default is FALSE. Returns a list with normal residuals, 
#' corrected residuals, and the value of rho.
#' @return Corrected residuals.
#' @author Jacolien van Rij
#' @seealso \code{\link[stats]{resid}}
#' @family functions for model criticism

resid_gam <- function(model, AR_start = NULL, incl_na = F, return_all = F) {
    
    # message(sprintf('Version %s of package mgcv is loaded.', packageVersion('mgcv')))
    
    # help function
    next_point <- function(x) {
        x <- as.vector(x)
        
        if (length(x) > 1) 
            return(c(x[2:length(x)], NA)) else if (length(x) == 1) 
            return(NA) else return(NULL)
    }
    
    tmpdat <- model$model
    
    # check AR_start:
    if (is.null(tmpdat$"(AR.start)")) {
        tmpdat$"(AR.start)" <- rep(FALSE, nrow(tmpdat))
        tmpdat[1, ]$"(AR.start)" <- TRUE
        
        if (!is.null(model$AR1.rho)) {
            if (is.null(AR_start)) {
                stop("No values for AR_start found in model specification. Please provide values for AR_start as argument to this function if you have run the model with an older version of mgcv (< 1.7.28).")
            } else {
                warning(sprintf("Values for argument AR_start may not be specified, although an AR1 model rho was included in model %s (rho = %f).", 
                  deparse(substitute(model)), model$AR1.rho))
                tmpdat$"(AR.start)" <- AR_start
            }
        }
    }
    
    # additional check of AR.start:
    if ((!TRUE %in% unique(tmpdat$"(AR.start)")) | (!FALSE %in% unique(tmpdat$"(AR.start)"))) {
        stop("No event starts found in AR_start argument.\nImportant: check the values of the AR_start argument, add at least one event start (value TRUE), and run the model again.")
    }
    
    
    n <- which(tmpdat$"(AR.start)")
    
    
    if (nrow(tmpdat) == length(resid(model))) {
        tmpdat$RES <- resid(model)
    } else {
        tmpdat$RES <- NA
        if(nrow(tmpdat)==length(resid(model))){
            tmpdat$RES <- resid(model)
        }else{
            tmpdat[!(1:nrow(tmpdat)) %in% model$na.action, ]$RES <- resid(model)
        } 
    }
    
    tmpdat$RES_next <- next_point(tmpdat$RES)
    tmpdat[n[(n - 1) > 0], ]$RES_next <- rep(NA, length(n[(n - 1) > 0]))
    
    if (is.null(model$AR1.rho)) {
        warning("No rho specified in model. Assumed rho to equal 0.")
        model[["AR1.rho"]] <- 0
    }
    
    res <- tmpdat$RES_next - model$AR1.rho * tmpdat$RES
    if (return_all) {
        return(list(res = tmpdat$RES, norm_res = res, AR1_rho = model$AR1.rho))
    } else if (incl_na) {
        return(res)
    } else {
        return(res[!is.na(res)])
    }
    
}

 