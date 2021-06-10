class OnBoardingModel {
  final String imageUrl;
  final String title;
  final String description;

  OnBoardingModel({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final List<OnBoardingModel> onBoardingdata = [
  OnBoardingModel(
    imageUrl: 'assets/images/onB1.png',
    title: 'title 1',
    description:
        'We strongly recommend the either of last two so that your API key isn\'t visible to others in logs or via request sniffing.',
  ),
  OnBoardingModel(
    imageUrl: 'assets/images/onB2.png',
    title: 'title 2',
    description:
        'News API is great as a data source for news tickers and other applications where you want to show your users live headlines.',
  ),
  OnBoardingModel(
    imageUrl: 'assets/images/onB4.png',
    title: 'title 3',
    description: 'We track headlines in 7 categories across over 50 countries.',
  ),
];
