part of "../widgets/settings_profile.dart";



mixin _SettingsProfileMixin on State<SettingsProfile>{
  final TextEditingController _usernameController = TextEditingController() ;
  final TextEditingController _emailController = TextEditingController() ;
   DateTime? _birthDate ;
   Country? _country ;
  final TextEditingController _bioController = TextEditingController() ;
  Gender? _gender ;
  List<ProfileInterests> _interests = [] ;
   List<TextEditingController> get _controllers => [
    _usernameController,
     _emailController,
     _bioController
  ] ;


   void _initFields(){
     _usernameController.text = widget.profile.username ;
     _emailController.text = widget.profile.email??"";
     _birthDate = widget.profile.birthDate ;
     _country = widget.profile.country ;
     _bioController.text = widget.profile.bio??"" ;
     _gender = widget.profile.gender ;
     _interests = widget.profile.interests??[] ;
   }
@override
  void initState() {
     _initFields() ;
    super.initState();
  }








@override
  void dispose() {
    for(var c in _controllers){
      c.dispose()  ;
    }
    super.dispose();
  }

}