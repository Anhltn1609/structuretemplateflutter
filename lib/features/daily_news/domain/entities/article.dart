import 'package:equatable/equatable.dart';
import 'package:structure_template/features/daily_news/domain/entities/source.dart';

class ArticleEntity extends Equatable{
  final String ? author;
  final String ? title;
  final String ? description;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;
  final String ? content;
  final SourceEntity ? source;
  const ArticleEntity({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.source,
  });

  @override
  List < Object ? > get props {
    return [
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
      source,
    ];
  }
}