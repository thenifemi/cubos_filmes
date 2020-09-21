import 'package:flutter/foundation.dart';

import 'cast.dart';

class CastResponse {
  final List<Cast> casts;

  final String error;

  CastResponse({
    @required this.casts,
    @required this.error,
  });

  CastResponse.fromJson(Map<String, dynamic> json)
      : casts = (json["cast"] as List)
            .map(
              (i) => Cast.fromJson(i),
            )
            .toList(),
        error = "";

  CastResponse.withError(String errorValue)
      : casts = List(),
        error = errorValue;
}

class CrewResponse {
  final List<Crew> crew;

  final String error;

  CrewResponse({
    @required this.crew,
    @required this.error,
  });

  CrewResponse.fromJson(Map<String, dynamic> json)
      : crew = (json["crew"] as List)
            .map(
              (i) => Crew.fromJson(i),
            )
            .toList(),
        error = "";

  CrewResponse.withError(String errorValue)
      : crew = List(),
        error = errorValue;
}
