import 'package:bloc/bloc.dart';
import 'package:flutter_door_buzzer/src/domain/blocs/account/account.dart';
import 'package:flutter_door_buzzer/src/data/repositories/buzzer_repository.dart';
import 'package:meta/meta.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final String _tag = 'AccountBloc';

  final BuzzerRepository buzzerRepository;

  AccountBloc({
    @required this.buzzerRepository,
  })  : assert(buzzerRepository != null),
        super();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  AccountState get initialState => AccountUninitialized();

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    print('$_tag:mapEventToState($event)');
    if (event is AccountRefresh) {
      yield AccountLoading();

      /// TODO: Implements Account data fetch (wait API)
      yield AccountUninitialized();
    }
  }
}
