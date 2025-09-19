import 'dart:math';

// ==================== SECTION 1: CLASSES ====================

// 1.1 Sample Task: Car Class (Already provided)
class Car {
  String make;
  String model;
  int year;

  Car(this.make, this.model, this.year);

  void displayInfo() {
    print('Car Information: $year $make $model');
  }
}

// 1.2 Task 2: Book Class
class Book {
  String title;
  String author;
  int numberOfPages;

  Book(this.title, this.author, this.numberOfPages);
}

// 1.3 Task 3: Student Class
class Student {
  String name;
  int age;
  List<double> grades;

  Student(this.name, this.age, this.grades);

  double calculateAverageGrade() {
    if (grades.isEmpty) return 0;
    double sum = grades.reduce((a, b) => a + b);
    return sum / grades.length;
  }
}

// 1.4 Task 4: Bank Account
class BankAccount {
  String accountNumber;
  String accountHolderName;
  double balance;

  BankAccount(this.accountNumber, this.accountHolderName, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$$amount. New balance: \$$balance');
  }

  void withdraw(double amount) {
    if (balance - amount < 0) {
      print('Error: Insufficient funds. Cannot withdraw \$$amount');
    } else {
      balance -= amount;
      print('Withdrawn: \$$amount. New balance: \$$balance');
    }
  }
}

// 1.5 Task 5: Rectangle Class with Getters
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double get area => width * height;
  double get perimeter => 2 * (width + height);
}

// ==================== SECTION 2: ENUMS ====================

// 2.1 Sample Task: Days of the Week (Already provided)
enum DaysOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

void checkDay(DaysOfWeek day) {
  switch (day) {
    case DaysOfWeek.saturday:
    case DaysOfWeek.sunday:
      print('$day is on the weekend!');
      break;
    default:
      print('$day is a weekday.');
  }
}

// 2.2 Task 2: Order Status
enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled
}

// 2.3 Task 3: Traffic Light
enum TrafficLight {
  red,
  yellow,
  green
}

String getTrafficAction(TrafficLight light) {
  switch (light) {
    case TrafficLight.red:
      return "Stop";
    case TrafficLight.yellow:
      return "Caution";
    case TrafficLight.green:
      return "Go";
  }
}

// 2.4 Task 4: User Roles
enum UserRole {
  admin,
  editor,
  guest
}

class User {
  String name;
  UserRole role;

  User(this.name, this.role);

  bool hasEditPermission() {
    return role == UserRole.admin || role == UserRole.editor;
  }
}

// 2.5 Task 5: Enums with Properties (Extended TrafficLight)
extension TrafficLightExtension on TrafficLight {
  int get durationInSeconds {
    switch (this) {
      case TrafficLight.red:
        return 30;
      case TrafficLight.yellow:
        return 5;
      case TrafficLight.green:
        return 45;
    }
  }
}

// ==================== SECTION 3: INHERITANCE ====================

// 3.1 Sample Task: Vehicle Hierarchy (Already provided)
class Vehicle {
  String make;
  String model;

  Vehicle(this.make, this.model);

  void display() {
    print('Vehicle: $make $model');
  }
}

class CarInherited extends Vehicle {
  int numberOfDoors;

  CarInherited(String make, String model, this.numberOfDoors) : super(make, model);

  @override
  void display() {
    super.display();
    print('Doors: $numberOfDoors');
  }
}

// 3.2 Task 2: Animal Sounds
class Animal {
  void makeSound() {
    print('Some generic animal sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Woof!');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('Meow!');
  }
}

// 3.3 Task 3: Shape Hierarchy
class Shape {
  String color;

  Shape(this.color);
}

class Circle extends Shape {
  double radius;

  Circle(String color, this.radius) : super(color);
}

class Square extends Shape {
  double sideLength;

  Square(String color, this.sideLength) : super(color);
}

// 3.4 Task 4: Employee and Manager
class Employee {
  String name;
  double baseSalary;

  Employee(this.name, this.baseSalary);

  double calculateSalary() {
    return baseSalary;
  }
}

