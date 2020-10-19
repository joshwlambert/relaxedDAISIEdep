get_relaxedDAISIE_path <- function(filename, archipelago) {
  full <- system.file("results", archipelago, filename,
                      package = "relaxedDAISIE")
  if (!file.exists(full)) {
    stop("'filename' must be the name of a file in 'inst/results'")
  }
  return(full)
}
