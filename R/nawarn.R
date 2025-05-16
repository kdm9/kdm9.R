
#' Check for coerced values
#'
#' @param x before conversion
#' @param y after conversion
#' @return The "after" input
#' @export
whona = function(x, y) {
    # Find which values got coerced to NA
    coerced = which(!is.na(x) & is.na(y))
    if (length(coerced) > 0) {
        cat("Following values coerced to NA:\n")
        print(paste(coerced, x[coerced]))
    }
    y
}

#' Fuzzily interpret booleans as often written by hand on field notes
#'
#' @param x character representing boolean values
#' @return The "after" input
#' @export
truey_falsey = function(x) {
    tf = dplyr::case_match(x,
            c("1", "Y", "P", "Yes", "Present") ~ T,
            c("0", "N", "A", "No",  "Absent") ~F
    )
    whona(x, tf)
}

#' An as.numeric that shows coerced values
#'
#' @param x character representing numeric
#' @return The "after" input
#' @export
as.numeric.verbose = function(x) {
    # this code will parse german-style comma-as-decimal numbers or
    # english-style dot-as-decimal numbers.
    x = ifelse(grepl('^\\d+,\\d+$', x, perl=T), sub(',', '.', x, fixed=T), x)
    x.num = as.numeric(x)
    # Find which values got coerced to NA
    whona(x, x.num)
}
