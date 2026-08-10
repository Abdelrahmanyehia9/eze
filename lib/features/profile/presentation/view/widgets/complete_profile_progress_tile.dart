part of '../profile_screen.dart';

class _CompleteProfileProgressTile extends StatelessWidget {
  final double profileProgress;
  const _CompleteProfileProgressTile(this.profileProgress);

  @override
  Widget build(BuildContext context) {
    double value = profileProgress;
    return AppCard(
      child: Row(
        spacing: UISizes.w16,
        children: [
          CircleProgressWithValue(value: value),
          Expanded(child: _buildTitleAndDescription(value)),
          if (value < 1) Icon(AppIcons.arrowForward, size: UISizes.sp20),
        ],
      ),
    );
  }

  Widget _buildTitleAndDescription(double value) => Builder(
    builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "تقدم الملف الشخصى  ",
            height: 0,
            style: context.textTheme.labelMedium,
          ),
          AppText(
            height: 0,
            value == 1 ? "مكتمل" : "أضف معلوماتك الأساسية لإكمال ملفك الشخصي.",
            style: context.textTheme.bodySmall,
          ),
        ],
      );
    },
  );
}
