class Country {

  final String name;
  final String flag;

  const Country(
    this.name,
    this.flag,
  );

  factory Country.fromJson(Map json) {
    return Country(
      json['name'],
      json['flag'],
    );

    // return switch (json) {
    //   {
    //     'data''name': String name,
    //     'data''flag': String flag,
    //   } =>
    //     Country(
    //       name: name,
    //       flag: flag,
    //     ),
    //   _ => throw const FormatException('Failed to load country.'),
    // };
  }
}