part of '../complete_profile_screen.dart';

mixin _CompleteProfileMixin on State<CompleteProfileScreen> {
  late final PageController _controller;
  late final ValueNotifier<int> currentPage;

  final List<Widget> _steps = const [
    _StepCountry(),
    _StepAbout(),
    _StepBirthdate(),
    _StepGender(),
    _StepInterests(),
    _StepPictures(),
    _StepGallery(),
  ];

  static const _duration = Duration(milliseconds: 300);
  static const _curve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    currentPage = ValueNotifier(_controller.initialPage);
  }

  @override
  void dispose() {
    _controller.dispose();
    currentPage.dispose();
    super.dispose();
  }

  bool get _isFirstStep => currentPage.value == 0;

  bool get _isLastStep => currentPage.value == _steps.length - 1;

  void _animateTo(int page) {
    _controller.animateToPage(page, duration: _duration, curve: _curve);
  }

  void _goNext() {
    if (_isLastStep) return _onFinish();
    _animateTo(currentPage.value + 1);
  }

  void _goPrev() {
    if (_isFirstStep) return;
    _animateTo(currentPage.value - 1);
  }

  void _onFinish() {
    context.pushNamed(
      Routes.result,
      arguments: ResultScreenArgs(
        type: MessagesAlertType.profileCompleted,
        action: (context) => DefaultButton(
          text: "المتابعة",
          onTap: () => context.pushNamedAndRemoveUntil(Routes.main),
        ),
      ),
    );
  }
}
