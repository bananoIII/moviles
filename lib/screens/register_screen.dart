import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _image;

  TextEditingController conUser = TextEditingController();
  TextEditingController conName = TextEditingController();
  TextEditingController conPwd = TextEditingController();
  TextEditingController conPwd2 = TextEditingController();

  bool isValidation = !true;
  bool _obscureText = true;
  bool _obscureText2 = true;

  bool get isFormValid {
    return conUser.text.isNotEmpty &&
        conName.text.isNotEmpty &&
        conPwd.text.isNotEmpty &&
        conPwd2.text.isNotEmpty &&
        _image != null;
  }

  void clearForm() {
    conUser.clear();
    conName.clear();
    conPwd.clear();
    conPwd2.clear();
    setState(() {
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _pickAndCropImage() async {
      final picker = ImagePicker();

      // Seleccionar imagen desde galería
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      // Recortar imagen
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

    final txtUser = TextField(
      keyboardType: TextInputType.emailAddress,
      controller: conUser,
      decoration: InputDecoration(hintText: 'Correo electrónico'),
    );
    final txtName = TextField(
      keyboardType: TextInputType.text,
      controller: conName,
      decoration: InputDecoration(hintText: 'Nombre'),
    );
    final txtPwd = TextField(
      keyboardType: TextInputType.text,
      controller: conPwd,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
    final txtPwd2 = TextField(
      keyboardType: TextInputType.text,
      controller: conPwd2,
      obscureText: _obscureText2,
      decoration: InputDecoration(
        hintText: 'Confirmar contraseña',
        suffixIcon: IconButton(
          icon: Icon(_obscureText2 ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _obscureText2 = !_obscureText2;
            });
          },
        ),
      ),
    );

    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(conUser.text);

    final bool passwordValid = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    ).hasMatch(conPwd.text);

    List<String> errors = [];

    final btnRegister = IconButton(
      onPressed: isFormValid
          ? () {
              if (!emailValid)
                errors.add('La estructura del correo es inválida.');

              if (conPwd.text != conPwd2.text)
                errors.add('Las contraseñas no coinciden.');
              if (!passwordValid)
                errors.add(
                  'La estructura de la constrasña debe ser:\n->Minimo 8 caracteres\n->Al menos una minuscula\n->Al menos una mayuscula\n->Al menos un numero\n->Al menos un caracter especial',
                );

              if (errors.isNotEmpty) {
                Fluttertoast.showToast(
                  msg: errors.join('\n'), // muestra todos los errores
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
                errors.clear();
              } else {
                isValidation = true;
                setState(() {});
                Future.delayed(Duration(milliseconds: 2000))
                    .then((_) {
                      isValidation = false;
                    })
                    .then((_) {
                      Fluttertoast.showToast(
                        msg:
                            'Se ha registrado correctamente.', // muestra todos los errores
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    })
                    .then((_) {
                      clearForm();
                    });
              }
            }
          : null,
      icon: Icon(
        Icons.app_registration,
        color: isFormValid ? Colors.green : Colors.red,
      ),
    );

    final imageSelecter = Column(
      children: [
        ElevatedButton.icon(
          icon: Icon(Icons.photo),
          label: Text('Seleccionar imagen'),
          onPressed: _pickAndCropImage,
        ),
        SizedBox(height: 20),
        _image != null
            ? Image.file(_image!, width: 200, height: 200, fit: BoxFit.cover)
            : Text('Ninguna imagen seleccionada'),
      ],
    );

    final fields = [
      imageSelecter,
      txtName,
      txtUser,
      txtPwd,
      txtPwd2,
      btnRegister,
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bg_register.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 65,
                      child: Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 70,
                          fontFamily: 'Stein',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        height: MediaQuery.of(context).size.height * .65,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                            0.9,
                          ), // Fondo blanco con 30% opacidad
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black.withOpacity(
                              0.6,
                            ), // Borde negro con 60% opacidad
                            width: 2,
                          ),
                        ),
                        child: ListView(
                          padding: EdgeInsets.only(top: 20),
                          children: [
                            ...fields.map((field) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: field,
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      child: isValidation
                          ? Lottie.asset('assets/loading2.json')
                          : Container(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
