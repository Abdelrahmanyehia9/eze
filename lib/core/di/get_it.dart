import 'package:eze/features/chat/data/datasource/chat_local_datasource.dart';
import 'package:eze/features/chat/data/datasource/chat_remote_datasource.dart';
import 'package:eze/features/chat/data/repository/chat_repository_impl.dart';
import 'package:eze/features/chat/domain/repository/chat_repository.dart';
import 'package:eze/features/chat/domain/usecases/get_all_conversations_use_case.dart';
import 'package:eze/features/chat/domain/usecases/get_chat_messages_by_id_use_case.dart';
import 'package:eze/features/chat/domain/usecases/get_conversation_requests_use_case.dart';
import 'package:eze/features/chat/presentation/controller/all_conversations_cubit.dart';
import 'package:eze/features/chat/presentation/controller/chat_by_id_cubit.dart';
import 'package:eze/features/chat/presentation/controller/conversation_requests_cubit.dart';
import 'package:eze/features/dictionary/data/datasource/dictionary_local_data_source.dart';
import 'package:eze/features/dictionary/data/repository/dictionary_repository_impl.dart';
import 'package:eze/features/dictionary/domain/repository/dictionary_repository.dart';
import 'package:eze/features/dictionary/domain/usecase/get_all_dictionary_words_use_case.dart';
import 'package:eze/features/dictionary/presentation/controller/dictionary_words_cubit.dart';
import 'package:eze/features/home/data/datacource/boosted_users_local_datasource.dart';
import 'package:eze/features/home/data/datacource/boosted_users_remote_datasource.dart';
import 'package:eze/features/home/data/repository/boosted_users_repository_impl.dart';
import 'package:eze/features/home/domain/repository/boosted_users_repository.dart';
import 'package:eze/features/home/domain/usecases/get_boosted_user_use_case.dart';
import 'package:eze/features/home/domain/usecases/get_popular_groups_use_case.dart';
import 'package:eze/features/home/domain/usecases/get_unread_conversations_use_case.dart';
import 'package:eze/features/home/presentation/controller/boosted_users_cubit.dart';
import 'package:eze/features/home/presentation/controller/popular_groups_cubit.dart';
import 'package:eze/features/home/presentation/controller/unread_conversation_cubit.dart';
import 'package:eze/features/profile/data/datasource/profile_local_datasource.dart';
import 'package:eze/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:eze/features/profile/data/repository/profile_repository_impl.dart';
import 'package:eze/features/profile/domain/repository/profile_repository.dart';
import 'package:eze/features/profile/domain/usecases/get_my_profile_use_case.dart';
import 'package:eze/features/profile/presentation/controller/profile_cubit.dart';
import 'package:eze/features/settings/data/datasource/settings_local_datasource.dart';
import 'package:eze/features/settings/data/repository/settings_repository_impl.dart';
import 'package:eze/features/settings/domain/repository/settings_repository.dart';
import 'package:eze/features/settings/domain/usecases/edit_app_settings_use_case.dart';
import 'package:eze/features/settings/domain/usecases/get_app_settings_use_case.dart';
import 'package:eze/features/settings/presentation/controller/base_settings_cubit.dart';
import 'package:eze/shared/data/datasource/conversation_local_datasource.dart';
import 'package:eze/shared/data/datasource/conversation_remote_datasource.dart';
import 'package:eze/shared/data/repository/conversation_repository_impl.dart';
import 'package:eze/shared/domain/repository/conversation_repository.dart';
import 'package:eze/shared/presentation/controllers/main_layout_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class DI {
  const DI._();

  static Future<void> init() async {
    _registerLazySingletons();
    _registerFactories();
  }

  static void _registerLazySingletons() {
    _registerDataSources();
    _registerRepositories();
  }

  static void _registerFactories() {
    _registerUseCases();
    _registerCubits();
  }

  static void _registerDataSources() {
    sl.registerLazySingleton<BoostedUsersLocalDatasource>(
      () => BoostedUsersLocalDatasource(),
    );

    sl.registerLazySingleton<BoostedUsersRemoteDatasource>(
      () => BoostedUsersRemoteDatasource(),
    );
    sl.registerLazySingleton<ConversationRemoteDatasource>(
      () => ConversationRemoteDatasource(),
    );
    sl.registerLazySingleton<ConversationLocalDatasource>(
      () => ConversationLocalDatasource(),
    );
    sl.registerLazySingleton<DictionaryLocalDataSource>(
      () => DictionaryLocalDataSource(),
    );
    sl.registerLazySingleton<ChatLocalDatasource>(() => ChatLocalDatasource());
    sl.registerLazySingleton<ChatRemoteDatasource>(
      () => ChatRemoteDatasource(),
    );

    sl.registerLazySingleton<ProfileRemoteDatasource>(
      () => ProfileRemoteDatasource(),
    );
    sl.registerLazySingleton<ProfileLocalDatasource>(
      () => ProfileLocalDatasource(),
    );
    sl.registerLazySingleton<SettingsLocalDatasource>(
      () => SettingsLocalDatasource(),
    );
  }

  static void _registerRepositories() {
    sl.registerLazySingleton<BoostedUsersRepository>(
      () => BoostedUsersRepositoryImpl(
        remoteDataSource: sl<BoostedUsersRemoteDatasource>(),
        localDataSource: sl<BoostedUsersLocalDatasource>(),
      ),
    );
    sl.registerLazySingleton<ConversationRepository>(
      () => ConversationRepositoryImpl(
        remoteDatasource: sl<ConversationRemoteDatasource>(),
        localDatasource: sl<ConversationLocalDatasource>(),
      ),
    );
    sl.registerLazySingleton<DictionaryRepository>(
      () => DictionaryRepositoryImpl(
        localDataSource: sl<DictionaryLocalDataSource>(),
      ),
    );
    sl.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(
        localDatasource: sl<ChatLocalDatasource>(),
        remoteDatasource: sl<ChatRemoteDatasource>(),
      ),
    );
    sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(
        localDatasource: sl<ProfileLocalDatasource>(),
        remoteDatasource: sl<ProfileRemoteDatasource>(),
      ),
    );
    sl.registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        localDatasource: sl<SettingsLocalDatasource>(),
      ),
    );
  }

  static void _registerUseCases() {
    sl.registerFactory<GetBoostedUserUseCase>(
      () => GetBoostedUserUseCase(sl<BoostedUsersRepository>()),
    );
    sl.registerFactory<GetUnreadConversationsUseCase>(
      () => GetUnreadConversationsUseCase(sl<ConversationRepository>()),
    );
    sl.registerFactory<GetPopularGroupsUseCase>(
      () => GetPopularGroupsUseCase(sl<ConversationRepository>()),
    );
    sl.registerFactory<GetConversationRequestsUseCase>(
      () => GetConversationRequestsUseCase(sl<ConversationRepository>()),
    );
    sl.registerFactory<GetAllConversationsUseCase>(
      () => GetAllConversationsUseCase(sl<ConversationRepository>()),
    );
    sl.registerFactory<GetAllDictionaryWordsUseCase>(
      () => GetAllDictionaryWordsUseCase(sl<DictionaryRepository>()),
    );
    sl.registerFactory<GetChatMessagesByIdUseCase>(
      () => GetChatMessagesByIdUseCase(sl<ChatRepository>()),
    );
    sl.registerFactory<GetProfileInfoUseCase>(
      () => GetProfileInfoUseCase(sl<ProfileRepository>()),
    );
    sl.registerFactory<GetAppSettingsUseCase>(
      () => GetAppSettingsUseCase(sl<SettingsRepository>()),
    );
    sl.registerFactory<EditAppSettingsUseCase>(
      () => EditAppSettingsUseCase(sl<SettingsRepository>()),
    );
  }

  static void _registerCubits() {
    sl.registerFactory<MainLayoutCubit>(() => MainLayoutCubit());

    sl.registerFactory<BoostedUsersCubit>(
      () => BoostedUsersCubit(sl<GetBoostedUserUseCase>()),
    );
    sl.registerFactory<UnreadConversationCubit>(
      () => UnreadConversationCubit(sl<GetUnreadConversationsUseCase>()),
    );
    sl.registerFactory<PopularGroupsCubit>(
      () => PopularGroupsCubit(sl<GetPopularGroupsUseCase>()),
    );
    sl.registerFactory<ConversationRequestsCubit>(
      () => ConversationRequestsCubit(sl<GetConversationRequestsUseCase>()),
    );
    sl.registerFactory<AllConversationsCubit>(
      () => AllConversationsCubit(sl<GetAllConversationsUseCase>()),
    );
    sl.registerFactory<DictionaryWordsCubit>(
      () => DictionaryWordsCubit(sl<GetAllDictionaryWordsUseCase>()),
    );
    sl.registerFactory<ChatByIdCubit>(
      () => ChatByIdCubit(sl<GetChatMessagesByIdUseCase>()),
    );
    sl.registerFactory<ProfileCubit>(
      () => ProfileCubit(sl<GetProfileInfoUseCase>()),
    );
    sl.registerFactory<LocalCubit>(
      () =>
          LocalCubit(sl<GetAppSettingsUseCase>(), sl<EditAppSettingsUseCase>()),
    );
    sl.registerFactory<ThemeCubit>(
      () =>
          ThemeCubit(sl<GetAppSettingsUseCase>(), sl<EditAppSettingsUseCase>()),
    );
    sl.registerFactory<SystemControlCubit>(
      () => SystemControlCubit(
        sl<GetAppSettingsUseCase>(),
        sl<EditAppSettingsUseCase>(),
      ),
    );
  }

  static Future<void> reset() async {
    await sl.reset();
  }
}
