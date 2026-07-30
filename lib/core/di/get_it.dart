

/* GetIt sl = GetIt.instance;
 */
class DI {
  static Future<void> init() async {
    await _setupSingletons();
    await _setupFactories();
  }

  static Future<void> _setupSingletons() async {
  
  }

   
  static Future<void> _setupFactories() async {
  }




  static Future<void> reset() async {
   /*  await sl.reset(); */
  }
}