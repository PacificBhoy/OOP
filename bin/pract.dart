import 'dart:async';
import 'dart:io';

class User {
  final String name;
  final int age;

  User(this.name, this.age);

  @override
  String toString() {
    return "Name: $name, Age: $age";
  }
}

Future<User> readUserFromFile(String filePath) async {
  try {
    final file = File(filePath);
    final contents = await file.readAsString();
    final lines = contents.split('\n');
    final name = lines[0];
    final age = int.parse(lines[1]);
    return User(name, age);
  } catch (e) {
    // Handle errors like file not found or parsing issues
    print("Error reading user data: $e");
    rethrow;
  }
}

// CREATING THE PARENT CLASS/SUPER CLASS
class Animal {
  //lets give the animal some attributes/characteristics
  String breed = "";
  // creating a function and displaying the class specification
  void display() {
    print("ANIMAL CLASS IS THE PARENT CLASS");
  }
}
//let us create the child class
class Cat extends Animal {
  // let us give it a function and displaying the class
  void meow() {
    print("$breed are very furry");
  }
}
//a class that implements an interface
abstract class Logger {
  void log(String message);
}

// Class implementing the Logger interface
class ConsoleLogger implements Logger {
  @override
  void log(String message) {
    print(message);
  }
}
//A class that overrides an inherited method
class Creature {
  void makeSound() {
    print("Generic animal sound");
  }
}

class Dog extends Creature {
  @override
  void makeSound() {
    print("Woof!");
  }
}

void printNumbers(int start, int end) {
  // Loop from start to end (inclusive)
  for (int i = start; i <= end; i++) {
    print(i);
  }
}
void main() {
  //create an object of the dog class
  var cat = Cat();
  cat.breed = "British Puff";
  cat.meow();
  //create an object for the superclass
  var animal = Animal();
  animal.display();

  // Create an instance of the ConsoleLogger
  Logger logger = ConsoleLogger();

  // Use the log method defined in the interface
  logger.log("This is a log message!");

   Creature creature = Creature(); // Create generic creature
  Dog dog = Dog(); // Create dog

  creature.makeSound(); // Prints "Generic animal sound"
  dog.makeSound(); // Prints "Woof!"

  // ignore: unused_element
  void main() async {
  final user = await readUserFromFile("user_data.txt");
  print(user);
}
printNumbers(1, 5); // Prints numbers from 1 to 5
}