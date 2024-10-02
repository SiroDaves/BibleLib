import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_assets.dart';
import '../../../common/widgets/action/fab_widget.dart';
import '../../../common/widgets/presentor/presentor_animate.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/data/models/exts/verseext.dart';
import '../../../core/theme/theme_colors.dart';
import '../bloc/presentor_bloc.dart';
import '../common/presentor_utils.dart';

part 'presentor_body.dart';
part 'presentor_mobile.dart';

class PresentorScreen extends StatefulWidget {
  final VerseExt verse;
  const PresentorScreen({super.key, required this.verse});

  @override
  State<PresentorScreen> createState() => PresentorScreenState();
}

class PresentorScreenState extends State<PresentorScreen> {
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  @override
  Widget build(BuildContext context) {
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return BlocProvider(
      create: (context) {
        return PresentorBloc();
      },
      child: PresentorScreenBody(
        parent: this,
        verse: widget.verse,
      ),
    );
  }
}
