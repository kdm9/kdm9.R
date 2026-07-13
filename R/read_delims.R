#' readr::read_delim() for many files at once
#'
#' @param files  A character vector of filenames
#' @param ...    Arguments passed to each file-level readr::read_delim() call
#' @return       The resulting concatenated dataframe
#' @export
read_delims = function(files, ...) {
    dplyr::bind_rows(lapply(files, function(f) readr::read_delim(f, ...)))
}
