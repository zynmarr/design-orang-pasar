import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

enum SingingCharacter { man, woman }

class _EditProfileState extends State<EditProfile> {
  String nama, handphone;

  String date;
  SingingCharacter _character = SingingCharacter.man;
  File _image;
  final picker = ImagePicker();
  List imageList = [];

  bool obSecure = true;

  String pesan;

  bool autoValidate = false;

  bool _loading = true;

  bool formShow = true;

  TextEditingController datePicker = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  check() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        autoValidate = true;
        _loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Future getImageGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
    _cropImage(_image);
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1960),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        datePicker.text = '${picked.day}-${picked.month}-${picked.year}';
        print(datePicker.text);
      });
  }

  Future<Null> _cropImage(imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [CropAspectRatioPreset.square]
            : [CropAspectRatioPreset.square],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.pinkAccent,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        _image = File(imageFile.path);
      });
    } else {
      setState(() {
        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          'Edit Profile',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      Center(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150.0),
                            border: Border.all(
                                color: Color(0xFFfa5a19), width: 0.5),
                            image: DecorationImage(
                              image: _image != null
                                  ? FileImage(_image)
                                  : AssetImage('assets/images/user.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xFFfa5a19),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  getImageGallery();
                                },
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30),
                      ),
                      Form(
                        key: _formKey,
                        autovalidate: autoValidate,
                        child: Column(
                          children: <Widget>[
                            Container(
                              // height: 90,
                              margin: EdgeInsets.only(left: 10, right: 10),
                              // transform: Matrix4.translationValues(0, 10, 0),
                              // padding: EdgeInsets.only(top: 2, left: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2),
                                ],
                              ),
                              child: TextFormField(
                                onSaved: (val) => nama = val,
                                validator: (val) {
                                  if (val.isEmpty && val == null) {
                                    return 'Nama Lengkap Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 16,
                                  color: Colors.lightBlue,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Nama Lengkap',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  focusColor: Colors.deepPurple,
                                  // filled: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: datePicker,
                                readOnly: true,
                                onTap: () {
                                  _selectDate(context);
                                },
                                validator: (val) {
                                  if (val.isEmpty && val == null) {
                                    return 'Nama Lengkap Tidak Boleh Kosong';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  height: 1,
                                  fontSize: 16,
                                  color: Colors.lightBlue,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Tanggal Lahir',
                                  hintStyle: TextStyle(
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  focusColor: Colors.deepPurple,
                                  // filled: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            Column(
                              children: <Widget>[
                                RadioListTile<SingingCharacter>(
                                  title: Text('Laki'),
                                  value: SingingCharacter.man,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                                RadioListTile<SingingCharacter>(
                                  title: Text('Perempuan'),
                                  value: SingingCharacter.woman,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter value) {
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(30),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue[400],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  splashColor: Colors.orange,
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    setState(() {
                                      _loading = true;
                                    });
                                    check();
                                  },
                                  child: Center(
                                    child: Text(
                                      'Simpan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
