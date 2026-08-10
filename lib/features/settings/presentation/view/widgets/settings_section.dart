part of "../settings_screen.dart";

class _SettingTileData {
  final String title;
  final String? subTitle;
  final IconData? iconData;
  final GestureTapCallback? onTap;
  final Widget? customTrailing;

  _SettingTileData({
    required this.title,
    this.subTitle,
    this.iconData,
    this.onTap,
    this.customTrailing,
  });
}

class _SettingsSection extends StatelessWidget {
  final String? header;

  final List<_SettingTileData> data;

  const _SettingsSection({this.header, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (header != null)

          SectionHeader.smallHeader(header!, context: context),
        AppCard(
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, i) => _SettingTile(data[i]),
            separatorBuilder: (_, _) => const Divider(),
            itemCount: data.length,
          ),
        ),
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {
  final _SettingTileData data;

  const _SettingTile(this.data);

  @override
  Widget build(BuildContext context) {
    return AppListTile(
      onTap: data.onTap,
      minTileHeight: UISizes.sp40,
      leadingIconSize: UISizes.sp32,
      leading:data.iconData,
      title: data.title,
      subtitle: data.subTitle,
     customTrailing: data.customTrailing,
    );
  }
}
