import 'package:adotei/animal.dart';
import 'package:adotei/gender.dart';

class MyAnimal {
  int id;
  Animal animal;
  String name;
  int age;
  Gender gender;
  String description;

  MyAnimal(
    this.id,
    this.animal,
    this.name,
    this.age,
    this.gender,
    this.description,
  );
}
