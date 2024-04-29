enum PAGES {
  maps,
  location,
  splash,
  main,
  story,
  detail,
  login,
  register,
  upload,
  setting,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.location:
        return "location";

      case PAGES.maps:
        return "maps";

      case PAGES.splash:
        return "/splash";

      case PAGES.main:
        return "/";

      case PAGES.story:
        return "story";

      case PAGES.detail:
        return "detail";

      case PAGES.login:
        return "/login";

      case PAGES.register:
        return "/register";

      case PAGES.setting:
        return "settings";

      case PAGES.upload:
        return "upload";

      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.location:
        return "Location";

      case PAGES.maps:
        return "Maps";

      case PAGES.main:
        return "Main";

      case PAGES.splash:
        return "Splash";

      case PAGES.detail:
        return "Detail";

      case PAGES.story:
        return "Story";

      case PAGES.login:
        return "Login";

      case PAGES.register:
        return "Register";

      case PAGES.upload:
        return "Upload";

      case PAGES.setting:
        return "Setting";

      default:
        return "Main";
    }
  }

  String get screenTitle {
    switch (this) {
      case PAGES.location:
        return "Location";

      case PAGES.maps:
        return "Maps";

      case PAGES.main:
        return "Main";

      case PAGES.splash:
        return "Splash";

      case PAGES.detail:
        return "Detail";

      case PAGES.story:
        return "Story";

      case PAGES.login:
        return "Login";

      case PAGES.register:
        return "Register";

      case PAGES.upload:
        return "Upload";

      case PAGES.setting:
        return "Setting";

      default:
        return "Main";
    }
  }
}
