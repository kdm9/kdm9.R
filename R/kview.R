#@ kview - view a dataframe w/ libreoffice
kview = function(df) {
    fn = paste0(tempfile(), ".tsv")
    readr::write_tsv(df, fn, na="")
    system(sprintf("libreoffice --calc %s", fn))
    return(invisible(df))
}
