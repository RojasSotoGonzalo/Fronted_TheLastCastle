import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

Future<void> uploadImageToFirebase() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(
      source: ImageSource
          .gallery); // Puedes cambiar a ImageSource.camera para usar la cámara

  if (pickedFile == null) {
    // El usuario canceló la selección de la imagen
    return;
  }

  File imageFile = File(pickedFile.path);

  try {
    String fileName = basename(imageFile.path);
    Reference storageReference =
        FirebaseStorage.instance.ref().child('tu_carpeta_en_storage/$fileName');

    UploadTask uploadTask = storageReference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    print("URL de descarga de la imagen: $downloadURL");

    // Puedes usar downloadURL para almacenar en tu base de datos, mostrar la imagen, etc.
  } catch (error) {
    print("Error al subir la imagen: $error");
  }
}
