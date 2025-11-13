class ImageView {
  final String file;
  final ImageType type;

  const ImageView({required this.file, required this.type});
}

enum ImageType { asset, network, file }
