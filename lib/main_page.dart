import 'package:flutter/material.dart';
import 'package:flutter_state_management/logic/home_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'logic/home_page_notifier.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homePageProvider.notifier);
    final model = ref.watch(homePageProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: model.viewState.isLoading ? const Center(child: CircularProgressIndicator(),) : Column(
            children: <Widget>[
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: model.dropdown1Value,
                  items: <String>['One', 'Two', 'Free'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: notifier.updateDropDown1Value,
                ),
              ),
              const SizedBox(height: 16),
              Checkbox(
                  value: model.checkbox1Value,
                  onChanged: notifier.updateCheckbox1Value),
              const SizedBox(height: 16),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: model.dropdown2Value,
                  items: <String>['Four', 'Six', 'Eight'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: notifier.updateDropDown2Value,
                ),
              ),
              const SizedBox(height: 16),
              Checkbox(
                  value: model.checkbox2Value,
                  onChanged: notifier.updateCheckbox2Value),
            ],
          ),
        ),
      ),
    );
  }
}
