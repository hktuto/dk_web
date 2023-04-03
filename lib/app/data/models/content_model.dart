// To parse this JSON data, do
//
//     final content = contentFromJson(jsonString);

import 'dart:convert';

Content contentFromJson(String str) => Content.fromJson(json.decode(str));

String contentToJson(Content data) => json.encode(data.toJson());

class Content {
    Content({
        this.id,
        this.postIntro,
        this.postHeadline,
        this.postContent,
        this.pageNumber,
        this.perPage,
        this.tags,
        this.tagsPriority,
        this.tagType,
        this.category,
        this.totalPost,
    });

    int? id;
    String? postIntro;
    String? postHeadline;
    String? postContent;
    int? pageNumber;
    int? perPage;
    String? tags;
    int? tagsPriority;
    String? tagType;
    String? category;
    int? totalPost;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"] ,
        postIntro: json["post_intro"] ,
        postHeadline: json["post_headline"] ,
        postContent: json["post_content"] ,
        pageNumber: json["page_number"],
        perPage: json["per_page"],
        tags: json["tags"],
        tagsPriority: json["tags_priority"],
        tagType: json["tag_type"],
        category: json["category"],
        totalPost: json["total_post"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "post_intro": postIntro == null ? null : postIntro,
        "post_headline": postHeadline == null ? null : postHeadline,
        "post_content": postContent == null ? null : postContent,
        "page_number": pageNumber == null ? null : pageNumber,
        "per_page": perPage == null ? null : perPage,
        "tags": tags == null ? null : tags,
        "tags_priority": tagsPriority == null ? null : tagsPriority,
        "tag_type": tagType == null ? null : tagType,
        "category": category == null ? null : category,
        "total_post": totalPost == null ? null : totalPost,
    };
}
