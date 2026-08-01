part of '../dictionary_screen.dart';

class _DictionaryList extends StatelessWidget {
  const _DictionaryList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) => _buildItem(onShare: () {}),
      separatorBuilder: (_, _) => VGap.small(),
      itemCount: 12,
    );
  }

  Widget _buildItem({GestureTapCallback? onShare}) => Builder(
    builder: (context) {
      return AppWidgetOverlay(
        overlay: [
          (
            AlignmentGeometry.topStart,
            ShareButton(onTap: onShare, size: UISizes.sp18).appPaddingAll(8),
          ),
        ],
        child: const DictionaryWordCard(),
      );
    },
  );
}
