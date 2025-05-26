String formatarData(String dateFormatada) {
  final date = DateTime.parse(dateFormatada);
  return '${date.day.toString().padLeft(2, '0')}/'
      '${date.month.toString().padLeft(2, '0')}/'
      '${date.year}';
}

class User {
  final String naoPrecisaSerIgualoJSONname;
  final String avatarUrl;
  final String nickName;
  final String htmlUrl;
  final int followers;
  final int following;
  final String createdAt;

  const User(
    this.naoPrecisaSerIgualoJSONname,
    this.avatarUrl,
    this.nickName,
    this.htmlUrl,
    this.followers,
    this.following,
    this.createdAt,
  );

  factory User.fromJson(Map<String, dynamic> minhaJsonVariavel) {
    return User(
      minhaJsonVariavel['name'] ?? 'Definir nickname',
      minhaJsonVariavel['avatar_url'],
      minhaJsonVariavel['login'],
      minhaJsonVariavel['html_url'],
      minhaJsonVariavel['followers'],
      minhaJsonVariavel['following'],
      minhaJsonVariavel['created_at'],
    );
  }
}
