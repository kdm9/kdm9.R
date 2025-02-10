#' Generate a table from MPIBT SRA file structure
#'
#' @param directory Project directory to scan. 
#' @return Dataframe of dir, run, library, r1_uri, r2_uri
#' @importFrom rlang .data
#' @export
ebio_sra_extract = function(directory) {
    tibble::tibble(dir=directory, files=Sys.glob(sprintf("%s/*/*.fastq.gz", directory))) %>%
        dplyr::mutate(files=gsub("//", "/", .data$files)) %>%
        tidyr::extract(.data$files, regex="illumina_.+_flowcell.+_SampleId(.+)_(RunId\\d+_LaneId\\d+)/.+_(R\\d)_\\d+.fastq.gz", into=c("library", "run", "read"), remove = F) %>%
        tidyr::pivot_wider(names_from = "read", values_from = "files", values_fill="") %>%
        dplyr::arrange(.data$run, .data$library) %>%
        dplyr::transmute(
            .data$dir,
            .data$run,
            .data$library,
            read1_uri=.data$R1,
            read2_uri=.data$R2,
        )
}
