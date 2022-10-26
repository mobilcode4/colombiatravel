class User {
  dynamic _name;
  dynamic _email;
  dynamic _password;
  dynamic _genre;
  dynamic _favoriteGenre;
  dynamic _bornDate;

  User(this._name, this._email, this._password, this._genre,
      this._favoriteGenre, this._bornDate);

  User.Empty();



  User.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _favoriteGenre =['favoriteGenre'],
        _bornDate = json['bornDate'];

  // ignore: non_constant_identifier_names
  Map<String, dynamic> ToJson() => {
    'name' : _name,
    'email' : _email,
    'password': _password,
    'genre' : _genre,
    'favoriteGenre' : _favoriteGenre,
    'bornDate' : _bornDate
  };

  dynamic get bornDate => _bornDate;

  set bornDate(dynamic value) {
    _bornDate = value;
  }

  dynamic get favoriteGenre => _favoriteGenre;

  set favoriteGenre(dynamic value) {
    _favoriteGenre = value;
  }

  dynamic get genre => _genre;

  set genre(dynamic value) {
    _genre = value;
  }

  dynamic get password => _password;

  set password(dynamic value) {
    _password = value;
  }

  dynamic get email => _email;

  set email(dynamic value) {
    _email = value;
  }

  dynamic get name => _name;

  set name(dynamic value) {
    _name = value;
  }
}

