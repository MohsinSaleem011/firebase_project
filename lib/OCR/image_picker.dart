import 'dart:developer';

import 'package:firebase_project/images/getImages.dart';
import 'package:image_picker/image_picker.dart';

Future<String> pcikImage({ImageSource? source})async{
  final picker=ImagePicker();

  String path='';
  try{
final getImage=await picker.pickImage(source: source!);
if(getImage!=null){
path=getImage.path;
}
else{
  path='';
}
  }
  catch(e){

    log(e.toString());
  }
  return path;
}