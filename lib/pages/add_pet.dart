import 'package:adotei/custom_colors.dart';
import 'package:adotei/gender.dart';
import 'package:flutter/material.dart';

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

  int age = 1;
  bool get minorAge => age == 1;

  void addAge() {
    setState(() {
      age++;
      ageController.text = '$age anos';
    });
  }

  void decreaseAge() {
    setState(() {
      age--;
      ageController.text = '$age anos';
    });
  }

  @override
  void initState() {
    super.initState();
    ageController.text = '$age anos';
  }

  Gender? _gender = Gender.male;

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildTextField('Nome', 10, 1, nameController),
                Row(
                  children: [
                    const Text('Idade'),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: CustomColors.green),
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
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: CustomColors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: CustomColors.green),
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
