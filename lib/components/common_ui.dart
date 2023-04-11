import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const primaryColor = Color.fromARGB(255, 224, 251, 252);
const canvasColor = Color.fromARGB(255, 37, 50, 55);
const scaffoldBackgroundColor = Color.fromARGB(255, 37, 50, 55);
const accentCanvasColor = Color.fromARGB(255, 49, 66, 73);
const white = Colors.white;
const gray = Colors.white60;
const borderColor = Color.fromARGB(255, 51, 67, 73);
final actionColor = Color.fromARGB(255, 37, 50, 55);

final divider = Divider(color: white.withOpacity(0.3), height: 1);

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Notes';
    default:
      return 'Not found page';
  }
}

double getPadding(bool isSmallScreen) {
  if (isSmallScreen) {
    return 20.0;
  }
  return 50.0;
}

FaIcon getEmotionIcon(String? emotion) {
  final iconsByEmotion = {
    "sadness": FontAwesomeIcons.solidFaceSadCry,
    "joy": FontAwesomeIcons.solidFaceGrin,
    "love": FontAwesomeIcons.solidFaceGrinHearts,
    "anger": FontAwesomeIcons.solidFaceAngry,
    "fear": FontAwesomeIcons.solidFaceGrimace,
    "surprise": FontAwesomeIcons.solidFaceSurprise
  };

  if (!iconsByEmotion.containsKey(emotion)) {
    return const FaIcon(FontAwesomeIcons.brain, color: Colors.grey);
  }

  return FaIcon(iconsByEmotion[emotion], color: Colors.white);
}
