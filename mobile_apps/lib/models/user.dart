class User {
  String ethereumAddress;
  String travellerManagerAddress;
  String travellerDeposit;

  User({
    this.ethereumAddress,
    this.travellerManagerAddress,
    this.travellerDeposit,
  });

  User.empty() {
    User(
        ethereumAddress: '', travellerDeposit: '', travellerManagerAddress: '');
  }

  User.fromJson(Map<String, dynamic> json)
      : ethereumAddress = json['ethereumAddress'],
        travellerManagerAddress = json['travellerManagerAddress'],
        travellerDeposit = json['travellerDeposit'];

  Map<String, dynamic> toJson() => {
        'ethereumAddress': ethereumAddress,
        'travellerManagerAddress': travellerManagerAddress,
        'travellerDeposit': travellerDeposit,
      };
}