class Manager extends Employee {
  double bonus;

  Manager(String name, double baseSalary, this.bonus) : super(name, baseSalary);

  @override
  double calculateSalary() {
    return baseSalary + bonus;
  }
}

// 3.5 Task 5: Library Items
class LibraryItem {
  String title;
  String id;

  LibraryItem(this.title, this.id);

  String getDetails() {
    return 'Item: $title (ID: $id)';
  }
}

class BookItem extends LibraryItem {
  String author;

  BookItem(String title, String id, this.author) : super(title, id);

  @override
  String getDetails() {
    return 'Book: $title by $author (ID: $id)';
  }
}

class DVD extends LibraryItem {
  String director;

  DVD(String title, String id, this.director) : super(title, id);

  @override
  String getDetails() {
    return 'DVD: $title directed by $director (ID: $id)';
  }
}

// ==================== SECTION 4: MIXINS ====================

// 4.1 Sample Task: Swimmer (Already provided)
mixin Swimmer {
  void swim() {
    print('Moving through the water...');
  }
}

class Human with Swimmer {
  String name;
  Human(this.name);
}

class Fish with Swimmer {
  String species;
  Fish(this.species);
}

// 4.2 Task 2: Flyer Mixin
mixin Flyer {
  void fly() {
    print('Taking off!');
  }
}

class Bird with Flyer {
  String type;
  Bird(this.type);
}

class Plane with Flyer {
  String model;
  Plane(this.model);
}

// 4.3 Task 3: Logger Mixin
mixin Logger {
  void log(String message) {
    print('[LOG] $message');
  }
}

class DataService with Logger {
  void fetchData() {
    this.log('Fetching data');
    // Simulate data fetching
    this.log('Data fetched successfully');
  }
}

// 4.4 Task 4: Validator Mixin
mixin Validator {
  bool isEmailValid(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool isPasswordStrong(String password) {
    return password.length > 8;
  }
}

class UserSignup with Validator {
  void validateInput(String email, String password) {
    print('Email valid: ${isEmailValid(email)}');
    print('Password strong: ${isPasswordStrong(password)}');
  }
}

// 4.5 Task 5: Combining Mixins
mixin Performer {
  void perform() {
    print('Performing on stage!');
  }
}

mixin Musician {
  void playInstrument() {
    print('Playing an instrument!');
  }
}

class Artist {
  String name;
  Artist(this.name);
}

class Dancer extends Artist with Performer {
  Dancer(String name) : super(name);
}

class Guitarist extends Artist with Performer, Musician {
  Guitarist(String name) : super(name);
}

// ==================== SECTION 5: POLYMORPHISM ====================

// 5.1 Sample Task: Shape Area (Already provided)
abstract class ShapePoly {
  double area();
}

class CirclePoly extends ShapePoly {
  double radius;
  CirclePoly(this.radius);

  @override
  double area() => pi * radius * radius;
}

class RectanglePoly extends ShapePoly {
  double width, height;
  RectanglePoly(this.width, this.height);

  @override
  double area() => width * height;
}

// 5.2 Task 2: Weapon Actions
class Weapon {
  void action() {
    print('Using weapon!');
  }
}

class Sword extends Weapon {
  @override
  void action() {
    print('Swinging!');
  }
}

class Bow extends Weapon {
  @override
  void action() {
    print('Firing!');
  }
}

// 5.3 Task 3: Animal Feeder
class AnimalPoly {
  void eat() {
    print('Eating food.');
  }
}

class Lion extends AnimalPoly {
  @override
  void eat() {
    print('Eating meat.');
  }
}

class Goat extends AnimalPoly {
  @override
  void eat() {
    print('Eating grass.');
  }
}

void feed(AnimalPoly animal) {
  animal.eat();
}

// 5.4 Task 4: Payment Processing
abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCard extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paying \$$amount with Credit Card');
  }
}

class PayPal extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paying \$$amount with PayPal');
  }
}

void processPayment(PaymentMethod method, double amount) {
  method.pay(amount);
}

