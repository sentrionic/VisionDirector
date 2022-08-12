import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/auth/account.dart';
import 'package:vision_director/infrastructure/auth/auth_dto.dart';

/// [GetAccountCubit] stores the current user's account information.
@injectable
class GetAccountCubit extends HydratedCubit<Account> {
  GetAccountCubit() : super(Account.empty());

  void setAccount(Account account) => emit(
        state.copyWith(
          id: account.id,
          username: account.username,
          role: account.role,
          email: account.email,
        ),
      );

  @override
  Account? fromJson(Map<String, dynamic> json) =>
      UserDto.fromJson(json['account']).toDomain();

  @override
  Map<String, dynamic>? toJson(Account state) =>
      {"account": UserDto.fromDomain(state).toJson()};
}
