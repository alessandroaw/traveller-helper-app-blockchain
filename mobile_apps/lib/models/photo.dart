class Photo {
  int index;
  String imagePath;
  String travellerAddress;
  String helperAddress;
  String travellerManager;

  Photo({
    this.index,
    this.imagePath,
    this.travellerAddress,
    this.helperAddress,
    this.travellerManager,
  });

  Photo.fromJson(Map<String, dynamic> json)
      : index = json['index'],
        imagePath = json['imagePath'],
        travellerAddress = json['travellerAddress'],
        helperAddress = json['helperAddress'],
        travellerManager = json['travellerManager'];

  Map<String, dynamic> toJson() => {
        'index': index,
        'imagePath': imagePath,
        'travellerAddress': travellerAddress,
        'helperAddress': helperAddress,
        'travellerManager': travellerManager,
      };
}
