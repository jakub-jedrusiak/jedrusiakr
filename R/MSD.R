MSD <- function(df, var, ...) {
    if (!missing(...)) df <- filter(df, ...)
    M <- with(df, mean(var))
    SD <- with(df, sd(var))
    paste0("$M ", apa_num_pl(M), "$; $SD ", apa_num_pl(SD), "$")
}