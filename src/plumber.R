#* @apiTitle Plumber API for generating PDFs

#* Print to log
#* @filter logger
logger = function(req){
  cat("\n", as.character(Sys.time()), 
      "\n", req$REQUEST_METHOD, req$PATH_INFO, 
      "\n", req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR)
  plumber::forward()
}

#* @assets ./files/static
list()


#* @serializer contentType list(type="application/pdf")
#* @description Gets PDF
#* @param stamp The stamp of generation (id and date time)
#* @get /pdf
function(stamp){
  output_file <- 
  output_file <- paste0(stamp, ".pdf")
  output_filePath <- file.path(stamp,output_file)
  readBin(output_filePath, "raw", n=file.info(output_filePath)$size)
}


#* @serializer contentType list(type="application/pdf")
#* @description Generates PDF
#* @post /pdf
function(req){
  params = jsonlite::fromJSON(req$postBody)

  dateTime <- format(Sys.time(), "%Y%m%d_%H%M%S")
  stamp <- paste(params$id, dateTime, sep="_")
  output_file <- paste0(stamp, ".pdf")

  rmarkdown::render("rmarkdown.Rmd", output_dir=stamp, output_format="pdf_document", output_file=output_file,
         params = params, envir = new.env())

  output_filePath <- file.path(stamp,output_file)
  readBin(output_filePath, "raw", n=file.info(output_filePath)$size)
}


#* @delete /pdf 
function() {
  dir_to_remove <- list.dirs(recursive = FALSE) 
  unlink(dir_to_remove, recursive = TRUE, force = TRUE)
  return(dir_to_remove)
}

#* @head /test 
function() {
  return("OK")
}
