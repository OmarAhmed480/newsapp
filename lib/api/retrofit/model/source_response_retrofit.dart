import 'package:json_annotation/json_annotation.dart';
import 'package:newsapp/api/retrofit/model/source_retrofit.dart';

part 'source_response_retrofit.g.dart';

@JsonSerializable()
class SourceResponseRetrofit {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "sources")
  final List<SourceRetrofit>? sources;

  SourceResponseRetrofit ({
    this.status,
    this.sources,
    this.message,
    this.code
  });

  factory SourceResponseRetrofit.fromJson(Map<String, dynamic> json) {
    return _$SourceResponseRetrofitFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SourceResponseRetrofitToJson(this);
  }
}


