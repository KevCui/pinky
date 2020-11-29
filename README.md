# pinky

> Generate PIN codes from letters using phone keypad layout

## How it works

Pinky.sh (pin-key) is a Bash script used to generate PIN code. It simply maps letters to numbers according to [phone keypad layout](https://en.wikipedia.org/wiki/Telephone_keypad):

| Number | Letter |
| ------ | ------ |
| 9      | WXYZ   |
| 8      | TUV    |
| 7      | PQRS   |
| 6      | MNO    |
| 5      | JKL    |
| 4      | GHI    |
| 3      | DEF    |
| 2      | ABC    |
| 1      | others |
| 0      | +      |

## Usage

```
Usage:
  ./pinky.sh <letters>
  OR
  ./pinky.sh
  Enter letter(s): <letters>
```

### Example

```bash
$ ./pinky.sh test
8378
```

```bash
$ ./pinky.sh
Enter letter(s): test
8378
```

---

<a href="https://www.buymeacoffee.com/kevcui" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-orange.png" alt="Buy Me A Coffee" height="60px" width="217px"></a>