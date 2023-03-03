class HouseModel {
  final String name;
  final num price;
  final int homeSize;
  final String rooms;
  final String locations;
  final DateTime time;
  final int id;
  final String image;
  bool isTop;
  bool isLike;

  HouseModel(
      {required this.name,
      required this.price,
      required this.homeSize,
      required this.rooms,
      required this.locations,
      required this.time,
      required this.id,
      required this.image,
      this.isTop = false,
      this.isLike = false});
}
