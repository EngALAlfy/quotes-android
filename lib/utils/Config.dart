import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Config {
  static const String URL = "http://144.91.81.219:5000";
  static const String API_URL = URL + "/api/app";

  static const String AD_APP_ID = "ca-app-pub-8532116945853033~3040334375";
  static const String AD_BANNER_ID = "ca-app-pub-8532116945853033/9886790239";
  static const String AD_FULL_ID = "ca-app-pub-8532116945853033/4000038739";
  static const String AD_REWARD_ID = "ca-app-pub-8532116945853033/6222877396";

  static const int QUOTES_COUNT = 30;

  static const Color PRIMARY_COLOR = Colors.white;
  static const Color ACCENT_COLOR = Colors.black;

  static const PageTransitionType PAGE_TRANSITION =
      PageTransitionType.leftToRight;

  static const Map<String, String> FONTS = {
    "hor": "خط عربي الاول",
    "22876-gen01": "خط عربي الثاني",
    "Sulimany": "خط عربي الثالث",
    "Ulamjad": "خط عربي الرابع",
    "VIP-Rawy-Regular": "خط عربي الخامس",
    "Sanabel-Khebrat-Musamem-2021": "خط عربي السادس",
    "mcs-diwany-jaly-s-u": "خط عربي السابع",
    "K-Kamran": "خط عربي الثامن",
    "arabswell_2": "خط عربي التاسع",
    "arabswell_1": "خط عربي العاشر",
    "abdo-free": "خط عربي الحادي عشر",
    "decotype": "خط عربي الثاني عشر",
    "FFWahm-Two": "خط عربي الثالث عشر",
  };

  static const Map<String, String> flip1 = {
    "ا": "ا",
    "ب": "ب",
    "و": "و",
    "ي": "يہ",
    "ث": "ثہ",
    "ت": "تہ",
    "خ": "خہ",
    "ج": "جہ",
    "د": "د",
    "ذ": "ذ",
    "ز": "ز",
    "س": "سہ",
    "ش": "شہ",
    "ص": "ص",
    "غ": "غہ",
    "ك": "كُہ",
    "ف": "فُہ",
    "م": "م",
    "ل": "لہ",
    "ن": "ن",
    "ه": "ه",
    "ح": "حہ",
    "ع": "عہ",
    "ق": "ق",
    "ط": "طہ",
    "ظ": "ظ",
    "ى": "ي",
    "1": "1",
    "2": "2ً",
    "3": "3ً",
    "4": "4ً",
    "5": "5ً",
    "6": "6ً",
    "7": "7َ",
    "8": "8ً",
    "9": "9ً",
    "0": "0ً",
  };
  static const Map<String, String> flip2 = {
    "ا": "أ",
    "ب": "بہ",
    "و": "و",
    "ث": "ثہ",
    "ت": "تہ",
    "خ": "خہ",
    "ج": "جہ",
    "د": "د",
    "ذ": "ذ",
    "ز": "ز",
    "س": "سہ",
    "ش": "شہ",
    "ص": "صہ",
    "غ": "غہ",
    "ك": "كہ",
    "ف": "فہ",
    "م": "مہ",
    "ل": "ل",
    "ن": "نہ",
    "ه": "ه",
    "ح": "حہ",
    "ع": "عہ",
    "ق": "قہ",
    "ط": "طہ",
    "ظ": "ظہ",
    "ي": "يہ",
  };
  static const Map<String, String> flip3 = {
    "ا": "آ",
    "ب": "بـٌـٌٌـٌٌٌـٌٌـٌ",
    "و": "وُ",
    "ي": "ي",
    "ث": "ثُ",
    "ت": "تـٌـٌٌـ",
    "خ": "ځـٌٌـٌٌ",
    "ج": "جـ,ـ",
    "د": "ڊ",
    "ذ": "ڏ",
    "ز": "ڒٍ",
    "س": "ڛـ,ـ",
    "ش": "شُـُـُُـُ",
    "ص": "صُـ,ـ",
    "غ": "غٍـُـُُـُُُـُُُُـُُُـُُـُ",
    "ك": "كُـُ",
    "ف": "فُـ,ـ",
    "م": "مـْـْْـْ",
    "ل": "لُـِـِِـِِِـِِـِـ",
    "ن": "نـِِـِـ",
    "ه": "ﮩ",
    "ح": "حـًـًًـًًًـًًـًـ",
    "ع": "عٌـِـِِـِـ",
    "ق": "قٌـ,ـ",
    "ط": "طُـٌـٌٌـٌ",
    "ظ": "ظً",
    "ى": "ﮯ",
    "1": "(̲̅1̲̅)",
    "2": "(̲̅2̲̅)",
    "3": "(̲̅3̲̅)",
    "4": "(̲̅4̲̅)",
    "5": "(̲̅5̲̅)",
    "6": "(̲̅6̲̅)",
    "7": "(̲̅7̲̅)",
    "8": "(̲̅8̲̅)",
    "9": "(̲̅9̲̅)",
    "0": "(̲̅0̲̅)",
  };
  static const Map<String, String> flip4 = {
    "ا": "آإ",
    "ب": "بـ♥̨̥̬̩",
    "و": "و",
    "ي": "ي",
    "ث": "ثـ♥̨̥̬̩",
    "ت": "تـ♥̨̥̬̩",
    "خ": "خ",
    "ج": "جـ♥̨̥̬̩",
    "د": "د",
    "ذ": "ذ",
    "ز": "ز",
    "س": "س",
    "ش": "ش",
    "ص": "ص",
    "ع": "ع",
    "ك": "گ♥̨̥̬̩",
    "ف": "ف",
    "م": "مـ♥̨̥̬̩",
    "ل": "ل",
    "ن": "ن",
    "ه": "هـ♥̨̥̬̩",
    "ح": "حـ♥̨̥̬̩",
    "غ": "غ♥̨̥̬̩",
    "ق": "قـ♥̨̥̬̩",
    "ط": "ط♥̨̥̬̩",
    "ظ": "ظ♥̨̥̬̩",
    "ى": "ے",
    "1": "¹",
    "2": "²",
    "3": "³",
    "4": "⁴",
    "5": "⁵",
    "6": "⁶",
    "7": "⁷",
    "8": "⁸",
    "9": "⁹",
    "0": "⁰",
  };
  static const Map<String, String> flip5 = {
    "ا": "آ͠",
    "ب": "ب͠",
    "و": "و͠",
    "ي": "ي͠",
    "ث": "ث͠",
    "ت": "ت͠",
    "خ": "خ͠",
    "ج": "ج͠",
    "د": "د͠",
    "ذ": "ذ͠",
    "ز": "ز͠",
    "س": "س͠",
    "ش": "ش͠",
    "ص": "ص͠",
    "ع": "ع͠",
    "ك": "گ͠",
    "ف": "ف͠",
    "م": "م͠",
    "ل": "ل͠",
    "ن": "ن͠",
    "ه": "ه͠",
    "ح": "ح͠",
    "غ": "غ͠",
    "ق": "ق͠",
    "ط": "ط͠",
    "ظ": "ظ͠",
    "ى": "ے͠",
    "1": "1͠",
    "2": "2͠",
    "3": "3͠",
    "4": "4͠",
    "5": "5͠",
    "6": "6͠",
    "7": "7͠",
    "8": "8͠",
    "9": "9͠",
    "0": "0͠",
  };
  static const Map<String, String> flip6 = {
    "ا": "آ̯͡",
    "ب": "ب̯͡",
    "و": "ۆ̯͡",
    "ي": "ي̯͡",
    "ث": "ث̯͡",
    "ت": "ت̯͡",
    "خ": "خ̯͡",
    "ج": "ج̯͡",
    "د": "د̯͡",
    "ذ": "ذ̯͡",
    "ز": "ز̯͡",
    "ر": "ر̯͡",
    "س": "س̯͡",
    "ش": "ش̯͡",
    "ص": "ص̯͡",
    "غ": "غ̯͡",
    "ك": "ك̯͡",
    "ف": "ف̯͡",
    "م": "م̯͡",
    "ل": "ل̯͡",
    "ن": "ن̯͡",
    "ه": "ہ̯͡",
    "ح": "ح̯͡",
    "ع": "ع̯͡",
    "ق": "ق̯͡",
    "ط": "ط̯͡",
    "ظ": "ظ̯͡",
    "ى": "ﮯ̯͡",
    "1": "1̯͡",
    "2": "2̯͡",
    "3": "3̯͡",
    "4": "4̯͡",
    "5": "5̯͡",
    "6": "6̯͡",
    "7": "7̯͡",
    "8": "8̯͡",
    "9": "9̯͡",
    "0": "0̯͡"
  };
  static const Map<String, String> flip7 = {
    "ا": "آ̀́",
    "ب": "ب̀́",
    "و": "ۈ̀́",
    "ي": "ي̀́",
    "ث": "ث̀́",
    "ت": "ت̀́",
    "خ": "خ̀́",
    "ج": "ج̀́",
    "د": "د̀́",
    "ذ": "ذ̀́",
    "ز": "ز̀́",
    "ر": "ر̀́",
    "س": "س̀́",
    "ش": "ش̀́",
    "ص": "ص̀́",
    "غ": "غ̀́",
    "ك": "ك̀́",
    "ف": "ف̀́",
    "م": "م̀́",
    "ل": "ل̀́",
    "ن": "ن̀́",
    "ه": "ه̀́",
    "ح": "ح̀́",
    "ع": "ع̀́",
    "ق": "ق̀́",
    "ط": "ط̀́",
    "ظ": "ظ̀́",
    "ى": "ﮯ",
    "1": "1̀́",
    "2": "2̀́",
    "3": "3̀́",
    "4": "4̀́",
    "5": "5̀́",
    "6": "6̀́",
    "7": "7̀́",
    "8": "8̀́",
    "9": "9̀́",
    "0": "0̀́"
  };
  static const Map<String, String> flip8 = {
    "ا": "إآ",
    "ب": "̜̌ب",
    "و": "ۈ",
    "ي": "يَ",
    "ث": "ثـ",
    "ت": "تـ,",
    "خ": "خ",
    "ج": "جٍ",
    "د": "ﮃ",
    "ذ": "ذ",
    "ز": "زً",
    "ر": "رٍ",
    "س": "سًٌُُ",
    "ش": "شُ",
    "ص": "ص",
    "غ": "غ",
    "ك": "گ",
    "ف": "فَ",
    "م": "مـ",
    "ل": "لُ",
    "ن": "ن",
    "ه": "ه̷̸̐",
    "ح": "و",
    "ع": "۶",
    "ق": "ق",
    "ط": "طُ",
    "ظ": "ظً",
    "ى": "ﮯ",
    "يا": "يـ/..",
    "1": "⇂",
    "2": "Շ",
    "3": "Ɛ",
    "4": "h",
    "5": "ʢ",
    "6": "9",
    "7": "L",
    "8": "8",
    "9": "6",
    "0": "0"
  };
  static const Map<String, String> flip9 = {
    "ا": "آ̲",
    "ب": "ب̲",
    "و": "ۆ̲",
    "ي": "ي̲",
    "ث": "ث̲",
    "ت": "ت̲",
    "خ": "خ̲",
    "ج": "ج̲",
    "د": "د̲",
    "ذ": "ذ̲",
    "ز": "ز̲",
    "ر": "ر̲",
    "س": "س̲",
    "ش": "ش̲",
    "ص": "ص̲",
    "غ": "غ̲",
    "ك": "ك̲",
    "ف": "ف̲",
    "م": "م̲",
    "ل": "ل̲",
    "ن": "ن̲",
    "ه": "ہ̲",
    "ح": "ح̲",
    "ع": "ع̲",
    "ق": "ق̲",
    "ط": "ط̲",
    "ظ": "ظً̲",
    "ى": "ﮯ̲",
    "1": "1̲",
    "2": "2̲",
    "3": "3̲",
    "4": "4̲",
    "5": "5̲",
    "6": "6̲",
    "7": "7̲",
    "8": "8̲",
    "9": "9̲",
    "0": "0̲"
  };
  static const Map<String, String> flip10 = {
    "ا": "ٵ̷ ",
    "ب": "ب̷",
    "و": "ۆ̷",
    "ي": "ي̷",
    "ث": "ث̷",
    "ت": "ت̷",
    "خ": "خ̷",
    "ج": "ج̷",
    "د": "د̷ِ",
    "ذ": "ذ̷",
    "ز": "ز̷",
    "ر": "ر̷",
    "س": "س̷",
    "ش": "ش̷ُ",
    "ص": "ص̷",
    "غ": "غ̷",
    "ك": "گ̷",
    "ف": "ف̷َ",
    "م": "م̷",
    "ل": "ل̷",
    "ن": "ن̷",
    "ه": "ہ̷",
    "ح": "ح̷",
    "ع": "ع̷ٍ",
    "ق": "ق̷",
    "ط": "ط̷ُ",
    "ظ": "ظ̷ً",
    "ى": "ﮯ̷",
    "1": "1̷",
    "2": "2̷",
    "3": "3̷",
    "4": "4̷",
    "5": "5̷",
    "6": "6̷",
    "7": "7̷",
    "8": "8̷",
    "9": "9̷",
    "0": "0̷"
  };
  static const Map<String, String> flip11 = {
    "ا": "آ",
    "ب": "ب",
    "و": "ۆ",
    "ي": "يَ",
    "ث": "ث",
    "ت": "ت",
    "خ": "خـ",
    "ج": "جٍ",
    "د": "دِ",
    "ذ": "ڌ",
    "ز": "ز",
    "ر": "رٍ",
    "س": "س",
    "ش": "شُ",
    "ص": "ص",
    "غ": "غ",
    "ك": "گ",
    "ف": "فَ",
    "م": "م",
    "ل": "لُ",
    "ن": "ن",
    "ه": "ہ",
    "ح": "حٍ",
    "ع": "عٍ",
    "ق": "ق",
    "ط": "طُ",
    "ظ": "ظً",
    "ى": "ﮯ",
    "1": "₁",
    "2": "₂",
    "3": "₃",
    "4": "₄",
    "5": "₅",
    "6": "₆",
    "7": "₇",
    "8": "₈",
    "9": "₉",
    "0": "₀"
  };
  static const Map<String, String> flip12 = {
    "ا": "آ",
    "ب": "بَ",
    "و": "وُ",
    "ي": "ي",
    "ث": "ث",
    "ت": "ت",
    "خ": "خـ",
    "ج": "جٍ",
    "د": "دِ",
    "ذ": "ذَ",
    "ز": "زْ",
    "ر": "رٍ",
    "س": "س",
    "ش": "شُ",
    "ص": "ص",
    "غ": "غ",
    "ك": "ڪ",
    "ف": "فُ",
    "م": "م",
    "ل": "لُِ",
    "ن": "ن",
    "ه": "هـ",
    "ح": "حٍ",
    "ع": "عٍ",
    "ق": "قٌ",
    "ط": "طُ",
    "ظ": "ظً",
    "ى": "ﮯ",
    "1": "1̣̣̝̇̇",
    "2": "2̲̣̣̣̥",
    "3": "3̍̍̍̊",
    "4": "4̩̥",
    "5": "5̲̣̥",
    "6": "6̥̥̲̣̥",
    "7": "7̣̣̣̝̇̇̇",
    "8": "8̣̝̇",
    "9": "9̲̣̣̥",
    "0": "0̲̣̣̥"
  };
  static const Map<String, String> flip13 = {
    "ا": "ا",
    "ب": "بٰٰ",
    "و": "و",
    "ي": "يٰ",
    "ث": "ثہٰـ",
    "ت": "تہٰ",
    "خ": "خ",
    "ج": "ج",
    "د": "د",
    "ذ": "ذ",
    "ز": "ز",
    "س": "سہٰ",
    "ش": "ش",
    "ص": "صہٰ",
    "ع": "ع",
    "ك": "كہٰ",
    "ف": "فہٰ",
    "م": "م",
    "ل": "لہٰ",
    "ن": "ن",
    "ه": "ه",
    "ح": "حہٰ",
    "غ": "غ",
    "ق": "ق",
    "ط": "طہٰ",
    "ظ": "ظ",
    "ى": "ي",
    "1": "1",
    "2": "2",
    "3": "3",
    "4": "4",
    "5": "5",
    "6": "6",
    "7": "7",
    "8": "8",
    "9": "9",
    "0": "0",
  };
}