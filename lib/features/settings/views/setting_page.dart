import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // Controladores de texto
  final TextEditingController nombreCtrl = TextEditingController(
    text: "Juan Pérez",
  );
  final TextEditingController emailCtrl = TextEditingController(
    text: "juanperez@mail.com",
  );
  final TextEditingController lugarCtrl = TextEditingController(
    text: "Cusco, Perú",
  );
  final TextEditingController fechaCtrl = TextEditingController(
    text: "12/08/1995",
  );
  final TextEditingController ganadoCtrl = TextEditingController(text: "120");
  final TextEditingController passwordCtrl = TextEditingController();

  File? _profileImage;
  bool _isPicking = false;

  Future<void> _pickImage() async {
    if (_isPicking) return; // evita abrir otra vez
    _isPicking = true;

    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    } finally {
      _isPicking = false; // liberar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // 🔹 Imagen de perfil
          Center(
            child: Stack(
              children: [
                Card(
                  shape: const CircleBorder(),
                  elevation: 4,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage("assets/perfil/perfil2.jpg")
                              as ImageProvider,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: _isPicking
                        ? null
                        : _pickImage, // deshabilita si está ocupado
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: _isPicking
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 24,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Datos personales
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Datos del Usuario",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  buildInput("Nombre completo", nombreCtrl, Icons.person),
                  buildInput("Correo electrónico", emailCtrl, Icons.email),
                  buildInput(
                    "Lugar de nacimiento",
                    lugarCtrl,
                    Icons.location_on,
                  ),
                  buildInput(
                    "Fecha de nacimiento",
                    fechaCtrl,
                    Icons.calendar_today,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Datos de ganado
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Datos de Ganado",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  buildInput(
                    "Cantidad de ganado",
                    ganadoCtrl,
                    Icons.agriculture,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Actualizar contraseña
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Seguridad",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  buildPasswordInput(
                    "Nueva contraseña",
                    passwordCtrl,
                    Icons.lock,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Aquí puedes llamar a tu API de actualizar contraseña
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Contraseña actualizada")),
                      );
                    },
                    icon: const Icon(Icons.save),
                    label: const Text("Actualizar Contraseña"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper para inputs normales
  Widget buildInput(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  // Widget helper para inputs de contraseña
  Widget buildPasswordInput(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
