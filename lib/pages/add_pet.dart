import 'package:adotei/animal.dart';
import 'package:adotei/custom_colors.dart';
import 'package:adotei/custom_icons.dart';
import 'package:adotei/gender.dart';
import 'package:adotei/model/animal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddPet extends StatefulWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  State<AddPet> createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final ageController = TextEditingController();

  String? errorText;

  int _age = 1;
  bool get minorAge => _age == 1;

  void addAge() {
    setState(() {
      _age++;
      ageController.text = '$_age anos';
    });
  }

  void decreaseAge() {
    setState(() {
      _age--;
      ageController.text = '$_age anos';
    });
  }

  @override
  void initState() {
    super.initState();
    ageController.text = '$_age anos';
  }

  Gender? _gender;
  Animal? _animal;
  String? textButton = 'Classificação';

  List<MyAnimal> animal = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.white,
        iconTheme: const IconThemeData(color: CustomColors.green),
        title: const Text(
          'Novo Pet',
          style: TextStyle(
            color: CustomColors.green,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: CustomColors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: CustomColors.background,
          ),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              buildTextField('Nome', 10, 1, nameController),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Row(
                        children: [
                          SvgPicture.asset(
                            CustomIcons.pawprint,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Selecione o pet')
                        ],
                      ),
                      content: StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Radio<Animal>(
                                    activeColor: CustomColors.darkBrown,
                                    value: Animal.cat,
                                    groupValue: _animal,
                                    onChanged: (Animal? value) {
                                      setState(() {
                                        _animal = value;
                                      });
                                    },
                                  ),
                                  const Text('Gato')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<Animal>(
                                    activeColor: CustomColors.darkBrown,
                                    value: Animal.dog,
                                    groupValue: _animal,
                                    onChanged: (Animal? value) {
                                      setState(() {
                                        _animal = value;
                                      });
                                    },
                                  ),
                                  const Text('Cachorro')
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              switch (_animal) {
                                case (Animal.cat):
                                  textButton = 'Gato';
                                  break;
                                case (Animal.dog):
                                  textButton = 'Cachorro';
                                  break;
                                default:
                                  textButton = 'Classificação';
                                  break;
                              }
                            });
                          },
                          child: const Text('Ok'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancelar'),
                        ),
                      ],
                      elevation: 24,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('$textButton'),
                ),
                style: ElevatedButton.styleFrom(primary: CustomColors.green),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text('Idade'),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: minorAge
                            ? CustomColors.brown
                            : CustomColors.darkBrown),
                    onPressed: () {
                      minorAge ? null : decreaseAge();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.remove),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      enabled: false,
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        fillColor: CustomColors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: CustomColors.darkBrown),
                    onPressed: () {
                      addAge();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Sexo'),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Radio<Gender>(
                        activeColor: CustomColors.darkBrown,
                        value: Gender.male,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      const Text('Macho')
                    ],
                  ),
                  Row(
                    children: [
                      Radio<Gender>(
                        activeColor: CustomColors.darkBrown,
                        value: Gender.female,
                        groupValue: _gender,
                        onChanged: (Gender? value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      const Text('Fêmea')
                    ],
                  ),
                ],
              ),
              buildTextField('Descrição', 300, 10, descriptionController),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String animal;
                    int age = _age;
                    String gender;
                    String description = descriptionController.text;

                    if (name.isEmpty || description.isEmpty) {
                      setState(() {
                        errorText = 'Este campo deve ser preenchido';
                      });
                      return;
                    }
                    setState(() {
                      errorText = null;
                    });

                    switch (_animal) {
                      case (Animal.cat):
                        animal = 'Gato';
                        break;
                      case (Animal.dog):
                        animal = 'Cachorro';
                        break;
                      default:
                        animal = 'Indefinido';
                        break;
                    }

                    if (_gender == Gender.male) {
                      gender = 'Macho';
                    } else {
                      gender = 'Fêmea';
                    }

                    MyAnimal myanimal = MyAnimal(
                      1,
                      animal,
                      name,
                      age,
                      gender,
                      description,
                    );

                    this.animal.add(myanimal);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Salvar'),
                  ),
                  style: ElevatedButton.styleFrom(primary: CustomColors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, int length, int lines, controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        maxLines: lines,
        maxLength: length,
        decoration: InputDecoration(
          hintText: label,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: CustomColors.white,
          filled: true,
          errorText: errorText,
        ),
      ),
    );
  }
}
