# Author: John Ioannidis <ji@tla.org>
# Beer license: if you like this, buy me a beer next time we meet.

# https://en.wikipedia.org/wiki/E_series_of_preferred_numbers

import math

def eseries(m):
  l10 = math.log(10)
  return [round(math.exp(i * l10 / m), 2) for i in range(m)]

e192 = eseries(192)
e192[185] = 9.20     # why, we'll never know
e96 = e192[::2]
e48 = e192[::4]
e24 = [
  1.0, 1.1,
  1.2, 1.3,
  1.5, 1.6,
  1.8, 2.0,
  2.2, 2.4,
  2.7, 3.0,
  3.3, 3.6,
  3.9, 4.3,
  4.7, 5.1,
  5.6, 6.2,
  6.8, 7.5,
  8.2, 9.1,
]
e12 = e24[::2]
