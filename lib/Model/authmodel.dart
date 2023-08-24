
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.uid,
        required this.email,
        required this.emailVerified,
        required this.disabled,
        required this.metadata,
        required this.tokensValidAfterTime,
        required this.providerData,
    });

    String uid;
    String email;
    bool emailVerified;
    bool disabled;
    Metadata metadata;
    String tokensValidAfterTime;
    List<ProviderDatum> providerData;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        uid: json["uid"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        disabled: json["disabled"],
        metadata: Metadata.fromJson(json["metadata"]),
        tokensValidAfterTime: json["tokensValidAfterTime"],
        providerData: List<ProviderDatum>.from(json["providerData"].map((x) => ProviderDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "emailVerified": emailVerified,
        "disabled": disabled,
        "metadata": metadata.toJson(),
        "tokensValidAfterTime": tokensValidAfterTime,
        "providerData": List<dynamic>.from(providerData.map((x) => x.toJson())),
    };
}

class Metadata {
    Metadata({
        this.lastSignInTime,
        required this.creationTime,
        this.lastRefreshTime,
    });

    dynamic lastSignInTime;
    String creationTime;
    dynamic lastRefreshTime;

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        lastSignInTime: json["lastSignInTime"],
        creationTime: json["creationTime"],
        lastRefreshTime: json["lastRefreshTime"],
    );

    Map<String, dynamic> toJson() => {
        "lastSignInTime": lastSignInTime,
        "creationTime": creationTime,
        "lastRefreshTime": lastRefreshTime,
    };
}

class ProviderDatum {
    ProviderDatum({
        required this.uid,
        required this.email,
        required this.providerId,
    });

    String uid;
    String email;
    String providerId;

    factory ProviderDatum.fromJson(Map<String, dynamic> json) => ProviderDatum(
        uid: json["uid"],
        email: json["email"],
        providerId: json["providerId"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "providerId": providerId,
    };
}