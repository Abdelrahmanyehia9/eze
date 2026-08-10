part of "../../complete_profile_screen.dart";

class _StepCountry extends StatelessWidget {
  const _StepCountry();

  @override
  Widget build(BuildContext context) {
    return _CompleteProfileScreenLayout(
      subtitle:
          "اختر دولتك بشكل صحيح، لأننا سنستخدمها لضبط الترجمة التلقائية للرسائل لتصلك بلغتك بسهولة، بدون الحاجة إلى مترجم.",
      fields: [
        const CountrySelector(showHeader: false),
        const AppIconText(
          text:
              "تحذير: لا يمكن تغيير الدولة بعد تأكيدها، لذا يُرجى اختيار دولتك بشكل صحيح.",
          color: AppColors.error,
          icon: AppIcons.warning,
          expandedText: true,
        ).paddingVr,
        const Spacer(),
        Row(
          spacing: UISizes.w8,
          children: [
            AppCheckbox(value: true, size: UISizes.sp18, onChanged: (_) {}),
            const AppText("استخدام ميزة الترجمة التلقائية"),
          ],
        ),
      ],
    );
  }
}
