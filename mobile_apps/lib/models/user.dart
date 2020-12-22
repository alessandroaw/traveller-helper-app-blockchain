class User {
    String ethereumAddress;
    String etherBalance;
    String travellerManagerAddress;
    String travellerDeposit;

  User({
    this.ethereumAddress,
    this.etherBalance,
    this.travellerManagerAddress,
    this.travellerDeposit,
  });

  User.fromJson(Map<String, dynamic> json)
      : ethereumAddress = json['ethereumAddress'],
        etherBalance = json['etherBalance'],
        travellerManagerAddress = json['travellerManagerAddress'],
        travellerDeposit = json['travellerDeposit'];

  Map<String, dynamic> toJson() => {
        'ethereumAddress': ethereumAddress,
        'etherBalance': etherBalance,
        'travellerManagerAddress': travellerManagerAddress,
        'travellerDeposit': travellerDeposit,
      };
}


