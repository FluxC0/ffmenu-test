
import 'dart:io';
import 'dart:math';
import 'ffmenu.dart';
class Extra {
  void load(int loadInterval) { // makes a fake loading thing.
    var MenuList  = ["finding bugs",
                     "reading fortunes",
                     "swatting at flies",
                     "fartin' around",
                     "writing more loading messages",
                     "pondering the orb",
                     "banging head against wall",
                     "questioning the validity of this loading screen.",
                    "Testing burger tech",
                    "Dabbling in Quantum Physics",
                    "Screaming at the Dart Compiler"];
    num randNumPercent = Random().nextInt(loadInterval); // The percent displayed.
    int listSelRand = Random().nextInt(MenuList.length); // A randomized integer from the amount in the list.
    while (randNumPercent < 100) {
      print("$randNumPercent% loaded! Status: ${MenuList[listSelRand]} ");
      sleep(Duration(seconds: Random().nextInt(3)));
      num tmpNum = Random().nextInt(loadInterval) + randNumPercent;
      randNumPercent = tmpNum;
      listSelRand = Random().nextInt(MenuList.length);
      clearConsole();
    } 
  }

  String coherencyInator(var item,) { /* This changes True and False to simpler things,
    to give the vibe of it actually being from a fast food resturant. */
    if (item == true) {
      return "Yes";
    }
    else {
      return "No";
    }
  }
  
  void randMenuItem() // Gives a random Menu item
  {
    List<MenuItem> allItems = parseJsonMenu('resources/menu.json');
    load(20);
    var item = allItems[Random().nextInt(allItems.length)];
    print(""" ## Random Menu Item Gen ##

    Name: ${item.name}
    Vegan? ${coherencyInator(item.isVegan)}
    Low Calorie? ${coherencyInator(item.isLowCal)}
              
              """);

  }
}