#* @apiTitle Plumber API for generating PDFs

library(plumber)
library(stringr)
library(yaml)
options(scipen = 999, tinytex.verbose = TRUE, Encoding="UTF-8", max.print=100, verbose=TRUE, 
show.error.locations=TRUE, show.error.messages=TRUE, verbose=TRUE, 
warnPartialMatchArgs=TRUE, warnPartialMatchAttr=TRUE,  warnPartialMatchDollar=TRUE,
internet.info=0 )
knitr::opts_chunk$set(echo = F,message=F,warning=F,cache = F)
file_name <- "unsigned.pdf"


#* Print to log
#* @filter logger
logger = function(req){
  #cat("\n", as.character(Sys.time()), 
  #    "\n", req$REQUEST_METHOD, req$PATH_INFO, 
  #    "\n", req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR)
  plumber::forward()
}

  

#* @assets ./files/static
list()




#* @serializer contentType list(type="application/pdf")
#* @description Gets PDF
#* @param id The id of generation (id)
#* @get /pdf
function(id, res){
  output_dir <- file.path(".",id)
  output_file_path <- file.path(output_dir, file_name)
  if (dir.exists(output_dir) & file.exists(output_file_path)){
    readBin(output_file_path, "raw", n=file.info(output_file_path)$size)
  }
  else{
    res$status <- 404
    return(list(error="Not Found"))
  }
}


#* @description Gets metadata for rmarkdown
#* @get /meta
function(res){
  y <- yaml.load_file("rmarkdown.yaml")
  return (y)
}


#* @serializer contentType list(type="application/pdf")
#* @description Generates PDF
#* @param id The id of generation (id)
#* @post /pdf
#* @parser json
#* @preempt logger
function(id, req, res){
  if(is.null(req$postBody) | req$postBody==""){
    res$status <- 400
    return(list(error="Bad Request"))
  }
  
  params = jsonlite::fromJSON(req$postBody)
  output_dir <- file.path(".",id)
  output_file_path <- file.path(output_dir, file_name)
  
  output_file_start <- file.path(output_dir, "start")
  if(!file.exists(output_file_start)) {
    file.create(output_file_start)
  }
  
  rmarkdown::render("rmarkdown.Rmd", output_dir=output_dir, output_format="pdf_document", output_file=file_name,
         params = params, envir = new.env())
  
  file.create(file.path(output_dir, "done"))
  
  readBin(output_file_path, "raw", n=file.info(output_file_path)$size)
}


#* @description will remove old working folder 
#* @delete /pdf
#* @param numberOfHours After number of hours, old generation will be removed 
function(numberOfHours) {
  dirs_to_check <- list.dirs( recursive = FALSE, full.names = FALSE)
  removed_dirs <- c()
  for (dir_to_check in dirs_to_check) {
    if(str_starts(dir_to_check, "\\.", negate = TRUE) & dir_to_check != "")
    {
      gen_start <- file.mtime(file.path(dir_to_check, "start"))
      if(difftime(Sys.time(), gen_start,  units = "hours") > numberOfHours) {
        unlink(dir_to_check, recursive = TRUE, force = TRUE)
        removed_dirs <- c(removed_dirs, dir_to_check)
      }
    }
  }
  return(removed_dirs)
}

#* @head /ping 
function() {
  return("OK")
}
