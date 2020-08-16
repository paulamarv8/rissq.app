function(input, output, session) {

  #Home
  source("server/01-home-srv.R", local = TRUE)

  source("server/10-process-overview-srv.R", local = TRUE)
  source("server/11-process-msa-srv.R", local = TRUE)
  source("server/12-process-spc-srv.R", local = TRUE)
  source("server/13-process-as-srv.R", local = TRUE)
  source("server/14-process-io-srv.R", local = TRUE)

  source("server/20-documentation-srv.R", local = TRUE)
}
