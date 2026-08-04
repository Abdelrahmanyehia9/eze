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
      spacing: UISizes.sp4,
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
    return Material(
      color: Colors.transparent,
      child: ListTile(
        splashColor: Colors.transparent,
        onTap: data.onTap,
        minTileHeight: UISizes.h40,
        contentPadding: EdgeInsets.zero,
        leading: data.iconData == null
            ? null
            : Icon(data.iconData, size: UISizes.sp28),
        title: AppText(
          data.title,
          style: context.textTheme.labelMedium,
          height: 0,
        ),
        subtitle: data.subTitle == null
            ? null
            : AppText(
                data.subTitle,
                height: 0,
                style: context.textTheme.bodySmall,
                color: context.colors.surfaceContainerHigh,
              ),
        trailing:
            data.customTrailing ??
            Icon(AppIcons.arrowForward, size: UISizes.sp18),
      ),
    );
  }
}
