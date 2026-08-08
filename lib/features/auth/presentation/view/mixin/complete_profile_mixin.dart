part of '../complete_profile_screen.dart';


mixin _CompleteProfileMixin on State<CompleteProfileScreen>{
  late final PageController _controller;
  final List<Widget> _steps = [
    const _StepCountry(),
    const _StepAbout(),
    const _StepBirthdate(),
    const _StepGender(),
    const _StepInterests(),
    const _StepPictures(),
    const _StepGallery(),
  ];
  late final ValueNotifier<int> currentPage;

  @override
  void initState() {
    _controller = PageController();
    currentPage = ValueNotifier(_controller.initialPage);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    currentPage.dispose();
    super.dispose();
  }

  bool get _isFirstStep => currentPage.value == 0;
  bool get _isLastStep => currentPage.value == _steps.length - 1;

  void _goNext() {
    if (_isLastStep) {
      _onFinish();
      return;
    }
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  void _goPrev() {
    if (_isFirstStep) return;
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  void _onFinish() {
  }
}