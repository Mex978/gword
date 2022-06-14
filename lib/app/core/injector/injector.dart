abstract class IInjector {
  T get<T extends Object>();
  Future<void> init();
  Future<void> dispose();
}
