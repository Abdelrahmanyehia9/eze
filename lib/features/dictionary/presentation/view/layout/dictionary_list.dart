part of '../dictionary_screen.dart';

class _DictionaryList extends StatelessWidget {
  final List<DictionaryEntity> dictionary;
  const _DictionaryList(this.dictionary);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) => _buildItem(dic: dictionary[i], onShare: () {}),
      separatorBuilder: (_, _) => VGap.small(),
      itemCount: dictionary.length,
    );
  }

  Widget _buildItem({
    GestureTapCallback? onShare,
    required DictionaryEntity dic,
  }) => Builder(
    builder: (context) {
      return AppWidgetOverlay(
        showOverlays: false,
        overlay: [
          (
            AlignmentGeometry.topStart,
            ShareButton(onTap: onShare, size: UISizes.sp18).appPaddingAll(8),
          ),
        ],
        child: DictionaryWordCard(dictionaryEntity: dic),
      );
    },
  );
}
