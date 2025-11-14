import 'package:gophar_rider/utils/assets.dart';

enum GopherType {
  professional(PngAssets.professional),
  rider(PngAssets.rider),
  delivery(PngAssets.rider);

  final String asset;

  const GopherType(this.asset);
}

enum DeliveryCategory { food, clothes, documents, electronics, pharmacy }
