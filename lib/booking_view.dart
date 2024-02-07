import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hotel_room_booking/validator.dart';
import 'constants.dart';

class BookingView extends StatefulHookConsumerWidget {
  const BookingView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookingViewState();
}

class _BookingViewState extends ConsumerState<BookingView> {
  @override
  Widget build(BuildContext context) {
    // print("SignIn view rendered");
    final emailController = useTextEditingController();
    final isEmailClearVisible = useState(false);
    final email = useState("");
    final nameController = useTextEditingController();
    final name = useState("");
    final isNameClearVisible = useState(false);

    void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

    useEffect(() {
      void emailListener() {
        email.value = emailController.text;
        isEmailClearVisible.value = emailController.text.isNotEmpty;
      }

      void nameListener() {
        name.value = nameController.text;
        isNameClearVisible.value = nameController.text.isNotEmpty;
      }

      emailController.addListener(emailListener);
      nameController.addListener(nameListener);

      return null;
    }, [emailController, nameController]);

    return ListView(
      children: [
        TextFormField(
          cursorHeight: 30,
          enableInteractiveSelection: true,
          onTapOutside: (event) => dismissKeyboard(),
          controller: nameController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (input) => input!.split(" ").length > 1 || input.isEmpty
              ? null
              : "Please enter your full name",
          onTap: () {},
          onChanged: (_) {},
          style: const TextStyle(fontSize: 30),
          cursorColor: Constants.deepPurple,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.all(10),
            suffixIcon: nameController.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    onPressed: nameController.clear,
                    color: Constants.lightPurple,
                    iconSize: 25,
                  ),
            labelText: "Name",
            floatingLabelStyle:
                const TextStyle(color: Constants.deepPurple, fontSize: 25),
            labelStyle:
                const TextStyle(fontSize: 25, color: Constants.lightPurple),
            hintText: "Enter your Full Name",
            hintStyle: const TextStyle(color: Constants.lightPurple),
            focusColor: Constants.deepPurple,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Constants.deepPurple,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Constants.deepPurple,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Constants.deepPurple),
            ),
            enabled: true,
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          cursorHeight: 30,
          enableInteractiveSelection: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (input) => input!.isValidEmail() || input.isEmpty
              ? null
              : "Please enter a valid email address",
          style: const TextStyle(color: Constants.deepPurple, fontSize: 30),
          onTap: () {
            // print("email field ");
          },
          onChanged: (_) {},
          onTapOutside: (event) => dismissKeyboard(),
          controller: emailController,
          cursorColor: Constants.deepPurple,
          decoration: InputDecoration(
            suffixIcon: emailController.text.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    onPressed: emailController.clear,
                    // onPressed: null,
                    color: Constants.lightPurple,
                    iconSize: 25,
                  ),
            labelText: "Email",
            floatingLabelStyle:
                const TextStyle(color: Constants.deepPurple, fontSize: 25),
            labelStyle:
                const TextStyle(fontSize: 25, color: Constants.lightPurple),
            hintText: "Enter Email",
            hintStyle: const TextStyle(color: Constants.lightPurple),
            focusColor: Constants.deepPurple,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Constants.deepPurple,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Constants.deepPurple,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Constants.deepPurple),
            ),
            enabled: true,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              fixedSize: const Size(360, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onPressed: () => DefaultTabController.of(context).animateTo(2),
          ),
        ),
      ],
    );
  }
}
