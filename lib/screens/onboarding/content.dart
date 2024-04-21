class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Be easier to manage your own money",
    image: "assets/images/IMG1.png",
    desc: "Just using your phone, you can manage as your cashflow more easy and detail",
  ),
  OnboardingContents(
    title: "Be more flexible and secure",
    image: "assets/images/IMG3.png",
    desc:
        "Use this platform in all your device, don't worry about anything, we protect you",
  ),
  OnboardingContents(
    title: "Be More mindful spending,Let's get started!",
    image: "assets/images/IMG4.png",
    desc:
        "Be mindful spending and you will be closer to financial freedom",
  ),
];