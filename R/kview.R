#' View a dataframe with LibreOffice
#'
#' @param df Any dataframe writable with readr
#' @return The input dataframe
#' @export
kview = function(df) {
    fn = paste0(tempfile(), ".tsv")
    readr::write_tsv(df, fn, na="")
    system(sprintf("libreoffice --calc %s", fn))
    return(invisible(df))
}
