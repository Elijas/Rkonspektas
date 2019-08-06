
# Funkcija suranda visus natūrinio skaičiaus x daliklius.
#
# Parametrai: x -- tikrinamas natūrinis skaičius.
# Rezultatas: d -- skaičiaus x daliklių vektorius.


visi.dalikliai <- function(x) {

  x <- as.integer(x)
  s <- seq_len(abs(x))
  d <- s[x %% s == 0L]

  return(d)
}
