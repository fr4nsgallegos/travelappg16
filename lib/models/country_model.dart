class CountryModel {
  final String name;
  final String image;
  final String tours;
  final String rating;

  const CountryModel({
    required this.name,
    required this.image,
    required this.tours,
    required this.rating,
  });
}

CountryModel countryExample = CountryModel(
  name: "Noruega",
  image:
      "https://assets.howlanders.com/es/tours-finlandia/rovaniemi/rovaniemi-aurora-boreal/timeline/auroras-boreales-rovaniemi.jpg",
  tours: "18",
  rating: "4.6",
);
