String getTitle(String url) {
  //Extract Title from the URL

  String title = '';
  List titleList = url.substring(29).split('-');
  for (int index = 0; index < titleList.length - 1; index++) {
    title = title + ' ' + titleList[index];
  }

  return title.substring(0, 2).toUpperCase().trim() + title.substring(2);
}
