import 'package:Devnology/app/models/countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_select/smart_select.dart';

class FeaturesBrightness extends StatefulWidget {
  final Function filter;
  final String rates;
  final String currency;

  FeaturesBrightness({Key key, this.filter, this.rates, this.currency})
      : super(key: key);

  @override
  _FeaturesBrightnessState createState() => _FeaturesBrightnessState();
}

class _FeaturesBrightnessState extends State<FeaturesBrightness> {
  List<S2Choice<int>> modes = [];

  ThemeData get theme => Theme.of(context);

  String selects = "";
  String flag = "";

  @override
  void didUpdateWidget(covariant FeaturesBrightness oldWidget) {
    modes = [];
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    countries.asMap().forEach((index, item) {
      //todo
      if (widget.currency == item['Code']) {
        flag = item['flag'];
      }
      modes.add(S2Choice(value: index, title: item['Code']));
    });

    return SmartSelect<int>.single(
      title: 'Select country',
      value: 0,
      onChange: (selected) {
        widget.filter(selected.valueTitle);
        selects = selected.valueTitle;
      },
      modalType: S2ModalType.bottomSheet,
      modalHeader: true,
      choiceItems: modes,
      modalHeaderBuilder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            top: 25.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "currencys",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
      choiceConfig: const S2ChoiceConfig(
        type: S2ChoiceType.radios,
        layout: S2ChoiceLayout.list,
      ),
      choiceStyle: S2ChoiceStyle(spacing: 7),
      tileBuilder: (context, state) {
        return IconButton(
          icon: SvgPicture.asset(flag),
          onPressed: state.showModal,
        );
      },
    );
  }
}
