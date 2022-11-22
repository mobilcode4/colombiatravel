// ignore_for_file: prefer_typing_uninitialized_variables, file_names, unnecessary_getters_setters

class UserApp {
  var _uid;
  var _name;
  var _email;
  var _password;
  var _genre;
  var _favorites;
  var _bornDate;
  get uid => _uid;

  UserApp(this._uid, this._name, this._email, this._password, this._genre,
      this._favorites, this._bornDate);

  // ignore: non_constant_identifier_names
  UserApp.Empty();

  UserApp.fromJson(Map<String, dynamic> json)
      : _uid = json['uid'],
        _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _favorites = json['favoritesGenres'],
        _bornDate = json['bornDate'];

  Map<String, dynamic> toJson() => {
        'uid': _uid,
        'name': _name,
        'email': _email,
        'password': _password,
        'genre': _genre,
        'favorites': _favorites,
        'bornDate': _bornDate
      };

  set uid(value) => _uid = value;

  get name => _name;

  set name(value) => _name = value;

  get email => _email;

  set email(value) => _email = value;

  get password => _password;

  set password(value) => _password = value;

  get genre => _genre;

  set genre(value) => _genre = value;

  get favorites => _favorites;

  set favorites(value) => _favorites = value;

  get bornDate => _bornDate;

  set bornDate(value) => _bornDate = value;
}
