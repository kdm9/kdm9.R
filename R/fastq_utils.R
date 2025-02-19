estimate_n_reads = function(fsz, readlen=151, headerlen=64) {
    byteperread = (readlen + 1)*2 + headerlen + 1 + 2
    compress = 5.2173
    rawsz = fsz * compress
    round(rawsz/byteperread, 0)
}

#' Get basic statistics on a FastQ file
#'
#' @param fastqgz The path to a fastq.gz file to analyse
#' @param compress_ratio The average compression ratio for your data (bytes uncompressed/bytes compressed). You can estimate this manually for higher accuracy, however the default is reasonably consistent and any inaccuracy will be simply off by some scaling factor.
#' @return A tibble() of read_length, estimate_n_reads, file_size
#' @importFrom rlang .data
#' @export
fqinfo = function(fastqgz, compress_ratio = 5.2173 ) {
    if (is.na(fastqgz)|| fastqgz=="") return(tibble::tibble(read_length=NA, estimated_n_reads=NA, file_size=NA))
    con = gzfile(fastqgz, "rt")
    lines = readLines(con, n=4)
    close(con)
    llen = stringr::str_length(lines)
    bpr = sum(llen) + 4
    fsz = file.size(fastqgz)
    rawsz = fsz * compress_ratio
    tibble::tibble(
        read_length = llen[2],
        estimated_n_reads = ifelse(fsz <= 20, 0, round(rawsz/bpr, 0)),
        file_size=fsz,
    )
}


