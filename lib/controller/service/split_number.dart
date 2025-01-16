extension NumberParsing on String {
  String formatNumber() {
    // Convert the number to a string
    String numberString = toString();

    // Reverse the string to make splitting easier
    String reversedNumber = numberString.split('').reversed.join('');

    // Use RegExp to split the string into chunks of three characters
    String splitNumber = reversedNumber.replaceAllMapped(
        RegExp(r'.{1,3}'), (Match match) => '${match.group(0)},');

    // Reverse the string back and remove the trailing comma
    String finalResult =
        splitNumber.split('').reversed.join('').replaceFirst(',', '');

    return finalResult;
  }
}

extension NumberParsingOnDouble on double {
  String formatNumber() {
    // Convert the number to a string
    String numberString = toString();

    // Reverse the string to make splitting easier
    String reversedNumber = numberString.split('').reversed.join('');

    // Use RegExp to split the string into chunks of three characters
    String splitNumber = reversedNumber.replaceAllMapped(
        RegExp(r'.{1,3}'), (Match match) => '${match.group(0)},');

    // Reverse the string back and remove the trailing comma
    String finalResult =
        splitNumber.split('').reversed.join('').replaceFirst(',', '');

    return finalResult;
  }
}
