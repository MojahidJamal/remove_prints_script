/// 1- to use this script download the dart file
/// 2- open any terminal and Navigate to the folder where you save the dart file on it
/// Example (if you saved it in C:/Users/yourUser/Downloads/scripts ) => cd C:/Users/yourUser/Downloads/scripts
/// 3- Run the Dart script by typing the following command: dart remove_prints.dart
/// 4- Enter the directory of your Flutter project when prompted. You should specify the directory where your .dart files are located, for example: C:/Users/yourUser/Documents/GitHub/youProjectName/lib
/// 5- now everything is fine and all prints are removed

import 'dart:io';

void removePrintsWithSingleQuotedFromFile(String filePath) {
  final file = File(filePath);
  final content = file.readAsStringSync();


  final pattern = RegExp(r'^\s*print\(.*?\);\s*', multiLine: true);
  final newContent = content.replaceAll(pattern, '\t');


  file.writeAsStringSync(newContent);
}
void removePrintsWithDoubleQuotedFromFile(String filePath) {

  final file = File(filePath);
  final content = file.readAsStringSync();


  final pattern = RegExp(r'^\s*print\(".*?"\);\s*', multiLine: true);
  final newContent = content.replaceAll(pattern, '\t');

  file.writeAsStringSync(newContent);
}

void removePrintsFromDirectory(Directory directory) {
  final entities = directory.listSync(recursive: true);
  for (var entity in entities) {
    if (entity is File && entity.path.endsWith('.dart')) {
      removePrintsWithSingleQuotedFromFile(entity.path);
      removePrintsWithDoubleQuotedFromFile(entity.path);
    }
  }
  stdout.write('All print statements have been removed.');
}

void main() {
  stdout.write('Enter the directory of your Flutter project: ');
  /// you should write the directory like this:  C:/Users/yourUser/Documents/GitHub/youProjectName/lib
  final directoryPath = stdin.readLineSync();

  if (directoryPath != null) {
    final directory = Directory(directoryPath);
    if (directory.existsSync()) {
      removePrintsFromDirectory(directory);
    } else {}
  } else {}
}
