
.check_cols <- function(table, check_colnames, table_name = "table"){
  table_colnames <- colnames(table)
  if(!all(check_colnames %in% table_colnames)){
    missing_cn = check_colnames[!check_colnames %in% table_colnames]
    stop(paste(missing_cn, collapse = ", "), " Missing from ", table_name)
  } else{
    return(NULL)
  }
}
