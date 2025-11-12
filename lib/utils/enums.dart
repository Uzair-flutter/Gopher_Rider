import 'package:gophar_rider/utils/assets.dart';

enum ServiceType {
  professional(PngAssets.professional),
  gopher(PngAssets.gopher);

  final String asset;

  const ServiceType(this.asset);
}

enum GopherType {
  delivery(PngAssets.delivery),
  rider(PngAssets.rider);

  final String asset;

  const GopherType(this.asset);
}

enum DeliveryCategory { food, clothes, documents, electronics, pharmacy }