// 5.5 Task 5: Data Formatting System
abstract class DataFormatter {
  String format(Map<String, dynamic> data);
}

class JSONFormatter extends DataFormatter {
  @override
  String format(Map<String, dynamic> data) {
    // Simple JSON-like string representation
    String result = '{';
    data.forEach((key, value) {
      result += '"$key": "$value", ';
    });
    if (result.length > 1) {
      result = result.substring(0, result.length - 2);
    }
    result += '}';
    return result;
  }
}

class KeyValueFormatter extends DataFormatter {
  @override
  String format(Map<String, dynamic> data) {
    String result = '';
    data.forEach((key, value) {
      result += '$key: $value\n';
    });
    return result.trim();
  }
}

// ==================== SECTION 6: ASYNC PROGRAMMING ====================

// 6.1 Sample Task: Fetch User Data (Already provided)
Future<Map<String, dynamic>> fetchUserData() async {
  print('Fetching user data...');
  await Future.delayed(Duration(seconds: 2));
  print('Data fetched!');
  return {'id': 101, 'name': 'Alice'};
}

// 6.2 Task 2: Simple Future with .then()
Future<String> generateReport() {
  return Future.delayed(Duration(seconds: 1), () => 'Report generated!');
}

// 6.3 Task 3: Rewriting with async/await (handled in main)

// 6.4 Task 4: Chaining Async Calls
Future<int> fetchUserId() async {
  await Future.delayed(Duration(seconds: 1));
  return 123;
}

Future<String> fetchUserDetails(int userId) async {
  await Future.delayed(Duration(seconds: 1));
  return 'John Doe (ID: $userId)';
}

// 6.5 Task 5: Concurrent Futures
Future<String> fetchConfiguration() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Configuration loaded';
}

Future<String> loadResources() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Resources loaded';
}

// ==================== SECTION 7: EXCEPTIONS ====================

// 7.1 Sample Task: Division (Already provided)
void divide(int a, int b) {
  try {
    var result = a ~/ b;
    print('Result: $result');
  } on IntegerDivisionByZeroException {
    print('Error: Cannot divide by zero.');
  } catch (e) {
    print('An unexpected error occurred: $e');
  }
}

// 7.2 Task 2: Index Out of Bounds
void getElementAtIndex(List list, int index) {
  try {
    print('Element at index $index: ${list[index]}');
  } on RangeError {
    print('Error: Invalid index.');
  }
}

// 7.3 Task 3: FormatException
void parseAge(String input) {
  try {
    int age = int.parse(input);
    print('Age is: $age');
  } on FormatException {
    print('Error: "$input" is not a valid number.');
  }
}

// 7.4 Task 4: Custom Exception
class InvalidInputException implements Exception {
  String message;
  InvalidInputException(this.message);
}

void processText(String text) {
  if (text.isEmpty) {
    throw InvalidInputException('Input string cannot be empty');
  }
  print('Processing: $text');
}

// 7.5 Task 5: Finally Block
void databaseOperation(bool shouldFail) {
  try {
    print('Opening database connection...');
    if (shouldFail) {
      throw Exception('Database read error');
    }
    print('Reading data from database...');
  } catch (e) {
    print('Error occurred: $e');
  } finally {
    print('Database connection closed.');
  }
}

// ==================== MAIN FUNCTION ====================

