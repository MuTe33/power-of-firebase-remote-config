import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:remote_config_tutorial/get_it.dart';
import 'package:remote_config_tutorial/get_it.dart' as globals;
import 'package:remote_config_tutorial/ui/home_page_view_model.dart';
import 'package:remote_config_tutorial/ui/widget/new_home_widget.dart';
import 'package:remote_config_tutorial/ui/widget/old_home_widget.dart';

/// The wiew which is connected with view model
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.appBarTitle}) : super(key: key);

  final String appBarTitle;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<HomePageViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (context) => viewModel,
      child: Consumer<HomePageViewModel>(
        builder: (BuildContext context, HomePageViewModel viewModel, _) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.appBarTitle),
                centerTitle: true,
              ),
              body: ListView(
                children: [
                  _buildHomeFeature(),
                  _buildTextFormField(),
                  _buildRestartButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // depending on remote config value this will give us either the
  // new home widget or the old home widget
  Widget _buildHomeFeature() {
    return viewModel.isNewHomeEnabledFeature
        ? NewHomeWidget()
        : OldHomeWidget();
  }

  // depending on remote config value this will valid the input
  // in different ways and will limit the input length
  Widget _buildTextFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        decoration: InputDecoration(labelText: 'Type in something'),
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        maxLength: viewModel.getTextFieldLengthLimitationValue,
        validator: (input) {
          if (viewModel.isNameValid(input!) != true) {
            return 'Error: Not matching :)';
          }
        },
      ),
    );
  }

  // faster and easier way to reflect changes with a restart than killing the app manually
  Widget _buildRestartButton() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        left: 50.0,
        right: 50.0,
      ),
      child: ElevatedButton(
        onPressed: () => globals.startApp!(),
        child: Text('Restart'),
      ),
    );
  }
}
