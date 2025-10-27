import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:progra_movil/database/users_flight.dart';

class P4Start extends StatefulWidget {
  const P4Start({super.key});

  @override
  State<P4Start> createState() => _P4StartState();
}

class _P4StartState extends State<P4Start> {
  UsersFlightDatabase? usersDB;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String? _selectedType;
  File? _image;

  void initState() {
    super.initState();
    usersDB = UsersFlightDatabase();
  }

  bool get isFormValid {
    return nameController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        _image != null &&
        _selectedType != null;
  }

  Widget _insert_user(BuildContext context) {
    void unsetData() {
      setState(() {
        nameController.clear();
        ageController.clear(); // o birthController si usas ese
        _image = null;
        _selectedType = null;
      });
    }

    Future<void> pickAndCropImage() async {
      final picker = ImagePicker();

      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Ajustar imagen',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            hideBottomControls: true,
          ),
          IOSUiSettings(
            title: 'Ajustar imagen',
            aspectRatioPickerButtonHidden: true,
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _image = File(croppedFile.path);
        });
      }
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Agregar usuario'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Imagen
            GestureDetector(
              onTap: pickAndCropImage,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[300],
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? const Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.black54,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),

            // Nombre
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Edad
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Edad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Tipo de usuario',
                border: OutlineInputBorder(),
              ),
              value: _selectedType,
              items: const [
                DropdownMenuItem(value: 'usuario', child: Text('Usuario')),
                DropdownMenuItem(value: 'admin', child: Text('Admin')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (isFormValid == false) {
              Fluttertoast.showToast(
                msg: 'Llena todas las casillas.',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            } else {
              usersDB!
                  .insert('tbl_users', {
                    "name": nameController.text,
                    "birth_date": ageController.text,
                    "image": _image != null ? _image!.path : '',
                    "type": _selectedType ?? 'usuario',
                    "state": 'activo',
                  })
                  .then((onValue) {
                    setState(() {});
                  })
                  .then((value) {
                    unsetData();
                  });
              Fluttertoast.showToast(
                msg: 'Se ha registrado el usuario correctamente.',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              Navigator.pop(context);
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USUARIOS/ADMINS'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => _insert_user(context),
              );
            },
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.blue[300],
                child: _buildUsers(
                  'usuario',
                  Colors.lightBlueAccent,
                  '/home/p4/user/home',
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.yellow[300],
                child: _buildUsers(
                  'admin',
                  Colors.amber,
                  '/home/p4/admin/home',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsers(String type, Color back, String route) {
    return FutureBuilder(
      future: usersDB!.select('tbl_users', type),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Hubo un error. \n${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.length == 0) {
          return Center(child: Text('No hay pelis'));
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final obj = snapshot.data![index];
            return Container(
              color: back,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.file(
                    File(obj.image!),
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 40,
                    child: Text(obj.name!, overflow: TextOverflow.ellipsis),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            route,
                            arguments: obj,
                          ).then((onValue) {
                            setState(() {});
                          });
                        },
                        icon: Icon(Icons.arrow_forward),
                        style: ButtonStyle(),
                      ),
                      /*    IconButton(
                                    onPressed: () async {
                                      return showDialog(
                                        context: context,
                                        builder: (context) =>
                                            _bildDialog(obj.id_user!),
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),*/
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _bildDialog(int id_user) {
    return AlertDialog(
      title: Text('Confirmación'),
      content: Text('Desea borrar el registro: $id_user'),
      actions: [
        TextButton(
          onPressed: () {
            usersDB!.delete('tbl_users', id_user).then((onValue) {
              var message = '';
              var color;
              if (onValue > 0) {
                message = "registro borrado exitosamente";
                color = Colors.green;
                setState(() {});
              } else {
                message = "registro NO borrado exitosamente";
                color = Colors.red;
              }
              Navigator.pop(context);
              return Fluttertoast.showToast(
                msg: message,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: color,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            });
          },
          child: Text('Aceptar', style: TextStyle(color: Colors.green)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
