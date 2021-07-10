// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:robin/models/post/post.dart';
import 'package:robin/services/image_service.dart';
import 'package:robin/utils/enum_utils.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final _formKey = GlobalKey<FormState>();

  String _placeValue = EnumUtils.asString(Habitat.street);
  String _stateValue = EnumUtils.asString(Condition.well);
  String _genderValue = EnumUtils.asString(Gender.unknown);
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
                          description:
                              EnumUtils.asCapitalizedString(Habitat.street),
                          value: EnumUtils.asString(Habitat.street),
                          groupValue: _placeValue,
                          onChanged: (street) => {
                            setState(() => _placeValue = street.toString()),
                          },
                        ),
                        RadioButton(
                          description:
                              EnumUtils.asCapitalizedString(Habitat.foster),
                          value: EnumUtils.asString(Habitat.foster),
                          groupValue: _placeValue,
                          onChanged: (foster) => {
                            setState(
                              () => _placeValue = foster.toString(),
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
                          description:
                              EnumUtils.asCapitalizedString(Condition.well),
                          value: EnumUtils.asString(Condition.well),
                          groupValue: _stateValue,
                          onChanged: (well) => {
                            setState(
                              () => _stateValue = well.toString(),
                            ),
                          },
                        ),
                        RadioButton(
                          description:
                              EnumUtils.asCapitalizedString(Condition.injured),
                          value: EnumUtils.asString(Condition.injured),
                          groupValue: _stateValue,
                          onChanged: (injured) => {
                            setState(
                              () => _stateValue = injured.toString(),
                            ),
                          },
                        ),
                        RadioButton(
                          description:
                              EnumUtils.asCapitalizedString(Condition.sick),
                          value: EnumUtils.asString(Condition.sick),
                          groupValue: _stateValue,
                          onChanged: (sick) => {
                            setState(
                              () => _stateValue = sick.toString(),
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
                          description:
                              EnumUtils.asCapitalizedString(Gender.male),
                          value: EnumUtils.asString(Gender.male),
                          groupValue: _genderValue,
                          onChanged: (gender) => {
                            setState(
                              () => _genderValue = gender.toString(),
                            ),
                          },
                        ),
                        RadioButton(
                          description:
                              EnumUtils.asCapitalizedString(Gender.female),
                          value: EnumUtils.asString(Gender.female),
                          groupValue: _genderValue,
                          onChanged: (gender) => {
                            setState(
                              () => _genderValue = gender.toString(),
                            ),
                          },
                        ),
                        RadioButton(
                          description:
                              EnumUtils.asCapitalizedString(Gender.unknown),
                          value: EnumUtils.asString(Gender.unknown),
                          groupValue: _genderValue,
                          onChanged: (gender) => {
                            setState(
                              () => _genderValue = gender.toString(),
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
