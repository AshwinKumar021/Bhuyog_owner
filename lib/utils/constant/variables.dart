
class OnBoardingItem {
  const OnBoardingItem({
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;
}
class Variables {
  //Onboarding Screen Images
  

  static const List<OnBoardingItem> onBoardingItems = [
  OnBoardingItem(
    title: 'Book Your Services',
    subtitle: 'Captains are Always Ready!',
    image: 'assets/images/on-boarding-1.png',
  ),
  OnBoardingItem(
    title: 'Add Your Properties',
    subtitle: 'To Book Quickly and Easily!',
    image: 'assets/images/on-boarding-2.png',
  ),
  OnBoardingItem(
    title: 'Task Insights',
    subtitle: 'View your Tasks history!',
    image: 'assets/images/on-boarding-3.png',
  ),
];
  //Icons
  static const String FILTER_ICON = 'assets/icons/filter.png';
  static const String APP_LOGO = 'assets/images/bhuyog_logo.png';
  static const String USER_ICON = 'assets/icons/user.png';
  static const String CALENDAR_ICON = 'assets/icons/calendar.png';
  static const String MESSAGE_ICON = 'assets/icons/message.png';
  static const String HOME_ICON = 'assets/icons/home.png';
  static const String MENU_ICON = 'assets/icons/menu.png';
  static const String LAND_MAP = 'assets/images/land_map.png';
  static const String AUTH = 'assets/images/auth.png';
  static const String FORGOT_PASSWORD = 'assets/images/forgot_password.png';
  static const String LOGIN = 'assets/images/login.png';
  static const String LOGOUT = 'assets/images/logout.png';
  static const String LAND = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqcEmhLiSNKFrmSfj5kHBvS0PkINoLlOV18Swzpjb1PWjirWSrt8Nys4mWwjkiXEcN_qU&usqp=CAU';
  static const String MAP_NETWORK_IMAGE =
      'https://1.bp.blogspot.com/-T-EiGEHM1rE/XXheM0zqA2I/AAAAAAAACKo/uNn0t2VesUYE6QtOxXm4qoaiJLKWhu21QCLcBGAsYHQ/s1600/Screen%2BShot%2B2019-09-11%2Bat%2B12.37.26%2BPM.png';
  static const String PROFILE_IMAGE =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdupVKMHWoSkRTff4fNGVIe2qrnCh72PpuHQ&s';
      static const PROFILE_IAMGE1='https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1715883719~exp=1715887319~hmac=7ea7a9295b72cc489c60d61d773ac605a80320fa435ac3731b6f415d6da3c3e1&w=740';
static const String PROFILE_IAMGE2='https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1715883719~exp=1715887319~hmac=7ea7a9295b72cc489c60d61d773ac605a80320fa435ac3731b6f415d6da3c3e1&w=740';
  static const String PLUMBING = 'https://5.imimg.com/data5/QX/VQ/DV/SELLER-13667260/sanitary-work-services-500x500.jpg';
  static const String SHIFTING = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0bpGNBRnlix4SfDjdrwQ6M6Eoy2U2qeoXjzgZJNgYXg&s';
  static const String WASHING = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHHRU9-PTTQ2tj59l1DygXlOwyVLZVqRoUQZKyqkc2bQ&s';
  static const String GLASS_CUTTING = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA2ux3u0o5Sp47QimE0KberbqCf74hM1nqYcXunZ3_kQ&s';
  static const List<String> SERVICES_LIST=[PLUMBING,SHIFTING,WASHING,GLASS_CUTTING]; 
  static const List<String> SERVICES_TITLE_LIST=['Plumbing','Shifting','Washing','Site Cleaning']; 
  static const String BANK_IMAGE='https://static.vecteezy.com/system/resources/thumbnails/002/249/718/small/bank-building-icon-finance-symbol-illustration-for-web-and-mobil-app-on-grey-background-free-vector.jpg';
  static const List<String> ALL_SERVICES_LIST=[PLUMBING,SHIFTING,WASHING,GLASS_CUTTING,PLUMBING,SHIFTING,WASHING,GLASS_CUTTING,PLUMBING,SHIFTING,WASHING,GLASS_CUTTING,PLUMBING,SHIFTING,WASHING,GLASS_CUTTING,]; 
  static const List<String> All_SERVICES_TITLE_LIST=['Plumbing','Shifting','Washing','Site Cleaning','Plumbing','Shifting','Washing','Site Cleaning','Plumbing','Shifting','Washing','Site Cleaning','Plumbing','Shifting','Washing','Site Cleaning']; 
 
  //Text
  static const String MESSAGES = 'Message';
  static const String PLEASE_PRESS_BACK_TO_EXIT = 'Press back to exit';

}
