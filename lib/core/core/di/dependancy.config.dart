// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:knovator_test/application/bloc/posts/post_bloc.dart' as _i1003;
import 'package:knovator_test/domain/all_posts/i_all_product_repo.dart'
    as _i425;
import 'package:knovator_test/infrastructure/posts/posts_repository.dart'
    as _i205;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i425.IPostsRepo>(() => _i205.PostsRepository());
    gh.factory<_i1003.PostBloc>(
      () => _i1003.PostBloc(
        gh<_i425.IPostsRepo>(),
        gh<_i460.SharedPreferences>(),
      ),
    );
    return this;
  }
}
