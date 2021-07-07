// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final mediaUploadsController =
    StateNotifierProvider.autoDispose<MediaUploadsController, List<String?>>(
        (ref) {
  final List<String?> _media = [];
  return MediaUploadsController(_media);
});

class MediaUploadsController extends StateNotifier<List<String?>> {
  MediaUploadsController(List<String?> state) : super(state);

  final ImagePicker _picker = ImagePicker();
  List<PickedFile?> mediaList = [];

  void onImageButtonPressed(ImageSource source) async {
    List<PickedFile>? _mediaFiles = [];
    try {
      if (source == ImageSource.gallery) {
        _mediaFiles = await _picker.getMultiImage() ?? [];
      } else {
        final _imageFile = await _picker.getImage(source: ImageSource.camera);
        if (_imageFile != null) {
          _mediaFiles.add(_imageFile);
        }
      }
      state = _mediaFiles.map((PickedFile file) => file.path).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
