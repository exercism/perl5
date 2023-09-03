# Hints

## General

- Don't forget to export the three public subroutines.
  List them in the `@EXPORT_OK` array.

## 1. Check if a given date is in the past

- For parsing date strings, the strings will be given in ISO 8601 format.
  Use the `$STRPTIME_FORMAT` package variable.
- The `Time::Piece->strptime` or `DateTime::Tiny->from_string` methods will be useful.

## 2. Check if a given date is in the afternoon

- "Afternoon" begins at noon and ends before 18:00.

## 3. Parse a date into a string describing an appointment

- Use `mm/dd/yyyy` for the output date format.
  For example: 12/31/2021
- The output time format uses the hour in the range 0-12 with no leading zero or space, and uppercase ampm indicator.
  For example: 7:59 PM
- If you use the Time::Piece module, the `strftime` method is appropriate.
