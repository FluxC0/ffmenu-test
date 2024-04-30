import 'dart:io';
import 'dart:convert';
import 'ex.dart';
var extra = new Extra();
class MenuItem {
  late String name;
  late bool isVegan;
  late bool isLowCal;
  MenuItem(this.name, this.isVegan, this.isLowCal);

  @override
  String toString() {
    return 'Name: $name, Vegan: $isVegan, Low Cal: $isLowCal';
  }
}
List<MenuItem> parseJsonMenu(String filePath) {
  File file = File(filePath);
  List<dynamic> jsonList = jsonDecode(file.readAsStringSync())['items'];

  return jsonList.map((item) {
    return MenuItem(item['name'], item['isVegan'], item['isLowCal']);
  }).toList();
}



void clearConsole() {
  if (Platform.isWindows) {
    // For Windows
    stdout.write('\x1B[2J\x1B[0f');
  } else {
    // For other platforms (Unix based)
    stdout.write('\x1B[2J\x1B[H');
  }
}

int spawnMenu() {
  print("""
    ###############
    Fast Food Place
    ###############

    1. View Items
    2. View Vegan Items
    3. View Low-Calorie Items
    4. View Random Item
    5. Exit
    """);
  print("Select Option");
  int chc;
  try {
    chc = int.parse(stdin.readLineSync()!);
    if (chc >= 1 && chc <= 4) {
      return chc;
    } else {
      print("Invalid Choice. Please select a number between 1 and 4.");
      sleep(Duration(seconds: 3));
      clearConsole();
      return 0;
    }
  } catch (e) {
    print("Invalid Choice. Please enter a valid number.");
    sleep(Duration(seconds: 3));
    clearConsole();
    return 0;
  }
}
void main() {
  int chc = spawnMenu();

  switch(chc) {
      case 0:
        // Code for case 0
        break;

      case 1:
        List<MenuItem> allItems1 = parseJsonMenu('resources/menu.json');
        extra.load(10);
        for (var i = 0; i < allItems1.length; i++) {
          var item = allItems1[i];
          print("${i + 1}: ${item.name}");
        }
        break;

      case 2:
        List<MenuItem> allItems2 = parseJsonMenu('resources/menu.json');
        for (var i = 0; i < allItems2.length; i++) {
          var item = allItems2[i];
          if (item.isVegan == true) {
            print("${i+1}: ${item.name}");
          }
        }
        break;

      case 3:
        List<MenuItem> allItems3 = parseJsonMenu('resources/menu.json');
        for (var i = 0; i < allItems3.length; i++) {
          var item = allItems3[i];
          if (item.isLowCal == true) {
            print("${i+1}: ${item.name}");
          }
        }
        break;

      case 4:
        extra.randMenuItem();
        break;
    case 5:
      exit(0);
  }
  
  
}