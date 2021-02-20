import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveller_helper/components/components.dart';
import 'package:traveller_helper/services/repositories/user_repository.dart';
import './cubit/traveller_cubit.dart';
import 'traveller_completed.dart';

const tmAddress = '0x36b6ef957050C28E3A96Dc5D83Fc42ceb081893C';

class TravellerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const appBarHeight = 136;
    const bottomBarHeight = 56;
    return BlocProvider(
      create: (_) {
        return TravellerCubit(userRepository: context.read<UserRepository>());
      },
      child: Scaffold(
        appBar: THAppBar(),
        body: SingleChildScrollView(
          child: Container(
            height: size.height - appBarHeight - bottomBarHeight,
            child: BlocBuilder<TravellerCubit, Response<User>>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                switch (state.status) {
                  case Status.INTIIAL:
                    context.read<TravellerCubit>().fetchUser();
                    return Container();
                    break;
                  case Status.ERROR:
                    return TravellerError(
                      message: state.message,
                    );
                    break;
                  case Status.COMPLETED:
                    if (state.data.travellerManagerAddress == null) {
                      return TravellerRegistration();
                    }
                    return TravellerCompleted(
                      user: state.data,
                    );
                    break;
                  default:
                    return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
        bottomNavigationBar: THBottomBar(TH.traveller),
      ),
    );
  }
}

class TravellerError extends StatelessWidget {
  TravellerError({this.message});

  final String message;
  static const double middleMargin = 15;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/server_down.png'),
          SizedBox(height: middleMargin),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: middleMargin),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: RaisedButton(
              color: Colors.teal.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {
                context.read<TravellerCubit>().fetchUser();
              },
              child: Text(
                'Coba Lagi',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TravellerRegistration extends StatelessWidget {
  static const double middleMargin = 15;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/stranded_traveler.png'),
          SizedBox(height: middleMargin),
          Text(
            'Anda belum terdaftar sebagai traveller',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: middleMargin),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: RaisedButton(
              color: Colors.teal.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {
                context.read<TravellerCubit>().fetchUser();
              },
              child: Text(
                'Daftar Menjadi Traveller',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
