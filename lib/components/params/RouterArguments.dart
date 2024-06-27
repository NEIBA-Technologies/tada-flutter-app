enum FragmentTarget {
  HOME,
  TASK,
  BUSINESS,
  ACCOUNT,
}

class RouterArguments {
  final FragmentTarget? fragmentTarget;

  RouterArguments({this.fragmentTarget});
}
