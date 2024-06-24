enum FragmentTarget {
  HOME,
  REQUEST,
  SHOPPING_CART,
  SETTING,
}

class RouterArguments {
  final FragmentTarget? fragmentTarget;

  RouterArguments({this.fragmentTarget});
}
