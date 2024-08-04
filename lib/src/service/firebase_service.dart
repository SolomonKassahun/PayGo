import 'package:firebase_storage/firebase_storage.dart';

class FirebaseTaskManager {
 
  static Future<String> downloadImage(String pictureName,){
   try {
      Reference reference = FirebaseStorage.instance.ref().child(pictureName);
    return reference.getDownloadURL();
  
   } catch (e) {
     throw Exception(e);
   }
  }
 static Future<String> getImage(String fileName, int subStringLength) async{
    String imgUrl = await downloadImage(fileName.substring(subStringLength));
    print('image url is $imgUrl');
    return imgUrl;
  }
}