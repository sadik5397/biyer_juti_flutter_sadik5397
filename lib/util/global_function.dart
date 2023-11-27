import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

initialConfiguration() {
  // ignore: avoid_print
  print("---- Biyer Juti | User App ----\n---- "
      "© Developed by : S.a. Sadik | DM Bikash ----\n---- "
      "sadik5397@gmail.com | bikash.workplace@gmail.com ----\n---- "
      "https://github.com/sadik5397 | https://github.com/dmbikash ----");
}

String currencyDigit(num num) => NumberFormat("##,##,##,###.##", "en").format(num);

randomNumber(int max) {
  Random random = Random();
  return random.nextInt(max);
}

randomNumberBetween(int min, int max) {
  Random random = Random();
  return random.nextInt(max) + min;
}

String capitalizeAllWord(var value) {
  value = value.toString();
  if (value == "") {
    return value;
  } else {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      (value[i - 1] == " ") ? result = result + value[i].toUpperCase() : result = result + value[i];
    }
    return result;
  }
}

String capitalizeFirstCharacterOfSentence(var value) {
  value = value.toString();
  if (value == "") {
    return value;
  } else {
    var result = value[0].toUpperCase();
    for (int i = 1; i < value.length; i++) {
      result = result + value[i];
    }
    return result;
  }
}

String cleanedString(var input) => capitalizeAllWord(input.toString().replaceAll("_", " ").replaceAll("{", "").replaceAll("}", "").replaceAll("[", "").replaceAll("]", "").replaceAll(", ", "\n"));

String prettyJson(dynamic map) {
  var encoder = const JsonEncoder.withIndent("     ");
  return encoder.convert(map);
}

String extractBase64FromDataUri(String? dataUri) {
  if (dataUri == null) {
    return "";
  } else {
    List<String> parts = dataUri.split(',');
    if (parts.length >= 2) {
      return parts[1];
    } else {
      return parts[0];
    }
  }
}

Future<Size> getImageDimensions(Uint8List uint8ListImage) async {
  // Decode the Uint8List into an Image
  final ui.Codec codec = await ui.instantiateImageCodec(uint8ListImage);
  final ui.FrameInfo frameInfo = await codec.getNextFrame();
  final ui.Image image = frameInfo.image;

  // Get the width and height of the image
  final double width = image.width.toDouble();
  final double height = image.height.toDouble();

  return Size(width, height);
}

class DefaultImage {
  static String placeholderImage = "https://i.ibb.co/0JQ0Fng/image.png";
  static String placeholderImageBase64 =
      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAA+gAAAPoCAIAAADCwUOzAAAgAElEQVR4nOzd0XYbR9am6b0jEgBJSa7qnu41939pczoH/6y/2pZEABkxB0nSkstymTYlcBPPs2qVaVmWU5YMvgwkPuT/8//+dwAAAK9bu/QFAAAA/5lwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABwh0AAAoQ7gAAUIBwBwCAAoQ7AAAUINwBAKAA4Q4AAAUIdwAAKEC4AwBAAcIdAAAKEO4AAFCAcAcAgAKEOwAAFCDcAQCgAOEOAAAFCHcAAChAuAMAQAHCHQAAChDuAABQgHAHAIAChDsAABQg3AEAoADhDgAABQh3AAAoQLgDAEABy6UvAC5pzb6ua4/o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";
}
