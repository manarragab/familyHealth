import 'package:abg/data/const/export.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactInformationWidget extends StatelessWidget {
  const ContactInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomTextField.emailTextField(
            (value) {},
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                  child: CustomTextField.phoneTextField(
                (value) {},
              )),
              const SizedBox(width: 10),
              SvgPicture.asset(
                "assets/svg/check_phone.svg",
                color: Colors.black,
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: CustomTextField.phoneTextField(
                  (value) {},
                  hint: "WhatsApp",
                  prefixIcon: const Icon(FontAwesomeIcons.whatsapp),
                ),
              ),
              const SizedBox(width: 10),
              SvgPicture.asset(
                "assets/svg/check_phone.svg",
                color: Colors.black,
              )
            ],
          ),
        ],
      ),
    );
  }
}