void main() async {
  print('========== SECTION 1: CLASSES ==========\n');
  
  // 1.1 Car Class
  print('1.1 Car Class:');
  var myCar = Car('Toyota', 'Corolla', 2022);
  myCar.displayInfo();
  print('');

  // 1.2 Book Class
  print('1.2 Book Class:');
  var myBook = Book('1984', 'George Orwell', 328);
  print('Book: ${myBook.title} by ${myBook.author}, ${myBook.numberOfPages} pages');
  print('');

  // 1.3 Student Class
  print('1.3 Student Class:');
  var student = Student('John', 20, [85.5, 90.0, 78.5, 92.0]);
  print('Student: ${student.name}, Age: ${student.age}');
  print('Average grade: ${student.calculateAverageGrade().toStringAsFixed(2)}');
  print('');

  // 1.4 Bank Account
  print('1.4 Bank Account:');
  var account = BankAccount('ACC001', 'Jane Doe', 1000.0);
  account.deposit(500);
  account.withdraw(200);
  account.withdraw(2000); // Should fail
  print('');

  // 1.5 Rectangle with Getters
  print('1.5 Rectangle Class:');
  var rect = Rectangle(5.0, 3.0);
  print('Rectangle dimensions: ${rect.width} x ${rect.height}');
  print('Area: ${rect.area}');
  print('Perimeter: ${rect.perimeter}');
  print('');

  print('========== SECTION 2: ENUMS ==========\n');

  // 2.1 Days of Week
  print('2.1 Days of Week:');
  checkDay(DaysOfWeek.monday);
  checkDay(DaysOfWeek.saturday);
  print('');

  // 2.2 Order Status
  print('2.2 Order Status:');
  OrderStatus status = OrderStatus.shipped;
  print('Current order status: $status');
  print('');

  // 2.3 Traffic Light
  print('2.3 Traffic Light:');
  for (var light in TrafficLight.values) {
    print('$light: ${getTrafficAction(light)}');
  }
  print('');

  // 2.4 User Roles
  print('2.4 User Roles:');
  var admin = User('Admin User', UserRole.admin);
  var guest = User('Guest User', UserRole.guest);
  print('${admin.name} has edit permission: ${admin.hasEditPermission()}');
  print('${guest.name} has edit permission: ${guest.hasEditPermission()}');
  print('');

  // 2.5 Enums with Properties
  print('2.5 Traffic Light Durations:');
  for (var light in TrafficLight.values) {
    print('$light: ${light.durationInSeconds} seconds');
  }
  print('');

  print('========== SECTION 3: INHERITANCE ==========\n');

  // 3.1 Vehicle Hierarchy
  print('3.1 Vehicle Hierarchy:');
  var myInheritedCar = CarInherited('Honda', 'Civic', 4);
  myInheritedCar.display();
  print('');

  // 3.2 Animal Sounds
  print('3.2 Animal Sounds:');
  var dog = Dog();
  var cat = Cat();
  dog.makeSound();
  cat.makeSound();
  print('');

  // 3.3 Shape Hierarchy
  print('3.3 Shape Hierarchy:');
  var circle = Circle('red', 5.0);
  var square = Square('blue', 4.0);
  print('Circle: color=${circle.color}, radius=${circle.radius}');
  print('Square: color=${square.color}, side=${square.sideLength}');
  print('');

  // 3.4 Employee and Manager
  print('3.4 Employee and Manager:');
  var emp = Employee('John', 50000);
  var mgr = Manager('Jane', 60000, 10000);
  print('${emp.name} salary: \$${emp.calculateSalary()}');
  print('${mgr.name} salary: \$${mgr.calculateSalary()}');
  print('');

  // 3.5 Library Items
  print('3.5 Library Items:');
  var book = BookItem('The Great Gatsby', 'BK001', 'F. Scott Fitzgerald');
  var dvd = DVD('Inception', 'DV001', 'Christopher Nolan');
  print(book.getDetails());
  print(dvd.getDetails());
  print('');

  print('========== SECTION 4: MIXINS ==========\n');

  // 4.1 Swimmer Mixin
  print('4.1 Swimmer Mixin:');
  var person = Human('Alice');
  var fish = Fish('Tuna');
  person.swim();
  fish.swim();
  print('');

  // 4.2 Flyer Mixin
  print('4.2 Flyer Mixin:');
  var bird = Bird('Eagle');
  var plane = Plane('Boeing 747');
  bird.fly();
  plane.fly();
  print('');

  // 4.3 Logger Mixin
  print('4.3 Logger Mixin:');
  var dataService = DataService();
  dataService.fetchData();
  print('');

  // 4.4 Validator Mixin
  print('4.4 Validator Mixin:');
  var userSignup = UserSignup();
  userSignup.validateInput('user@example.com', 'password123');
  userSignup.validateInput('invalid-email', 'weak');
  print('');

  // 4.5 Combining Mixins
  print('4.5 Combining Mixins:');
  var dancer = Dancer('Alice');
  var guitarist = Guitarist('Bob');
  print('Dancer ${dancer.name}:');
  dancer.perform();
  print('Guitarist ${guitarist.name}:');
  guitarist.perform();
  guitarist.playInstrument();
  print('');

  print('========== SECTION 5: POLYMORPHISM ==========\n');

  // 5.1 Shape Areas
  print('5.1 Shape Areas:');
  List<ShapePoly> shapes = [CirclePoly(5.0), RectanglePoly(4.0, 6.0)];
  for (var shape in shapes) {
    print('A ${shape.runtimeType} has an area of: ${shape.area().toStringAsFixed(2)}');
  }
  print('');

  // 5.2 Weapon Actions
  print('5.2 Weapon Actions:');
  List<Weapon> weapons = [Sword(), Bow()];
  for (var weapon in weapons) {
    weapon.action();
  }
  print('');

  // 5.3 Animal Feeder
  print('5.3 Animal Feeder:');
  var lion = Lion();
  var goat = Goat();
  feed(lion);
  feed(goat);
  print('');

  // 5.4 Payment Processing
  print('5.4 Payment Processing:');
  var creditCard = CreditCard();
  var paypal = PayPal();
  processPayment(creditCard, 100.0);
  processPayment(paypal, 50.0);
  print('');

  // 5.5 Data Formatting
  print('5.5 Data Formatting:');
  Map<String, dynamic> sampleData = {'name': 'John', 'age': 30, 'city': 'NYC'};
  List<DataFormatter> formatters = [JSONFormatter(), KeyValueFormatter()];
  for (var formatter in formatters) {
    print('${formatter.runtimeType}:');
    print(formatter.format(sampleData));
    print('');
  }

  print('========== SECTION 6: ASYNC PROGRAMMING ==========\n');

  // 6.1 Fetch User Data
  print('6.1 Fetch User Data:');
  print('Program started.');
  var userData = await fetchUserData();
  print('User Name: ${userData['name']}');
  print('');

  // 6.2 Simple Future with .then()
  print('6.2 Simple Future with .then():');
  generateReport().then((result) {
    print(result);
  });
  await Future.delayed(Duration(seconds: 2)); // Wait for completion
  print('');

  // 6.3 Rewriting with async/await
  print('6.3 Async/Await version:');
  String report = await generateReport();
  print(report);
  print('');

  // 6.4 Chaining Async Calls
  print('6.4 Chaining Async Calls:');
  int userId = await fetchUserId();
  String userDetails = await fetchUserDetails(userId);
  print('User details: $userDetails');
  print('');

  // 6.5 Concurrent Futures
  print('6.5 Concurrent Futures:');
  print('Starting concurrent operations...');
  await Future.wait([fetchConfiguration(), loadResources()]);
  print('System Ready');
  print('');

  print('========== SECTION 7: EXCEPTIONS ==========\n');

  // 7.1 Division
  print('7.1 Division:');
  divide(10, 2);
  divide(10, 0);
  print('');

  // 7.2 Index Out of Bounds
  print('7.2 Index Out of Bounds:');
  var list = [1, 2, 3];
  getElementAtIndex(list, 1);
  getElementAtIndex(list, 5);
  print('');

  // 7.3 FormatException
  print('7.3 FormatException:');
  parseAge('25');
  parseAge('abc');
  print('');

  // 7.4 Custom Exception
  print('7.4 Custom Exception:');
  try {
    processText('Valid text');
    processText('');
  } catch (e) {
    if (e is InvalidInputException) {
      print('Error: ${e.message}');
    }
  }
  print('');

  // 7.5 Finally Block
  print('7.5 Finally Block:');
  databaseOperation(false);
  print('---');
  databaseOperation(true);
  
  print('\n========== ALL EXERCISES COMPLETED ==========');
}