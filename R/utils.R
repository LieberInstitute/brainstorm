
ss <- function(x, pattern, slot = 1, ...) {
    vapply(strsplit(x = x, split = pattern, ...), "[", character(1), slot)
}
