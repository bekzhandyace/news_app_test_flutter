class NewsArticle {
  final String title;
  final String description;
  final String content;
  final String imageUrl;

  NewsArticle({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
    );
  }
}