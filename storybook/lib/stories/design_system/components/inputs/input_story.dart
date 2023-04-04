import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class InputsStory implements DefaultStory {
  @override
  String get name => 'Design System/Components/Inputs';

  @override
  String get description => 'Inputs';

  @override
  Widget buildStory(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: SafeArea(
        child: Column(
          children: [
            const InputBaseWidget(
              helperText: "Preencha o email",
              placeHolder: "nome@exemplo.com",
              textInputType: TextInputType.emailAddress,
              titleText: "Email",
            ),
            const SpacingVertical.spacing24(),
            const InputBaseWidget(
              errorText: "Email inválido",
              placeHolder: "nome@exemplo.com",
              textInputType: TextInputType.emailAddress,
              titleText: "Email",
            ),
            const SpacingVertical.spacing24(),
            const InputBaseWidget(
              disabled: true,
              placeHolder: "nome@exemplo.com",
              textInputType: TextInputType.emailAddress,
              titleText: "Email",
            ),
            const SpacingVertical.spacing24(),
            InputBaseWidget(
              leadingIcon: Icons.mail01.iconCopyWith(color: Colors.neutral400),
              obscureText: true,
              placeHolder: "● ● ● ● ● ● ● ●",
              style: InputBaseStyle.light,
              textInputType: TextInputType.text,
              titleText: "Senha",
              trailingIcon:
                  Icons.helpCircle.iconCopyWith(color: Colors.neutral400),
            ),
            const SpacingVertical.spacing24(),
            InputBaseWidget(
              helperText: "Esqueceu sua senha?",
              obscureText: true,
              placeHolder: "● ● ● ● ● ● ● ●",
              style: InputBaseStyle.light,
              textInputType: TextInputType.text,
              titleText: "Senha",
              trailingIcon: Icons.eye.iconCopyWith(color: Colors.neutral400),
            ),
          ],
        ),
      ),
    );
  }
}
