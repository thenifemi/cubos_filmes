import 'package:cubos_desafio_Tecnico_flutter/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../bloc/get_cast_bloc.dart';
import '../../model/cast.dart';
import '../../model/cast_response.dart';
import 'loading_widget.dart';
import 'text_widget.dart';

class CastWidget extends StatefulWidget {
  final int id;
  const CastWidget({Key key, @required this.id}) : super(key: key);

  @override
  _CastWidgetState createState() => _CastWidgetState(id);
}

class _CastWidgetState extends State<CastWidget> {
  final int id;
  _CastWidgetState(this.id);

  @override
  void initState() {
    super.initState();
    castBloc..getCast(id);
  }

  @override
  void dispose() {
    super.dispose();
    castBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: castBloc.subject.stream,
      builder: (BuildContext context, AsyncSnapshot<CastResponse> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return buildErrorWidget(snapshot.data.error);
              }
              return buildCastWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return buildErrorWidget(snapshot.error);
            } else {
              return loadingWidget();
            }
            break;
          case ConnectionState.waiting:
            return loadingWidget();
            break;
          default:
            return loadingWidget();
        }
      },
    );
  }

  Widget buildCastWidget(CastResponse data) {
    List<Cast> casts = data.casts;
    if (casts.length == 0) {
      return buildErrorWidget("No Casts");
    } else
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: casts.length,
        itemBuilder: (context, i) {
          var cast = casts[i];

          return PrimaryText(
            text: "${cast.name}, ",
            color: MColors.textDark,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          );
        },
      );
  }
}
