import 'package:design_system/design_system.dart';
import 'package:storybook/stories/core/default_story.dart';

class LoginStory implements DefaultStory {
  @override
  String get name => 'Design System/Pages/Login';

  @override
  String get description => 'Login Page';

  @override
  Widget buildStory(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.primary900,
      appBar: AppBar(
        backgroundColor: Colors.primary900,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacings.spacing16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ImageWidget(
                  image: Images.logoMark,
                ),
              ],
            ),
            const SpacingVertical.spacing128(),
            Text(
              'Entrar',
              style: TypographyDisplayXxl.bold(context)
                  .copyWith(color: Colors.neutral050),
            ),
            const SpacingVertical.spacing08(),
            Text(
              'Que bom que você voltou! Faça seu login',
              style: TypographyTextMd.normal(context)
                  .copyWith(color: Colors.neutral300),
            ),
            const SpacingVertical.spacing32(),
            const InputBaseWidget(
              placeHolder: 'Email',
            ),
            const SpacingVertical.spacing20(),
            InputBaseWidget(
              placeHolder: 'Senha',
              trailingIcon: Icons.eye.iconCopyWith(color: Colors.neutral700),
            ),
            LinkButton.sizeMd(text: 'Esqueceu senha'),
            const SpacingVertical.spacing20(),
            TertiaryButton.sizeMd(
              onPressed: () {},
              text: 'Entrar',
            ),
            const SpacingVertical.spacing32(),
            const HorizontalDividerWidget(
              text: 'Ou acesse com:',
              style: HorizontalDividerStyle(
                dividerColor: Colors.neutral200,
                foregroundColor: Colors.neutral300,
              ),
            ),
            const SpacingVertical.spacing20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleSignInButton.icon(),
                const SpacingHorizontal.spacing12(),
                AppleSignInButton.icon(),
              ],
            ),
            const SpacingVertical.spacing24(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não possui uma conta?',
                  style: TypographyTextSm.normal(context)
                      .copyWith(color: Colors.neutral025),
                ),
                LinkButton.sizeMd(text: 'Cadastre-se'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
