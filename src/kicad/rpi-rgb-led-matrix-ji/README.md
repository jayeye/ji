This is a reworking of [https://github.com/hzeller/rpi-rgb-led-matrix/tree/master/adapter](https://github.com/hzeller/rpi-rgb-led-matrix/tree/master/adapter).

* Both versions will work on both a _zero_ and an ordinary RPi.
  - Some 64-row panels have a fifth address pin, labeled **E**, either
    at pin 4 or pin 8. Use the corresponding solder jumper to
    accommodate those panels. Obviously, you cannot mix 32- and 64-row
    panels on the same chain.
* The _zero_ version is meant to be plugged into an RPi Zero/ZeroW and
  then the whole thing plugged directly into the HUB75
  connector. Obviously only the middle 16 pins are used, but the
  20-pin header makes it a lot easier to properly center it.
* The _hat_ version can be built without the ID EEPROM (only then it cannot be called a HAT!).
  - Do not install R4/R5/R6/U5 if you do not care about the ID EEPROM functionality.
  - If you trust your power source to power the circuit, _and_ you
    never intend to also plug in a micro-USB adaptor, you can also not
    install the 'virtual diode' circuitry (Q1/Q2/R2/R3), and instead short
    points SP1/SP2 on the rear of the board.