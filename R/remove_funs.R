
removeNonNumeric <- function ( string ) {gsub("[^0-9]","",string)}

### entfernt bestimmtes Pattern aus einem String
removePattern     <- function ( string, pattern ) {
  checkmate::assert_character(string)
  checkmate::assert_character(pattern, len = 1)
  splitt <- strsplit(string, pattern)
  ret    <- unlist(lapply(splitt, FUN = function ( y ) { paste(y, collapse="")}))
  return(ret)}

removeNumeric <- function ( string ) {
  checkmate::assert_character(string)
  gsub("0|1|2|3|4|5|6|7|8|9","",string)}

crop <- function ( x , char = " " ) {
  checkmate::assert_character(x)
  checkmate::assert_vector(char, len = 1, strict = TRUE)
  if ( char %in% c ( "\\" , "+" , "*" , "." , "(" , ")" , "[" , "]" , "{" , "}" , "|" , "^" , "$" ) ) {char <- paste ( "\\" , char , sep = "" ) }
  gsub ( paste ( "^" , char , "+|" , char , "+$" , sep = "" ) , "" , x ) }


### gsub for more than one pattern
gsubAll <- function(string, old, new) {
  stopifnot ( is.character(string), is.character(old), is.character(new), length(old) == length(new))
  for(i in seq_along(old)) {
    string <- gsub(old[i], new[i], string)
  }
  return(string)
}


### splits the string only on the first or the last occurrence of the separator
halveString <- function (string, pattern, first = TRUE, colnames=c("X1", "X2") )  {
  checkmate::assert_character(string)
  checkmate::assert_character(pattern, len = 1)
  checkmate::assert_logical(first, len = 1)
  if( !(inherits(colnames, "character") && length(colnames)==2 && length(unique(colnames)) == 2 )) {stop("'colnames' must be a unique character vector of length 2.")}
  if(!first) {
     ret <- rbind_fill_vector(regmatches(stringi::stri_reverse(string), regexpr(pattern, stringi::stri_reverse(string)), invert = TRUE))
     for ( i in 1:ncol(ret)) {ret[,i] <- stringi::stri_reverse(ret[,i])}
     na  <- which(apply(ret, MARGIN = 1, FUN = function(y) {any(is.na(y))}))    ### reverse muss wieder rueckgaengig gemacht werden, ausser fuer die NAs
     ret <- ret[,c(2,1), drop=FALSE]                                            ### die sollen an der Stelle bleiben, wo sie sind
     if(length(na)>0) {ret[na,] <- ret[na,c(2,1)]}                              ### falls es welche gibt, muss das rueckgaengig wieder rueckgaengig gemacht werden
  }
  if(first) {
     ret <- rbind_fill_vector(regmatches(string, regexpr(pattern, string), invert = TRUE))
  }
  ret[ret==""] <- NA                                                            ### keine leeren Strings, sondern NAs
  colnames(ret) <- colnames
  return(ret)}


