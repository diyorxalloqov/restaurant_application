import 'package:restaurant_app/modules/global/imports/app_imports.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  bool isShowing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.height / 1.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(loginHint, style: mediumStyle),
                      const SpaceHeight(height: 40),
                      TextFormFieldWidget(hintText: nameHint),
                      const SpaceHeight(height: 10),
                      TextFormFieldWidget(hintText: emailHint),
                      const SpaceHeight(height: 10),
                      TextFormFieldWidget(
                          onTap: () {
                            setState(() {
                              isShowing = !isShowing;
                            });
                          },
                          hintText: passwordHint,
                          obscureText: isShowing,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                                isShowing ? AppIcon.hide : AppIcon.unhide),
                          )),
                      const SpaceHeight(height: 22),
                      InkWell(
                          onTap: () =>
                              Navigator.pushReplacementNamed(context, 'login'),
                          child: Text("$haveAccaunt - $login",
                              style: TextStyle(
                                  fontWeight: AppFontWeight.w_700,
                                  fontSize: AppSizes.size_14,
                                  color: context.isDark
                                      ? Colors.white
                                      : Colors.black)))
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, he(55)),
                          backgroundColor:
                              context.isDark ? Colors.black : Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: elevatedButtonBorderColor)),
                          padding: const EdgeInsets.only(left: 13)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AppIcon.google),
                          Text(googleSign,
                              style: TextStyle(
                                  fontWeight: AppFontWeight.w_700,
                                  fontSize: AppSizes.size_16,
                                  color: context.isDark
                                      ? Colors.white
                                      : Colors.black)),
                          const SpaceWidth(width: 10),
                        ],
                      )),
                  const SpaceHeight(height: 18),
                  Text(loginDescription, style: smallStyle),
                  const SpaceHeight(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider(color: dividerColor)),
                      const SpaceWidth(width: 10),
                      Text(or, style: smallStyle),
                      const SpaceWidth(width: 10),
                      Expanded(child: Divider(color: dividerColor))
                    ],
                  ),
                  const SpaceHeight(height: 12),
                  MainButton(onPressed: () {}, text: register)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
