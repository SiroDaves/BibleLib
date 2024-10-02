part of 'presentor_screen.dart';

class PresentorScreenBody extends StatefulWidget {
  final PresentorScreenState parent;
  final VerseExt verse;
  const PresentorScreenBody(
      {super.key, required this.parent, required this.verse});

  @override
  State<PresentorScreenBody> createState() => PresentorScreenBodyState();
}

class PresentorScreenBodyState extends State<PresentorScreenBody> {
  late PresentorBloc _bloc;
  late PresentorScreenState parent;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations l10n;
  late VerseExt verse;
  bool isLiked = false, hasChorus = false, shownPcHints = false;
  bool slideHorizontal = false;
  int curStanza = 0, curVerse = 0, curSlide = 0;
  List<String> verseVerses = [], verseInfos = [], verseTexts = [];

  Size? size;
  double fSize = 25;
  List<Tab> widgetTabs = [];
  List<Widget> widgetContent = [];

  IconData likeIcon = Icons.favorite_border;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<PresentorBloc>();
    _bloc.add(PresentorSaveHistory(widget.verse));
    _bloc.add(PresentorLoadVerse(widget.verse));
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    verse = widget.verse;
    l10n = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;
    var bgImage = Theme.of(context).brightness == Brightness.light
        ? AppAssets.imgBg
        : AppAssets.imgBgBw;

    return BlocConsumer<PresentorBloc, PresentorState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.failure) {
          CustomSnackbar.show(
            context,
            feedbackMessage(state.feedback, l10n),
          );
        }
        if (state.status == Status.liked) {
          CustomSnackbar.show(
            context,
            'This has been added to your likes',
            isSuccess: true,
          );
        }
        if (state.status == Status.unliked) {
          CustomSnackbar.show(
            context,
            'This has been removed from your likes',
            isSuccess: true,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.verseTitle),
            actions: <Widget>[
              InkWell(
                onTap: () => _bloc.add(PresentorLikeVerse(verse)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child:
                      Icon(verse.liked ? Icons.favorite : Icons.favorite_border),
                ),
              ),
              /*InkWell(
                onTap: () async {
                  await showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return ListViewPopup(verse: vm.verse!);
                      });
                },
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.list),
                ),
              ),*/
            ],
          ),
          body: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover,
              ),
            ),
            child: state.status == Status.inProgress
                ? const CircularProgress()
                : state.widgetTabs.isNotEmpty
                    ? PresentorMobile(
                        index: curSlide,
                        versebook: state.verseBook,
                        tabs: state.widgetTabs,
                        contents: state.widgetContent,
                        tabsWidth: size.height * 0.08156,
                        indicatorWidth: size.height * 0.08156,
                        contentScrollAxis:
                            slideHorizontal ? Axis.horizontal : Axis.vertical,
                      )
                    : const SizedBox.shrink(),
          ),
          floatingActionButton: ExpandableFab(
            distance: 112.0,
            children: [
              FloatingActionButton(
                heroTag: 'share_fab',
                onPressed: () => shareVerse(widget.verse),
                backgroundColor: ThemeColors.bgColorPrimary(context),
                child: const Icon(Icons.share, color: Colors.white),
              ),
              FloatingActionButton(
                heroTag: 'copy_fab',
                onPressed: () => copyVerse(widget.verse),
                backgroundColor: ThemeColors.bgColorPrimary(context),
                child: const Icon(Icons.copy, color: Colors.white),
              ),
              FloatingActionButton(
                heroTag: 'edit_fab',
                onPressed: () => {},
                backgroundColor: ThemeColors.bgColorPrimary(context),
                child: const Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
