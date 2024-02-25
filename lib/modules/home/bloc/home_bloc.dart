import 'package:chatify/local_database/user_store.dart';
import 'package:chatify/modules/auth/auth_constants.dart';
import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/home/domain/home_use_case.dart';
import 'package:chatify/modules/snackbar/bloc/snackbar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase _homeUseCase;
  final SnackbarBloc _snackbarBloc;
  HomeBloc({
    required HomeUseCase homeUseCase,
    required SnackbarBloc snackbarBloc,
  })  : _homeUseCase = homeUseCase,
        _snackbarBloc = snackbarBloc,
        super(HomeInitialState()) {
    on<AddFriendEvent>(_onAddFriendEvent);
    on<GetAllFriendsEvent>(_onGetAllFriendsEvent);
  }

  void _onGetAllFriendsEvent(GetAllFriendsEvent event, Emitter emit) async {
    try {
      List<UserEntity> friends =
          await _homeUseCase.getAllFriends(UserStore.getUserId()!);
      emit(GetAllFriendsSuccessState(friends));
    } catch (e) {
      _snackbarBloc.add(ShowSnackbarEvent.forSomethingWentWrong());
    }
  }

  void _onAddFriendEvent(AddFriendEvent event, Emitter emit) async {
    try {
      UserEntity? user =
          await _homeUseCase.getUserByInviteCode(event.inviteCode);
      if (user != null) {
        await _homeUseCase.addFriend(UserStore.getUserId()!, user);
        emit(AddFriendSuccessState());
      } else {
        _snackbarBloc.add(
            ShowSnackbarEvent.forError(AuthConstants.noUserFoundForInviteCode));
      }
    } catch (e) {
      _snackbarBloc.add(ShowSnackbarEvent.forSomethingWentWrong());
    }
  }
}
