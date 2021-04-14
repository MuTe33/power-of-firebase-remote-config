import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:remote_config_tutorial/get_it.dart';
import 'package:remote_config_tutorial/ui/home_page_view_model.dart';
import 'package:remote_config_tutorial/ui/widget/new_home_widget.dart';
import 'package:remote_config_tutorial/ui/widget/old_home_widget.dart';

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
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildHomeFeature(),
                  _buildTextFormField(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHomeFeature() {
    return viewModel.isNewHomeEnabledFeature
        ? NewHomeWidget()
        : OldHomeWidget();
  }

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
}
