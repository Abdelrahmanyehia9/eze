part of "../home_screen.dart";

class _ChatFeaturesGrid extends StatelessWidget {
  const _ChatFeaturesGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ChatFeature.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: UISizes.sp2 * 1.1,
        crossAxisSpacing: UISizes.sp6,
        mainAxisSpacing: UISizes.sp6,
      ),
      itemBuilder: (_, i) =>
          _FeatureBox(feature: ChatFeature.values[i], isEnabled: i == 0),
    );
  }
}

class _FeatureBox extends StatelessWidget {
  final ChatFeature feature;
  final bool isEnabled;
  const _FeatureBox({required this.feature, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    final color = feature.color(context);
    return Container(
      decoration: BoxDecoration(
        color: color.veryLight,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(UISizes.r8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (feature.svg != null)
            SvgPicture.asset(
              width: UISizes.sp24,
              feature.svg!,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          AppText(
            feature.title,
            textAlign: TextAlign.center,
            style: context.textTheme.labelSmall,
            color: color,
          ),
          AppSwitch(
            width: UISizes.w32,
            height: UISizes.h16,
            value: isEnabled,
            onChanged: (r) {},
            activeColor: color,
          ),
        ],
      ),
    );
  }
}
