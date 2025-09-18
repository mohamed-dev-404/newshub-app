class ArticleModel {
  final String title;
  final String link;
  final String? image;
  final String? describtion; //subtitle

  ArticleModel({
    required this.link,
    required this.title,
    required this.image,
    required this.describtion,
  });

  factory ArticleModel.fromjson(Map<String, dynamic> article) {
    return ArticleModel(
        title: article['title'],
        link: article['link'],
        image: article['image_url'],
        describtion: article['description']);
  }
}
