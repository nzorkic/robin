// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:robin/services/image_service.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final _formKey = GlobalKey<FormState>();

  String _placeValue = 'Ulica';
  String _stateValue = 'Zdrav';
  String _genderValue = 'Muski';
  TextEditingController? textController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              child: const Icon(Icons.check),
              onTap: () => {},
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Scaffold(
          key: scaffoldKey,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 260,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.yellow[50],
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.grey[400] ?? Colors.grey,
                          ),
                        ),
                        child: Consumer(
                          builder: (BuildContext context,
                              T Function<T>(ProviderBase<Object?, T>) watch,
                              Widget? child) {
                            List<String?> _images =
                                watch(mediaUploadsController);
                            return _images.isNotEmpty
                                ? GridView(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 1,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: _images
                                        .map(
                                          (e) => Image.file(
                                            File(e!),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                        .toList(),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text('Add photos'),
                                      Icon(
                                        Icons.arrow_downward,
                                        size: 50,
                                      )
                                    ],
                                  );
                          },
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () => context
                                .read(mediaUploadsController.notifier)
                                .onImageButtonPressed(ImageSource.camera),
                            child: const Icon(Icons.camera_alt, size: 40),
                          ),
                          GestureDetector(
                            onTap: () => context
                                .read(mediaUploadsController.notifier)
                                .onImageButtonPressed(ImageSource.gallery),
                            child: const Icon(Icons.photo, size: 40),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'Prebivaliste',
                          ),
                        ),
                        RadioButton(
                          description: 'Ulica',
                          value: 'Ulica',
                          groupValue: _placeValue,
                          onChanged: (val) => {
                            setState(
                              () => _placeValue = val.toString(),
                            ),
                          },
                        ),
                        RadioButton(
                          description: 'Foster',
                          value: 'Foster',
                          groupValue: _placeValue,
                          onChanged: (val) => {
                            setState(
                              () => _placeValue = val.toString(),
                            ),
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'Stanje',
                          ),
                        ),
                        RadioButton(
                          description: 'Zdrav',
                          value: 'Zdrav',
                          groupValue: _stateValue,
                          onChanged: (val) => {
                            setState(
                              () => _stateValue = val.toString(),
                            ),
                          },
                        ),
                        RadioButton(
                          description: 'Povredjen',
                          value: 'Povredjen',
                          groupValue: _stateValue,
                          onChanged: (val) => {
                            setState(
                              () => _stateValue = val.toString(),
                            ),
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'Pol',
                          ),
                        ),
                        RadioButton(
                          description: 'Muski',
                          value: 'Muski',
                          groupValue: _genderValue,
                          onChanged: (val) => {
                            setState(
                              () => _genderValue = val.toString(),
                            ),
                          },
                        ),
                        RadioButton(
                          description: 'Zenski',
                          value: 'Zenski',
                          groupValue: _genderValue,
                          onChanged: (val) => {
                            setState(
                              () => _genderValue = val.toString(),
                            ),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: 'Opis',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          topRight: Radius.circular(4.0),
                        ),
                      ),
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    keyboardType: TextInputType.multiline,
                    validator: (String? val) {
                      if (val!.isEmpty) {
                        return 'Obavezno polje';
                      }
                      if (val.length < 10) {
                        return 'Tekst mora imati minimum 10 karatkera';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
