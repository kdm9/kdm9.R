#' View a dataframe with LibreOffice
#'
#' @param df Any dataframe writable with readr
#' @return The input dataframe
#' @export
kview = function(df) {
    fn = paste0(tempfile(), ".tsv")
    utils::write.table(df, fn, sep="\t", row.names=FALSE, na="", quote=TRUE)
    system(sprintf("libreoffice --calc %s", fn))
    return(invisible(df))
}
