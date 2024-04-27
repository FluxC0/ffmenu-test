import 'dart:io';
import 'dart:convert';


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
4. Exit
""");
print("Select Option");
int? chc = int.parse(stdin.readLineSync()!);
if (1 <= chc && chc <= 4) {
  return chc;
  
}
else {
  print("Invalid Choice.");
  sleep(Duration(seconds: 3));
  clearConsole();
  return 0;
} 
}

void main() {
  int chc = spawnMenu();


  switch(chc) {
      case(0):
        chc = spawnMenu();
      case 1:
      List<MenuItem> allItems = parseJsonMenu('/home/runner/Fast-Food-Menu/ffmenu/resources/menu.json');
      for (var i = 0; i < allItems.length; i++) {
        var item = allItems[i];
        print("${i + 1}. ${item}: ${item.name}");
      }
      
      case(2):
        // TODO: Stuff..
      case(3):
        // TODO: Stuff..
      case(4):
        exit(0);
  }  
  
}