class Transaction {
  int index;
  String travellerAddress;
  String helperAddress;
  String approval;
  String imageId;

  Transaction({
    this.index,
    this.travellerAddress,
    this.helperAddress,
    this.approval,
    this.imageId,
  });

  Transaction.fromJson(Map<String, dynamic> json)
      : index = json['index'],
        travellerAddress = json['travellerAddress'],
        helperAddress = json['helperAddress'],
        approval = json['approval'],
        imageId = json['imageId'];

  Map<String, dynamic> toJson() => {
        'index': index,
        'travellerAddress': travellerAddress,
        'helperAddress': helperAddress,
        'approval': approval,
        'imageId': imageId,
      };
}
