// To parse this JSON data, do
//
//     final listPhotosModel = listPhotosModelFromJson(jsonString);

import 'dart:convert';

List<ListPhotosModel> listPhotosModelFromJson(String str) => List<ListPhotosModel>.from(json.decode(str).map((x) => ListPhotosModel.fromJson(x)));

String listPhotosModelToJson(List<ListPhotosModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListPhotosModel {
    String? id;
    String? slug;
    AlternativeSlugs? alternativeSlugs;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic promotedAt;
    int? width;
    int? height;
    String? color;
    String? blurHash;
    String? description;
    String? altDescription;
    List<dynamic>? breadcrumbs;
    Urls? urls;
    ListPhotosModelLinks? links;
    int? likes;
    bool? likedByUser;
    List<dynamic>? currentUserCollections;
    Sponsorship? sponsorship;
    TopicSubmissions? topicSubmissions;
    AssetType? assetType;
    User? user;

    ListPhotosModel({
        this.id,
        this.slug,
        this.alternativeSlugs,
        this.createdAt,
        this.updatedAt,
        this.promotedAt,
        this.width,
        this.height,
        this.color,
        this.blurHash,
        this.description,
        this.altDescription,
        this.breadcrumbs,
        this.urls,
        this.links,
        this.likes,
        this.likedByUser,
        this.currentUserCollections,
        this.sponsorship,
        this.topicSubmissions,
        this.assetType,
        this.user,
    });

    factory ListPhotosModel.fromJson(Map<String, dynamic> json) => ListPhotosModel(
        id: json["id"],
        slug: json["slug"],
        alternativeSlugs: json["alternative_slugs"] == null ? null : AlternativeSlugs.fromJson(json["alternative_slugs"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        promotedAt: json["promoted_at"],
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: json["breadcrumbs"] == null ? [] : List<dynamic>.from(json["breadcrumbs"]!.map((x) => x)),
        urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
        links: json["links"] == null ? null : ListPhotosModelLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections: json["current_user_collections"] == null ? [] : List<dynamic>.from(json["current_user_collections"]!.map((x) => x)),
        sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
        topicSubmissions: json["topic_submissions"] == null ? null : TopicSubmissions.fromJson(json["topic_submissions"]),
        assetType: assetTypeValues.map[json["asset_type"]]!,
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "alternative_slugs": alternativeSlugs?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "promoted_at": promotedAt,
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": breadcrumbs == null ? [] : List<dynamic>.from(breadcrumbs!.map((x) => x)),
        "urls": urls?.toJson(),
        "links": links?.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections": currentUserCollections == null ? [] : List<dynamic>.from(currentUserCollections!.map((x) => x)),
        "sponsorship": sponsorship?.toJson(),
        "topic_submissions": topicSubmissions?.toJson(),
        "asset_type": assetTypeValues.reverse[assetType],
        "user": user?.toJson(),
    };
}

class AlternativeSlugs {
    String? en;
    String? es;
    String? ja;
    String? fr;
    String? it;
    String? ko;
    String? de;
    String? pt;

    AlternativeSlugs({
        this.en,
        this.es,
        this.ja,
        this.fr,
        this.it,
        this.ko,
        this.de,
        this.pt,
    });

    factory AlternativeSlugs.fromJson(Map<String, dynamic> json) => AlternativeSlugs(
        en: json["en"],
        es: json["es"],
        ja: json["ja"],
        fr: json["fr"],
        it: json["it"],
        ko: json["ko"],
        de: json["de"],
        pt: json["pt"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "es": es,
        "ja": ja,
        "fr": fr,
        "it": it,
        "ko": ko,
        "de": de,
        "pt": pt,
    };
}

enum AssetType {
    PHOTO
}

final assetTypeValues = EnumValues({
    "photo": AssetType.PHOTO
});

class ListPhotosModelLinks {
    String? self;
    String? html;
    String? download;
    String? downloadLocation;

    ListPhotosModelLinks({
        this.self,
        this.html,
        this.download,
        this.downloadLocation,
    });

    factory ListPhotosModelLinks.fromJson(Map<String, dynamic> json) => ListPhotosModelLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
    };
}

class Sponsorship {
    List<String>? impressionUrls;
    String? tagline;
    String? taglineUrl;
    User? sponsor;

    Sponsorship({
        this.impressionUrls,
        this.tagline,
        this.taglineUrl,
        this.sponsor,
    });

    factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
        impressionUrls: json["impression_urls"] == null ? [] : List<String>.from(json["impression_urls"]!.map((x) => x)),
        tagline: json["tagline"],
        taglineUrl: json["tagline_url"],
        sponsor: json["sponsor"] == null ? null : User.fromJson(json["sponsor"]),
    );

    Map<String, dynamic> toJson() => {
        "impression_urls": impressionUrls == null ? [] : List<dynamic>.from(impressionUrls!.map((x) => x)),
        "tagline": tagline,
        "tagline_url": taglineUrl,
        "sponsor": sponsor?.toJson(),
    };
}

class User {
    String? id;
    DateTime? updatedAt;
    String? username;
    String? name;
    String? firstName;
    String? lastName;
    String? twitterUsername;
    String? portfolioUrl;
    String? bio;
    String? location;
    UserLinks? links;
    ProfileImage? profileImage;
    String? instagramUsername;
    int? totalCollections;
    int? totalLikes;
    int? totalPhotos;
    int? totalPromotedPhotos;
    int? totalIllustrations;
    int? totalPromotedIllustrations;
    bool? acceptedTos;
    bool? forHire;
    Social? social;

    User({
        this.id,
        this.updatedAt,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.twitterUsername,
        this.portfolioUrl,
        this.bio,
        this.location,
        this.links,
        this.profileImage,
        this.instagramUsername,
        this.totalCollections,
        this.totalLikes,
        this.totalPhotos,
        this.totalPromotedPhotos,
        this.totalIllustrations,
        this.totalPromotedIllustrations,
        this.acceptedTos,
        this.forHire,
        this.social,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
        profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        totalPromotedPhotos: json["total_promoted_photos"],
        totalIllustrations: json["total_illustrations"],
        totalPromotedIllustrations: json["total_promoted_illustrations"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: json["social"] == null ? null : Social.fromJson(json["social"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links?.toJson(),
        "profile_image": profileImage?.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "total_promoted_photos": totalPromotedPhotos,
        "total_illustrations": totalIllustrations,
        "total_promoted_illustrations": totalPromotedIllustrations,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social?.toJson(),
    };
}

class UserLinks {
    String? self;
    String? html;
    String? photos;
    String? likes;
    String? portfolio;
    String? following;
    String? followers;

    UserLinks({
        this.self,
        this.html,
        this.photos,
        this.likes,
        this.portfolio,
        this.following,
        this.followers,
    });

    factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
    };
}

class ProfileImage {
    String? small;
    String? medium;
    String? large;

    ProfileImage({
        this.small,
        this.medium,
        this.large,
    });

    factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
    };
}

class Social {
    String? instagramUsername;
    String? portfolioUrl;
    String? twitterUsername;
    dynamic paypalEmail;

    Social({
        this.instagramUsername,
        this.portfolioUrl,
        this.twitterUsername,
        this.paypalEmail,
    });

    factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
    );

    Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
    };
}

class TopicSubmissions {
    ArchitectureInterior? texturesPatterns;
    ArchitectureInterior? wallpapers;
    ArchitectureInterior? architectureInterior;
    ArchitectureInterior? streetPhotography;
    Nature? nature;
    ArchitectureInterior? film;
    ArchitectureInterior? foodDrink;

    TopicSubmissions({
        this.texturesPatterns,
        this.wallpapers,
        this.architectureInterior,
        this.streetPhotography,
        this.nature,
        this.film,
        this.foodDrink,
    });

    factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
        texturesPatterns: json["textures-patterns"] == null ? null : ArchitectureInterior.fromJson(json["textures-patterns"]),
        wallpapers: json["wallpapers"] == null ? null : ArchitectureInterior.fromJson(json["wallpapers"]),
        architectureInterior: json["architecture-interior"] == null ? null : ArchitectureInterior.fromJson(json["architecture-interior"]),
        streetPhotography: json["street-photography"] == null ? null : ArchitectureInterior.fromJson(json["street-photography"]),
        nature: json["nature"] == null ? null : Nature.fromJson(json["nature"]),
        film: json["film"] == null ? null : ArchitectureInterior.fromJson(json["film"]),
        foodDrink: json["food-drink"] == null ? null : ArchitectureInterior.fromJson(json["food-drink"]),
    );

    Map<String, dynamic> toJson() => {
        "textures-patterns": texturesPatterns?.toJson(),
        "wallpapers": wallpapers?.toJson(),
        "architecture-interior": architectureInterior?.toJson(),
        "street-photography": streetPhotography?.toJson(),
        "nature": nature?.toJson(),
        "film": film?.toJson(),
        "food-drink": foodDrink?.toJson(),
    };
}

class ArchitectureInterior {
    Status? status;
    DateTime? approvedOn;

    ArchitectureInterior({
        this.status,
        this.approvedOn,
    });

    factory ArchitectureInterior.fromJson(Map<String, dynamic> json) => ArchitectureInterior(
        status: statusValues.map[json["status"]]!,
        approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
    );

    Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
        "approved_on": approvedOn?.toIso8601String(),
    };
}

enum Status {
    APPROVED,
    UNEVALUATED
}

final statusValues = EnumValues({
    "approved": Status.APPROVED,
    "unevaluated": Status.UNEVALUATED
});

class Nature {
    Status? status;

    Nature({
        this.status,
    });

    factory Nature.fromJson(Map<String, dynamic> json) => Nature(
        status: statusValues.map[json["status"]]!,
    );

    Map<String, dynamic> toJson() => {
        "status": statusValues.reverse[status],
    };
}

class Urls {
    String? raw;
    String? full;
    String? regular;
    String? small;
    String? thumb;
    String? smallS3;

    Urls({
        this.raw,
        this.full,
        this.regular,
        this.small,
        this.thumb,
        this.smallS3,
    });

    factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
