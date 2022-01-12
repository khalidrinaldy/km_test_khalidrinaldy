import 'package:get/get.dart';

class LoginPageController extends GetxController {
  RxString _name = "".obs;
  RxString _palindrome = "".obs;
  RxBool _isPalindrome = false.obs;
  RxBool _isLoading = false.obs;
  RxString _selectedName = "".obs;

  String get name => _name.value;
  String get palindrome => _palindrome.value;
  bool get isPalindrome => _isPalindrome.value;
  bool get isLoading => _isLoading.value;
  String get selectedName => _selectedName.value;

  set name(String name) => _name.value = name;
  set palindrome(String palindrome) => _palindrome.value = palindrome;
  set isPalindrome(bool isPalindrome) => _isPalindrome.value =  isPalindrome;
  set isLoading(bool isLoading) => _isLoading.value = isLoading;
  set selectedName(String selectedName) => _selectedName.value = selectedName;

  String reverseString(String input) {
    var chars = input.split('');
    return chars.reversed.join();
  }

  void checkPalindrome() {
    String pld = reverseString(palindrome.toLowerCase());
    isPalindrome = pld == palindrome.toLowerCase();
  }
}
