import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // A1_PrimerPantalla
  {
    '2044raxp': {
      'es': 'Crea un cuenta',
      'en': 'Create an account',
    },
    'kvk96b9a': {
      'es': 'Ya tengo una cuenta, Inicio sesion',
      'en': 'I already have an account, Login',
    },
    '5fme7ze2': {
      'es': 'Quiero registrarme como freelancer',
      'en': 'I want to register as a freelancer',
    },
    'e9n9xv7z': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // A2_CreaCuenta
  {
    'fqhfxosd': {
      'es': 'Crea una Cuenta',
      'en': 'Create an Account',
    },
    'w8fbq6qd': {
      'es': 'Nombre de Usuario',
      'en': 'User name',
    },
    'qyz8jn8k': {
      'es': 'Crea tu nombre de usuario',
      'en': 'Create your username',
    },
    '5ejt2igx': {
      'es': 'Email ',
      'en': 'E-mail',
    },
    '1k2s07d4': {
      'es': 'Ingressa tu mail o numero',
      'en': 'Enter your email or number',
    },
    'duzws8jh': {
      'es': 'Numero de telefono',
      'en': 'Phone number',
    },
    '0rdomdr9': {
      'es': 'Ingressa tu mail o numero',
      'en': 'Enter your email or number',
    },
    '8hrnyurr': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '5ta75wx9': {
      'es': 'Crea tu contraseña',
      'en': 'Create your password',
    },
    '7318gst0': {
      'es': 'Crea tu cuenta',
      'en': 'Create your account',
    },
    'eqdiv2sl': {
      'es': 'O usa otro metodo',
      'en': 'Or use another method',
    },
    'nt2a4i5y': {
      'es': 'Registrate con Google',
      'en': 'Sign up with Google',
    },
    '18pahsw4': {
      'es': 'Registrate con  Facebook',
      'en': 'Sign up with Facebook',
    },
    'tj5ofugi': {
      'es': 'Tengo una cuenta',
      'en': 'I have an account',
    },
    '96k4zm5b': {
      'es': 'Iniciar Sesion',
      'en': 'Login',
    },
    'i6bq0pen': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // A3_Verificacion
  {
    'm8vt32wl': {
      'es': 'Codigo de verificacion',
      'en': 'Verification code',
    },
    'j0wt8bqq': {
      'es':
          'Le hemos enviado el código de verificación. Por favor ingrese el código para poder seguir adelante.',
      'en':
          'We have sent you the verification code. Please enter the code to proceed.',
    },
    'am0lz1tt': {
      'es': '+54-291 XXX-XXX',
      'en': '+54-291 XXX-XXX',
    },
    'vfbmvgvb': {
      'es': 'Verificar',
      'en': 'Verify',
    },
    '5iqum420': {
      'es': 'No recibiste el codigo? ',
      'en': 'Didn\'t receive the code?',
    },
    '7axmi8vz': {
      'es': 'Reenviar',
      'en': 'Forward',
    },
    'd4d5qm5u': {
      'es': 'Verificacion',
      'en': 'Verification',
    },
    'hvh480nv': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // A4_Inicio
  {
    '3uolrspq': {
      'es': '3',
      'en': '3',
    },
    'csw0gejj': {
      'es': 'Que servicios necesita',
      'en': 'What services do you need?',
    },
    'bnvbaxml': {
      'es': 'Bahía Blanca',
      'en': 'Bahia Blanca',
    },
    'xka1s61r': {
      'es': 'Pide tu Presupuesto',
      'en': 'Request your quote',
    },
    'vc9mj8g7': {
      'es': '',
      'en': '',
    },
    '25clpfsh': {
      'es': 'Plomero',
      'en': 'Plumber',
    },
    'myfnyhkg': {
      'es': 'Gasista',
      'en': 'Gas fitter',
    },
    'z5sur9ub': {
      'es': 'Albañil',
      'en': 'Construction worker',
    },
    'trja1zku': {
      'es': 'Pintura',
      'en': 'Paint',
    },
    'wu1f04b3': {
      'es': 'Electricista',
      'en': 'Electrician',
    },
    'ltruu3af': {
      'es': 'Carpinteria',
      'en': 'Carpentry',
    },
    'hxu5elv5': {
      'es': 'Calefaccion',
      'en': 'Heating',
    },
    '1owyvy7y': {
      'es': 'Techista',
      'en': 'Roofer',
    },
    'yuxvfcy0': {
      'es': 'Inicio',
      'en': 'Start',
    },
  },
  // A8_MisServicios
  {
    '1f9z3d8k': {
      'es': 'Mis Servicios',
      'en': 'My Services',
    },
    '4wf6hsis': {
      'es': 'Page Title',
      'en': 'Page Title',
    },
    '460io703': {
      'es': 'Mis Servicios',
      'en': 'My Services',
    },
  },
  // A9_Detalles
  {
    'nbdnof56': {
      'es': 'Detalles',
      'en': 'Details',
    },
    '17vlqoz1': {
      'es': 'Reportar',
      'en': 'Report',
    },
    '3kuij1ru': {
      'es': '(Usted debera comprar los materiales )',
      'en': '(You will have to buy the materials)',
    },
    '3ir4sfe6': {
      'es': 'Dia de inicio:',
      'en': 'Start day:',
    },
    'm2hz30x3': {
      'es': 'Hora',
      'en': 'Hour',
    },
    'ot6bd7b1': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'a8drvd0h': {
      'es': '08',
      'en': '08',
    },
    '30kswp23': {
      'es': '09',
      'en': '09',
    },
    '2w5koe35': {
      'es': '10',
      'en': '10',
    },
    'x7alto52': {
      'es': '11',
      'en': '11',
    },
    'b0ff6z3w': {
      'es': '12',
      'en': '12',
    },
    '75g6bsxz': {
      'es': '13',
      'en': '13',
    },
    'nmau97o3': {
      'es': '14',
      'en': '14',
    },
    '7nssp2f4': {
      'es': '15',
      'en': '15',
    },
    'lsnnnl16': {
      'es': '16',
      'en': '16',
    },
    '6l2wd0db': {
      'es': '17',
      'en': '17',
    },
    'nsbdtlum': {
      'es': '18',
      'en': '18',
    },
    'h9o56h3o': {
      'es': '19',
      'en': '19',
    },
    '3tuiq0dt': {
      'es': '20',
      'en': '20',
    },
    'tjqdw4ef': {
      'es': 'Dia',
      'en': 'Day',
    },
    'c94e7m64': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'lqgflsly': {
      'es': '1',
      'en': '1',
    },
    'qwp9e6x9': {
      'es': '2',
      'en': '2',
    },
    'q47avded': {
      'es': '3',
      'en': '3',
    },
    'vjvs68be': {
      'es': '4',
      'en': '4',
    },
    'cz015361': {
      'es': '5',
      'en': '5',
    },
    '12hilwq0': {
      'es': '6',
      'en': '6',
    },
    'vivql8co': {
      'es': '7',
      'en': '7',
    },
    'u9h0vlpm': {
      'es': '8',
      'en': '8',
    },
    'o9908n35': {
      'es': '9',
      'en': '9',
    },
    'fexvwoz9': {
      'es': '10',
      'en': '10',
    },
    '2bvnv99o': {
      'es': '11',
      'en': '11',
    },
    '0lo463sc': {
      'es': '12',
      'en': '12',
    },
    'u31qf5cf': {
      'es': '13',
      'en': '13',
    },
    '851yv14v': {
      'es': '14',
      'en': '14',
    },
    'k5xvi440': {
      'es': '15',
      'en': '15',
    },
    's7dkdtje': {
      'es': '16',
      'en': '16',
    },
    'r5qy9teg': {
      'es': '17',
      'en': '17',
    },
    'om91fhc9': {
      'es': '18',
      'en': '18',
    },
    'a3lc6pwt': {
      'es': '19',
      'en': '19',
    },
    'gc6lk3fj': {
      'es': '20',
      'en': '20',
    },
    '57b57pu6': {
      'es': '21',
      'en': '21',
    },
    'z6jenkqh': {
      'es': '22',
      'en': '22',
    },
    'nv82guc5': {
      'es': '23',
      'en': '23',
    },
    'rfee2419': {
      'es': '24',
      'en': '24',
    },
    'jm1efrzp': {
      'es': '25',
      'en': '25',
    },
    'iqdsce4g': {
      'es': '26',
      'en': '26',
    },
    'q7csaafl': {
      'es': '27',
      'en': '27',
    },
    'xa2xedrq': {
      'es': '28',
      'en': '28',
    },
    'xl4fy6pe': {
      'es': '29',
      'en': '29',
    },
    'v686hz2a': {
      'es': '30',
      'en': '30',
    },
    'tf7fv6g1': {
      'es': '31',
      'en': '31',
    },
    'j6wf049x': {
      'es': 'Mes',
      'en': 'Month',
    },
    'rwb9kvvn': {
      'es': 'Search...',
      'en': 'Search...',
    },
    '94390f01': {
      'es': 'Enero',
      'en': 'January',
    },
    'hbxlwviq': {
      'es': 'Febrero',
      'en': 'February',
    },
    'yfqfuqf9': {
      'es': 'Marzo',
      'en': 'March',
    },
    'c2iu15aa': {
      'es': 'Abril',
      'en': 'April',
    },
    'a666dx25': {
      'es': 'Mayo',
      'en': 'May',
    },
    'iccc31ui': {
      'es': 'Junio',
      'en': 'June',
    },
    '0kqzqsbq': {
      'es': 'Julio',
      'en': 'July',
    },
    '3wu86jpd': {
      'es': 'Agosto',
      'en': 'August',
    },
    'xk43dekn': {
      'es': 'Septiembre',
      'en': 'September',
    },
    'y15usao5': {
      'es': 'Octubre',
      'en': 'October',
    },
    'la7bd2sq': {
      'es': 'Noviembre',
      'en': 'November',
    },
    '6438vguq': {
      'es': 'Diciembre',
      'en': 'December',
    },
    'yegmwwpe': {
      'es': 'Dia de finalizacion:',
      'en': 'Completion date:',
    },
    '83nfh6wo': {
      'es': 'Hora',
      'en': 'Hour',
    },
    'pm1nhsc3': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'ldit92l7': {
      'es': '08',
      'en': '08',
    },
    'px3an10y': {
      'es': '09',
      'en': '09',
    },
    'jq3k4mmp': {
      'es': '10',
      'en': '10',
    },
    'phog151f': {
      'es': '11',
      'en': '11',
    },
    'wt9zjwk5': {
      'es': '12',
      'en': '12',
    },
    '3eib3d30': {
      'es': '13',
      'en': '13',
    },
    '462g4o5f': {
      'es': '14',
      'en': '14',
    },
    'dl24sfre': {
      'es': '15',
      'en': '15',
    },
    'lamx3g1n': {
      'es': '16',
      'en': '16',
    },
    '7hfy3c3o': {
      'es': '17',
      'en': '17',
    },
    'v0zlr1a2': {
      'es': '18',
      'en': '18',
    },
    'fnl73g9j': {
      'es': '19',
      'en': '19',
    },
    'spm8zd0l': {
      'es': '20',
      'en': '20',
    },
    '9ok1v49o': {
      'es': 'Dia',
      'en': 'Day',
    },
    'y6y4zxye': {
      'es': 'Search...',
      'en': 'Search...',
    },
    '70db3yvu': {
      'es': '1',
      'en': '1',
    },
    'vor49tap': {
      'es': '2',
      'en': '2',
    },
    'tgbihqrn': {
      'es': '3',
      'en': '3',
    },
    'm3h6azq6': {
      'es': '4',
      'en': '4',
    },
    '8zu50er1': {
      'es': '5',
      'en': '5',
    },
    '8t3khwg6': {
      'es': '6',
      'en': '6',
    },
    'whdt4im1': {
      'es': '7',
      'en': '7',
    },
    't091pvqo': {
      'es': '8',
      'en': '8',
    },
    'esqq9v34': {
      'es': '9',
      'en': '9',
    },
    'yld9hqpi': {
      'es': '10',
      'en': '10',
    },
    'el98is96': {
      'es': '11',
      'en': '11',
    },
    'g726xp1u': {
      'es': '12',
      'en': '12',
    },
    'n2pfp6x2': {
      'es': '13',
      'en': '13',
    },
    '1kfk5a34': {
      'es': '14',
      'en': '14',
    },
    'lcrfl05o': {
      'es': '15',
      'en': '15',
    },
    '4ghd3wjt': {
      'es': '16',
      'en': '16',
    },
    'rydz66zn': {
      'es': '17',
      'en': '17',
    },
    'rcpu7jjq': {
      'es': '18',
      'en': '18',
    },
    'vkipp806': {
      'es': '19',
      'en': '19',
    },
    'zuap2wn4': {
      'es': '20',
      'en': '20',
    },
    'xv15aghn': {
      'es': '21',
      'en': '21',
    },
    'exdw1puw': {
      'es': '22',
      'en': '22',
    },
    'oy83itii': {
      'es': '23',
      'en': '23',
    },
    'yczvrcme': {
      'es': '24',
      'en': '24',
    },
    'd3td6kdm': {
      'es': '25',
      'en': '25',
    },
    'mt3ln6qu': {
      'es': '26',
      'en': '26',
    },
    '3xk229mz': {
      'es': '27',
      'en': '27',
    },
    '2urmuvoq': {
      'es': '28',
      'en': '28',
    },
    '9xn548rm': {
      'es': '29',
      'en': '29',
    },
    'enhlzxqc': {
      'es': '30',
      'en': '30',
    },
    'u0ptg782': {
      'es': '31',
      'en': '31',
    },
    'ulc3c07j': {
      'es': 'Mes',
      'en': 'Month',
    },
    '3px37nvz': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'namxb81p': {
      'es': 'Enero',
      'en': 'January',
    },
    'y7lzvkbd': {
      'es': 'Febrero',
      'en': 'February',
    },
    'bhwwo9qm': {
      'es': 'Marzo',
      'en': 'March',
    },
    '36mz2s2a': {
      'es': 'Abril',
      'en': 'April',
    },
    'pldk8zts': {
      'es': 'Mayo',
      'en': 'May',
    },
    '7kr3gf1a': {
      'es': 'Junio',
      'en': 'June',
    },
    'mknp53wc': {
      'es': 'Julio',
      'en': 'July',
    },
    '29ph77cc': {
      'es': 'Agosto',
      'en': 'August',
    },
    'sx49i8wr': {
      'es': 'Septiembre',
      'en': 'September',
    },
    'czfuiaao': {
      'es': 'Octubre',
      'en': 'October',
    },
    'zhxomapt': {
      'es': 'Noviembre',
      'en': 'November',
    },
    '2xchfv3m': {
      'es': 'Diciembre',
      'en': 'December',
    },
    '8tggvu98': {
      'es':
          '(Los horarios seleccionados se repetiran hasta el fin de la obra) (Los profesionales no trabajaran en ausencia del cliente)',
      'en': '(Professionals will not work in the absence of the client)',
    },
    'jnvhy02y': {
      'es': '\$ ',
      'en': '\$',
    },
    'h4s4qi5k': {
      'es': 'Termino y condiciones',
      'en': 'Terms and conditions',
    },
    'i417us0h': {
      'es': 'Rechazar presupuesto',
      'en': 'Reject budget',
    },
    'i1oj2yib': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // A5_Presupuesto
  {
    'kjrv1t8v': {
      'es': 'Cuentanos que necesitas',
      'en': 'Tell us what you need',
    },
    'y8183u7l': {
      'es': 'Tipo de servicio',
      'en': 'Type of service',
    },
    'bwkdcjpu': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'kr9fifa0': {
      'es': 'Albañileria',
      'en': 'Masonry',
    },
    'zx81zgdu': {
      'es': 'Plomeria',
      'en': 'Plumbing',
    },
    'hu3hupob': {
      'es': 'Gas',
      'en': 'Gas',
    },
    '8h9eppvl': {
      'es': 'Electricidad',
      'en': 'Electricity',
    },
    'i9eqvi5g': {
      'es': 'Jardineria',
      'en': 'Gardening',
    },
    'k296cuc8': {
      'es': 'Durlock',
      'en': 'Durlock',
    },
    'em1tdnu1': {
      'es': 'Techista',
      'en': 'Roofer',
    },
    'oi6vimdv': {
      'es': 'Pintura',
      'en': 'Paint',
    },
    '6nsdffm6': {
      'es': 'Instalacion de electrodomesticos',
      'en': 'Installation of household appliances',
    },
    '6an6wq8h': {
      'es': 'Calefaccion',
      'en': 'Heating',
    },
    'ngn0hv2l': {
      'es': 'Carpinteria',
      'en': 'Carpentry',
    },
    '53bchvxu': {
      'es': 'Otro',
      'en': 'Other',
    },
    'cax079yt': {
      'es': 'Cuentanos algun detalle',
      'en': 'Tell us some details',
    },
    'ty8pzsqc': {
      'es': 'Envianos fotos',
      'en': 'Send us photos',
    },
    '1srh01b5': {
      'es': 'Metodo de pago',
      'en': 'Payment method',
    },
    'c86im4s5': {
      'es': 'Direccion',
      'en': 'Address',
    },
    'wdcsyr9b': {
      'es': 'Hora',
      'en': 'Hour',
    },
    '2tj5lcq5': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'wikmozdq': {
      'es': '08',
      'en': '08',
    },
    'cd3xkrie': {
      'es': '09',
      'en': '09',
    },
    '4cnh9h0i': {
      'es': '10',
      'en': '10',
    },
    'gu3jnlg3': {
      'es': '11',
      'en': '11',
    },
    '0nu7m266': {
      'es': '12',
      'en': '12',
    },
    'johjship': {
      'es': '13',
      'en': '13',
    },
    '9fomzo1s': {
      'es': '14',
      'en': '14',
    },
    'gvw58pm4': {
      'es': '15',
      'en': '15',
    },
    'u3bbefjv': {
      'es': '16',
      'en': '16',
    },
    't1qbc20j': {
      'es': '17',
      'en': '17',
    },
    'x7h8aw3q': {
      'es': '18',
      'en': '18',
    },
    'nqz1gxda': {
      'es': '19',
      'en': '19',
    },
    '3lekwx6d': {
      'es': '20',
      'en': '20',
    },
    'ylqt8b2o': {
      'es': 'Dia',
      'en': 'Day',
    },
    '2wpgqp8i': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'zofqdxg7': {
      'es': '1',
      'en': '1',
    },
    'wnhsi4ty': {
      'es': '2',
      'en': '2',
    },
    '7fiseppa': {
      'es': '3',
      'en': '3',
    },
    '9nlmp2yl': {
      'es': '4',
      'en': '4',
    },
    'n3n3ncyu': {
      'es': '5',
      'en': '5',
    },
    'mvy8gmpn': {
      'es': '6',
      'en': '6',
    },
    'xwv80ljf': {
      'es': '7',
      'en': '7',
    },
    'irdxw8cg': {
      'es': '8',
      'en': '8',
    },
    'cp77fvez': {
      'es': '9',
      'en': '9',
    },
    'uhdk0wpy': {
      'es': '10',
      'en': '10',
    },
    'dudq0q6o': {
      'es': '11',
      'en': '11',
    },
    'emo10omq': {
      'es': '12',
      'en': '12',
    },
    'ls4vce40': {
      'es': '13',
      'en': '13',
    },
    'iiaw6f27': {
      'es': '14',
      'en': '14',
    },
    'c8dqz69x': {
      'es': '15',
      'en': '14',
    },
    'tu8zk52j': {
      'es': '16',
      'en': '',
    },
    'xs1cv2wi': {
      'es': '17',
      'en': '',
    },
    'xd24qts5': {
      'es': '18',
      'en': '',
    },
    '294xceew': {
      'es': '19',
      'en': '',
    },
    'l7qkm4lt': {
      'es': '20',
      'en': '',
    },
    'cwzgbsf4': {
      'es': '21',
      'en': '',
    },
    'qa57fc8b': {
      'es': '22',
      'en': '',
    },
    'jshyzm6y': {
      'es': '23',
      'en': '',
    },
    '1ladml43': {
      'es': '24',
      'en': '',
    },
    '4hu25pdc': {
      'es': '25',
      'en': '',
    },
    'q9nmpgld': {
      'es': '26',
      'en': '',
    },
    'bzn357hk': {
      'es': '27',
      'en': '',
    },
    'tzwanlsj': {
      'es': '28',
      'en': '',
    },
    'ucod5cxf': {
      'es': '29',
      'en': '',
    },
    'ayk16wts': {
      'es': '30',
      'en': '',
    },
    '0n6t5p2l': {
      'es': '31',
      'en': '',
    },
    '5fz1fvtb': {
      'es': 'Mes',
      'en': '',
    },
    'phot06v1': {
      'es': 'Search...',
      'en': '',
    },
    '1jft6x63': {
      'es': 'Enero',
      'en': '',
    },
    '6mekfoqr': {
      'es': 'Febrero',
      'en': '',
    },
    's4wajsca': {
      'es': 'Marzo',
      'en': '',
    },
    'jj10f0ve': {
      'es': 'Abril',
      'en': '',
    },
    'is5ck5y3': {
      'es': 'Mayo',
      'en': '',
    },
    '6n0fum48': {
      'es': 'Junio',
      'en': '',
    },
    '9x3tgtcr': {
      'es': 'Julio',
      'en': '',
    },
    'got9m7qf': {
      'es': 'Agosto',
      'en': '',
    },
    'te4uxvtn': {
      'es': 'Septiembre',
      'en': '',
    },
    'cxju1ere': {
      'es': 'Octubre',
      'en': '',
    },
    's6g32obx': {
      'es': 'Noviembre',
      'en': '',
    },
    'r9vija7b': {
      'es': 'Diciembre',
      'en': '',
    },
    'wwrbote3': {
      'es': 'Termino y condiciones',
      'en': '',
    },
    '3wtzgjwj': {
      'es': 'Total',
      'en': '',
    },
    'iy8yjyaj': {
      'es': '\$ ',
      'en': '',
    },
    '1j0h80j2': {
      'es': '8.000',
      'en': '',
    },
    'zianva9b': {
      'es': 'Pedir presupuesto',
      'en': '',
    },
    'jyjwd7wa': {
      'es': 'Presupuesto',
      'en': '',
    },
    '4c4j2qiq': {
      'es': 'Home',
      'en': '',
    },
  },
  // A7-2_DIreccion
  {
    'nteubdc4': {
      'es': 'Elige tu direccion',
      'en': '',
    },
    '4mrn5ye1': {
      'es': 'Indicanos  donde se realizaran los servicos.',
      'en': '',
    },
    '64gu15d4': {
      'es': 'Direccion',
      'en': '',
    },
    'wi0sirhi': {
      'es': 'Elige tu locacion',
      'en': '',
    },
    'm0kj5qkj': {
      'es': 'Select...',
      'en': '',
    },
    '1jxd1fz5': {
      'es': 'Search...',
      'en': '',
    },
    '5xg47qze': {
      'es': 'Bahia Blanca',
      'en': '',
    },
    '04p1rafk': {
      'es': 'Buenos Aires, Arg.',
      'en': '',
    },
    'j66jqcah': {
      'es': 'Metodo de pago',
      'en': '',
    },
    '13ahy3hd': {
      'es': 'Tarjeta',
      'en': '',
    },
    '30qmpqtl': {
      'es': 'Confirm',
      'en': '',
    },
    'kzhot6se': {
      'es': 'Direccion',
      'en': '',
    },
    'uta3xo88': {
      'es': 'Home',
      'en': '',
    },
  },
  // A7-1_AnadirNuevaTarjeta
  {
    '8tqeg719': {
      'es': 'Numero de tarjeta',
      'en': '',
    },
    'whwwsqyj': {
      'es': 'Ingresa el numero de tarjeta',
      'en': '',
    },
    'e1jkqztn': {
      'es': 'Nombre del propietario',
      'en': '',
    },
    'qmfbitqj': {
      'es': 'Ingresa nombre del dueño',
      'en': '',
    },
    'z7a2vdhr': {
      'es': 'Expiracion',
      'en': '',
    },
    'itfkuv3g': {
      'es': 'MM/AA',
      'en': '',
    },
    '70eg1hir': {
      'es': 'Codigo de seguridad',
      'en': '',
    },
    '8bvf8fns': {
      'es': 'CCV',
      'en': '',
    },
    'v3wjfpim': {
      'es': 'Añadir tarjeta',
      'en': '',
    },
    'p5ce6966': {
      'es': 'Añadir nueva tarjeta',
      'en': '',
    },
    '2nfguei3': {
      'es': 'Home',
      'en': '',
    },
  },
  // A13_Notificaciones
  {
    'tjgfm1sl': {
      'es': 'El estado de tu servicio a cambiado a:\n',
      'en': '',
    },
    'furw9mdf': {
      'es': '\n',
      'en': '',
    },
    't7fcxx4r': {
      'es': 'Notification',
      'en': '',
    },
    'd8mrw4v1': {
      'es': 'Page Title',
      'en': '',
    },
    'p9pn3mm5': {
      'es': 'Favorite',
      'en': '',
    },
  },
  // A14_Configuracion
  {
    'k9p4o7mq': {
      'es': 'General',
      'en': '',
    },
    'huf27lxh': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'ds506agm': {
      'es': 'Cambiar Contraseña',
      'en': '',
    },
    '9b6hsp48': {
      'es': 'Notificaciones',
      'en': '',
    },
    '3vea7j2p': {
      'es': 'Lenguage',
      'en': '',
    },
    'cow5ksut': {
      'es': 'Preferencias',
      'en': '',
    },
    'ivdshgsr': {
      'es': 'Politicas y legales',
      'en': '',
    },
    '33gpjjpl': {
      'es': 'Ayuda y soporte',
      'en': '',
    },
    '4k922abp': {
      'es': 'Cerrar sesion',
      'en': '',
    },
    '420s0aeh': {
      'es': 'Configuracion',
      'en': '',
    },
    '6vzdg0s2': {
      'es': 'Page Title',
      'en': '',
    },
    'tpcxi4d9': {
      'es': 'Setting',
      'en': '',
    },
  },
  // A10_Perfil
  {
    'cxalippm': {
      'es': 'Subir foto',
      'en': '',
    },
    '36zgxj4d': {
      'es': 'Nombre de Usuario',
      'en': '',
    },
    'y62t4x4v': {
      'es': 'Email ',
      'en': '',
    },
    'qoq8rd90': {
      'es': 'Ingresa tu email',
      'en': '',
    },
    '01ozpobl': {
      'es': 'Numero',
      'en': '',
    },
    'vkl296xa': {
      'es': 'Ingresa tu numero',
      'en': '',
    },
    'wkda9hoi': {
      'es': 'Lenguage',
      'en': '',
    },
    'hjbhu5ul': {
      'es': 'Select...',
      'en': '',
    },
    'o2bvmifm': {
      'es': 'Search...',
      'en': '',
    },
    'anrtz67s': {
      'es': 'Español',
      'en': '',
    },
    '8hyej63i': {
      'es': 'Ingles',
      'en': '',
    },
    'vrtr6uvq': {
      'es': 'Guardar Cambios',
      'en': '',
    },
    'wcxm2ijd': {
      'es': 'Perfil',
      'en': '',
    },
    'ubo5xh9z': {
      'es': 'Home',
      'en': '',
    },
  },
  // A7-3_CambiarContrasena
  {
    'm44q6y3o': {
      'es': 'Nueva contraseña',
      'en': '',
    },
    'ytk5ba6l': {
      'es': 'Ingresa la nueva contraseña',
      'en': '',
    },
    '8dzaf869': {
      'es': 'Confirmar contraseña',
      'en': '',
    },
    '8q91wovk': {
      'es': 'Confirma tu nueva contraseña',
      'en': '',
    },
    'hi2yymxk': {
      'es': 'Cambiar ahora',
      'en': '',
    },
    '8p3f17dj': {
      'es': 'Cambia de contraseña',
      'en': '',
    },
    '92rkz0wl': {
      'es': 'Home',
      'en': '',
    },
  },
  // A11_Legal
  {
    'icfwkxvp': {
      'es': 'Terms',
      'en': '',
    },
    'd216tz8f': {
      'es':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'en': '',
    },
    'mf4seg4j': {
      'es': 'Changes to the Service and/or Terms:',
      'en': '',
    },
    '4aolvysc': {
      'es':
          'This application is provided to you \"as is,\" and we make no express or implied warranties whatsoever with respect to its functionality, operability, or use, including, without limitation.\n\nAny implied warranties of merchantability, fitness for a particular purpose, or infringement. We expressly disclaim any liability whatsoever for any direct, indirect, consequential, incidental or special damages, including, without limitation, lost revenues, lost profits, losses resulting from business interruption or loss of \n\ndata, regardless of the form of action or legal theory under which the liability may be asserted, even if advised of the possibility or likelihood of such damages.\n\n\nBy using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'en': '',
    },
    'x014ew2n': {
      'es': 'Terms',
      'en': '',
    },
    'o3qpa1ln': {
      'es':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'en': '',
    },
    'xf9gx60w': {
      'es': 'Legales y politicas',
      'en': '',
    },
    '8uluwyex': {
      'es': 'Home',
      'en': '',
    },
  },
  // A3-5_IniciaSecion
  {
    'e4c8i3pf': {
      'es': 'Inicia Sesion',
      'en': '',
    },
    '74p44w5i': {
      'es': 'Email ',
      'en': '',
    },
    '7rgi1iyk': {
      'es': 'Ingresa tu mail ',
      'en': '',
    },
    'w1gnyyh4': {
      'es': 'Contraseña',
      'en': '',
    },
    'lyokujbo': {
      'es': 'Crea tu contraseña',
      'en': '',
    },
    '0hkipl9g': {
      'es': 'Iniciar Sesion',
      'en': '',
    },
    'rpst2l9w': {
      'es': 'O usa otro metodo',
      'en': '',
    },
    'ct70t0uz': {
      'es': 'LogIn with Google',
      'en': '',
    },
    'hurtyim4': {
      'es': 'No tengo una cuenta',
      'en': '',
    },
    'w612ivpc': {
      'es': 'Crear un cuenta',
      'en': '',
    },
    '4wl73ul1': {
      'es': 'Olvide mi contraseña',
      'en': '',
    },
    'qfnkbbdr': {
      'es': 'Recuperar contraseña',
      'en': '',
    },
    'tn3p8vdi': {
      'es': 'Home',
      'en': '',
    },
  },
  // B1_Postulate
  {
    '2brzopnx': {
      'es': 'Crea una Solicitud',
      'en': '',
    },
    'c0u5j1ve': {
      'es': 'Nombre de Usuario',
      'en': '',
    },
    'yx4mgpv9': {
      'es': 'Crea tu nombre de usuario',
      'en': '',
    },
    'l1880jpn': {
      'es': 'Email ',
      'en': '',
    },
    'enfjgmoh': {
      'es': 'Ingressa tu mail o numero',
      'en': '',
    },
    'pyegcrt3': {
      'es': 'Numero de telefono',
      'en': '',
    },
    '4q8ypy5d': {
      'es': 'Ingressa tu mail o numero',
      'en': '',
    },
    'v96qth74': {
      'es': 'Contraseña',
      'en': '',
    },
    'p2hdmyos': {
      'es': 'Crea tu contraseña',
      'en': '',
    },
    'lwlxhrwx': {
      'es': 'Tipo de servicio',
      'en': '',
    },
    'lppkna54': {
      'es': 'Search...',
      'en': '',
    },
    'tdz8ygou': {
      'es': 'Albañileria',
      'en': '',
    },
    'rs8zc8h9': {
      'es': 'Plomeria',
      'en': '',
    },
    'cogip2pt': {
      'es': 'Gas',
      'en': '',
    },
    '2o89wntf': {
      'es': 'Electricidad',
      'en': '',
    },
    'cfnkf041': {
      'es': 'Jardineria',
      'en': '',
    },
    'oyqqvuud': {
      'es': 'Durlock',
      'en': '',
    },
    'oxn09x6n': {
      'es': 'Techista',
      'en': '',
    },
    'e1nowig9': {
      'es': 'Pintura',
      'en': '',
    },
    'q3zrcmts': {
      'es': 'Instalacion de electrodomesticos',
      'en': '',
    },
    'jaqca4zx': {
      'es': 'Calefaccion',
      'en': '',
    },
    'ag69qlnv': {
      'es': 'Carpinteria',
      'en': '',
    },
    '5fm9yhc2': {
      'es': 'Otro',
      'en': '',
    },
    'ziog83so': {
      'es': 'CV',
      'en': '',
    },
    'x6g6t3lg': {
      'es': 'Subir el archivo',
      'en': '',
    },
    'lgppvz1h': {
      'es': 'Postulate',
      'en': '',
    },
    'n12pgbo3': {
      'es': 'Home',
      'en': '',
    },
  },
  // B2_InicioFreelancer
  {
    'h5h92pcn': {
      'es': '3',
      'en': '',
    },
    '3canfc58': {
      'es': 'Que servicios necesita',
      'en': '',
    },
    'qzilde5c': {
      'es': 'Bahía Blanca',
      'en': '',
    },
    '5s3kp7pc': {
      'es': 'Atiende servicios',
      'en': '',
    },
    'dufbboxj': {
      'es': '',
      'en': '',
    },
    'exhglng1': {
      'es': 'Inicio',
      'en': '',
    },
  },
  // B3_MisServicios
  {
    'jv8ev4xu': {
      'es': 'Detalles',
      'en': '',
    },
    'j54ja7ex': {
      'es': 'Seguimiento',
      'en': '',
    },
    'vnashk8d': {
      'es': 'Mis Servicios',
      'en': '',
    },
    '8mtirykj': {
      'es': 'Mis Servicios',
      'en': '',
    },
  },
  // B4_Solicitudes
  {
    'u0s747cd': {
      'es': '(Solo puedes aceptar un servicio a la vez)',
      'en': '',
    },
    'xjxkxfpd': {
      'es': 'Aceptar',
      'en': '',
    },
    'cooqf61u': {
      'es': 'Solicitudes',
      'en': '',
    },
    'xidgntc8': {
      'es': 'Home',
      'en': '',
    },
  },
  // C1_InicioTasador
  {
    'bb2vejaa': {
      'es': '3',
      'en': '',
    },
    'vsf9gikb': {
      'es': 'Que servicios necesita',
      'en': '',
    },
    'gm0fr9dl': {
      'es': 'Bahía Blanca',
      'en': '',
    },
    'rr0bodch': {
      'es': 'Presupuesta',
      'en': '',
    },
    'vdswqs6f': {
      'es': '',
      'en': '',
    },
    '2xmf2jh4': {
      'es': 'Inicio',
      'en': '',
    },
  },
  // C2_MisPresupuestos
  {
    '4w5b75ok': {
      'es': 'Presupuestar',
      'en': '',
    },
    '5a6c0u7j': {
      'es': 'Mis Presupuestos',
      'en': '',
    },
    'gekkp3yg': {
      'es': 'Mis Servicios',
      'en': '',
    },
  },
  // C3_Presupuestar
  {
    'w7q7c4oj': {
      'es': 'Order ID:',
      'en': '',
    },
    'kl3va22b': {
      'es': '...',
      'en': '',
    },
    '7xyt5kdg': {
      'es': 'Crear presupuesto',
      'en': '',
    },
    'zln1jd74': {
      'es': 'Tipo de servicio',
      'en': '',
    },
    'tt1rqe6t': {
      'es': 'Search...',
      'en': '',
    },
    'denqc4rt': {
      'es': 'ALBAÑIL',
      'en': '',
    },
    '5kfhuv1p': {
      'es': 'PLOMERO',
      'en': '',
    },
    'i2n1k14h': {
      'es': 'GASISTA',
      'en': '',
    },
    '96g7gmhf': {
      'es': 'ELECTRICISTA',
      'en': '',
    },
    '37888lga': {
      'es': 'JARDINERIA Y PAISAJISMO',
      'en': '',
    },
    '1vaozed6': {
      'es': 'TECHISTA',
      'en': '',
    },
    '73kygx4v': {
      'es': 'PINTOR',
      'en': '',
    },
    '3zd3r9d6': {
      'es': 'TECNICO DE AIRE',
      'en': '',
    },
    'h2uass2z': {
      'es': 'CARPINTERO',
      'en': '',
    },
    'b1mwkwf4': {
      'es': 'CONSTRUCCIÓN Y ARQUITECTURA',
      'en': '',
    },
    'zzgh2emu': {
      'es': 'DECORACION',
      'en': '',
    },
    '8wtuo5st': {
      'es': 'TECNICO EN ELECTRODOMESTICOS',
      'en': '',
    },
    '31pa3t6w': {
      'es': 'PEQUEÑOS ARREGLOS',
      'en': '',
    },
    'soer03gv': {
      'es': 'Tipo de trabajo',
      'en': '',
    },
    'lekdsgsc': {
      'es': 'Search...',
      'en': '',
    },
    'us4ekebk': {
      'es': 'Option 1',
      'en': '',
    },
    'm6oklih7': {
      'es': 'Cantidad',
      'en': '',
    },
    'q523hh0x': {
      'es': 'Tipo de servicio',
      'en': '',
    },
    'tgrv6o11': {
      'es': 'Search...',
      'en': '',
    },
    'ed69wt0j': {
      'es': 'ALBAÑIL',
      'en': '',
    },
    'ahznnvyk': {
      'es': 'PLOMERO',
      'en': '',
    },
    'nx6s8nhg': {
      'es': 'GASISTA',
      'en': '',
    },
    'ghcoksyo': {
      'es': 'ELECTRICISTA',
      'en': '',
    },
    '39tnu965': {
      'es': 'JARDINERIA Y PAISAJISMO',
      'en': '',
    },
    'z4hqxtt9': {
      'es': 'TECHISTA',
      'en': '',
    },
    '2kez0g4w': {
      'es': 'PINTOR',
      'en': '',
    },
    'uk537d60': {
      'es': 'TECNICO DE AIRE',
      'en': '',
    },
    'zu928wnh': {
      'es': 'CARPINTERO',
      'en': '',
    },
    'ro9ecnp0': {
      'es': 'CONSTRUCCIÓN Y ARQUITECTURA',
      'en': '',
    },
    'eo55fku2': {
      'es': 'DECORACION',
      'en': '',
    },
    'dtmhss7g': {
      'es': 'TECNICO EN ELECTRODOMESTICOS',
      'en': '',
    },
    'z28g2k8p': {
      'es': 'PEQUEÑOS ARREGLOS',
      'en': '',
    },
    'oojo6xe9': {
      'es': 'Tipo de trabajo',
      'en': '',
    },
    '7pt7lwud': {
      'es': 'Search...',
      'en': '',
    },
    '1uska6qb': {
      'es': 'Option 1',
      'en': '',
    },
    'v1oi3bck': {
      'es': 'Cantidad',
      'en': '',
    },
    '69lneqq5': {
      'es': 'Tipo de servicio',
      'en': '',
    },
    'zlvugs6h': {
      'es': 'Search...',
      'en': '',
    },
    'pq1j4fbj': {
      'es': 'ALBAÑIL',
      'en': '',
    },
    'qi1s86ei': {
      'es': 'PLOMERO',
      'en': '',
    },
    'jl8ge6m2': {
      'es': 'GASISTA',
      'en': '',
    },
    'mdj20woy': {
      'es': 'ELECTRICISTA',
      'en': '',
    },
    'syo37u09': {
      'es': 'JARDINERIA Y PAISAJISMO',
      'en': '',
    },
    'msnb5dyw': {
      'es': 'TECHISTA',
      'en': '',
    },
    'tviyrifn': {
      'es': 'PINTOR',
      'en': '',
    },
    '72qjq3k1': {
      'es': 'TECNICO DE AIRE',
      'en': '',
    },
    'hl4adnwy': {
      'es': 'CARPINTERO',
      'en': '',
    },
    'r05qfb02': {
      'es': 'CONSTRUCCIÓN Y ARQUITECTURA',
      'en': '',
    },
    'm631k11b': {
      'es': 'DECORACION',
      'en': '',
    },
    'adrv46se': {
      'es': 'TECNICO EN ELECTRODOMESTICOS',
      'en': '',
    },
    'arsqcc7k': {
      'es': 'PEQUEÑOS ARREGLOS',
      'en': '',
    },
    '3kjzmenn': {
      'es': 'Tipo de trabajo',
      'en': '',
    },
    'q3mkzq36': {
      'es': 'Search...',
      'en': '',
    },
    'v2oo8ook': {
      'es': 'Option 1',
      'en': '',
    },
    'ti1llvgv': {
      'es': 'Cantidad',
      'en': '',
    },
    'b4vtax66': {
      'es': 'Tipo de servicio',
      'en': '',
    },
    '67a765eb': {
      'es': 'Search...',
      'en': '',
    },
    'shl3qxcj': {
      'es': 'ALBAÑIL',
      'en': '',
    },
    '2axyns9f': {
      'es': 'PLOMERO',
      'en': '',
    },
    'yp2czqfv': {
      'es': 'GASISTA',
      'en': '',
    },
    '91zl4oyi': {
      'es': 'ELECTRICISTA',
      'en': '',
    },
    'tlby4gbk': {
      'es': 'JARDINERIA Y PAISAJISMO',
      'en': '',
    },
    'fmkgnjj5': {
      'es': 'TECHISTA',
      'en': '',
    },
    'cveycjxl': {
      'es': 'PINTOR',
      'en': '',
    },
    'qt64sygh': {
      'es': 'TECNICO DE AIRE',
      'en': '',
    },
    'vzo4wdkg': {
      'es': 'CARPINTERO',
      'en': '',
    },
    'suj9szaw': {
      'es': 'CONSTRUCCIÓN Y ARQUITECTURA',
      'en': '',
    },
    '9fimkn8k': {
      'es': 'DECORACION',
      'en': '',
    },
    'y1xh7j48': {
      'es': 'TECNICO EN ELECTRODOMESTICOS',
      'en': '',
    },
    'bnym9up7': {
      'es': 'PEQUEÑOS ARREGLOS',
      'en': '',
    },
    '0d5u5dbl': {
      'es': 'Tipo de trabajo',
      'en': '',
    },
    'luw0glah': {
      'es': 'Search...',
      'en': '',
    },
    '3e0crznw': {
      'es': 'Option 1',
      'en': '',
    },
    '7subss4d': {
      'es': 'Cantidad',
      'en': '',
    },
    'xg3ulymt': {
      'es': 'Cantidad de horas',
      'en': '',
    },
    'yimjq5k7': {
      'es': 'Materiales',
      'en': '',
    },
    'whp7696j': {
      'es': 'Describe el servicio/s que necesitan',
      'en': '',
    },
    '0y2o0kjd': {
      'es': 'Presupuesto',
      'en': '',
    },
    'unlbprpm': {
      'es': 'Home',
      'en': '',
    },
  },
  // B6_DetallesdelServicio
  {
    'zs848goe': {
      'es': 'Detalles',
      'en': '',
    },
    'yow99cjw': {
      'es': 'Open Location',
      'en': '',
    },
    '8u9pxxc8': {
      'es': '\$ ',
      'en': '',
    },
    'r9y47cfc': {
      'es': 'Home',
      'en': '',
    },
  },
  // B7_NotificacionesF
  {
    'ucfv11xv': {
      'es': '',
      'en': '',
    },
    'mcphj8gr': {
      'es': 'Notification',
      'en': '',
    },
    '0muer6zr': {
      'es': 'Favorite',
      'en': '',
    },
  },
  // C4_NotificacionesT
  {
    'dlrfg1fk': {
      'es': 'Se solicito un nuevo presupuesto!\n',
      'en': '',
    },
    '9o7fx0on': {
      'es': 'Notification',
      'en': '',
    },
    'btbycrle': {
      'es': 'Page Title',
      'en': '',
    },
    'uv6ck2xu': {
      'es': 'Favorite',
      'en': '',
    },
  },
  // B8_LegalF
  {
    '7ybb8mmp': {
      'es': 'Terms',
      'en': '',
    },
    'cuvuscxf': {
      'es':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'en': '',
    },
    'x53chauj': {
      'es': 'Changes to the Service and/or Terms:',
      'en': '',
    },
    'hwsc74zd': {
      'es':
          'This application is provided to you \"as is,\" and we make no express or implied warranties whatsoever with respect to its functionality, operability, or use, including, without limitation.\n\nAny implied warranties of merchantability, fitness for a particular purpose, or infringement. We expressly disclaim any liability whatsoever for any direct, indirect, consequential, incidental or special damages, including, without limitation, lost revenues, lost profits, losses resulting from business interruption or loss of \n\ndata, regardless of the form of action or legal theory under which the liability may be asserted, even if advised of the possibility or likelihood of such damages.\n\n\nBy using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'en': '',
    },
    '07ruin5g': {
      'es': 'Terms',
      'en': '',
    },
    'm1ttej8b': {
      'es':
          'By using this application, you agree to comply with and be bound by the following terms and conditions. Please review them carefully. If you do not agree to these terms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.\n\nTerms, you should not use this application. The term \"us\" or \"we\" refers to [Your Company Name], the owner of this application. The term \"you\" refers to the user or viewer of our application.',
      'en': '',
    },
    '0dentyp7': {
      'es': 'Legales y Politicas',
      'en': '',
    },
    'pxfxao3k': {
      'es': 'Home',
      'en': '',
    },
  },
  // A9-4_Reportar
  {
    'o906gjhk': {
      'es': 'Email:',
      'en': '',
    },
    '40xrwgc4': {
      'es': '...',
      'en': '',
    },
    'f33jv25e': {
      'es': 'Reportar',
      'en': '',
    },
    'hfo4dxyu': {
      'es': 'Reporte el problema',
      'en': '',
    },
    'z7gp78wo': {
      'es': 'Que tipo de problema es',
      'en': '',
    },
    'rblei3rs': {
      'es': 'Search...',
      'en': '',
    },
    'yk49bdre': {
      'es': 'El trabajo esta mal hecho/no terminado',
      'en': '',
    },
    'fvlf4vu2': {
      'es': 'La conducta del trabajador',
      'en': '',
    },
    'vp0vk75w': {
      'es': 'Otro',
      'en': '',
    },
    'av9g4sty': {
      'es':
          'Okey, enviaremos un supervisor para que lo revise y se asegure de que el profesional lo termine adecuadamente.',
      'en': '',
    },
    'q87fhqwk': {
      'es': 'Hora',
      'en': '',
    },
    'adqj26h8': {
      'es': 'Search...',
      'en': '',
    },
    'ymuvi0pl': {
      'es': '08',
      'en': '',
    },
    'imp0fy9u': {
      'es': '09',
      'en': '',
    },
    'b7vb74u8': {
      'es': '10',
      'en': '',
    },
    'u0gm5ij0': {
      'es': '11',
      'en': '',
    },
    'mzv958wl': {
      'es': '12',
      'en': '',
    },
    '858ohaqx': {
      'es': '13',
      'en': '',
    },
    'zo5l3umi': {
      'es': '14',
      'en': '',
    },
    'pyx1jjtz': {
      'es': '15',
      'en': '',
    },
    'u735n4yc': {
      'es': '16',
      'en': '',
    },
    'xnme86n4': {
      'es': '17',
      'en': '',
    },
    'wtipjthj': {
      'es': '18',
      'en': '',
    },
    '0cqwp60w': {
      'es': '19',
      'en': '',
    },
    'ldbqm6ri': {
      'es': '20',
      'en': '',
    },
    '7hbmwn9k': {
      'es': 'Dia',
      'en': '',
    },
    'dv6gvu0k': {
      'es': 'Search...',
      'en': '',
    },
    'k5ns8erx': {
      'es': '1',
      'en': '',
    },
    '8jirpo94': {
      'es': '2',
      'en': '',
    },
    'pzw0xc3t': {
      'es': '3',
      'en': '',
    },
    't9ww4pcx': {
      'es': '4',
      'en': '',
    },
    'c0aas2do': {
      'es': '5',
      'en': '',
    },
    'vnvu1em8': {
      'es': '6',
      'en': '',
    },
    '9h4p3vex': {
      'es': '7',
      'en': '',
    },
    '0rin2blu': {
      'es': '8',
      'en': '',
    },
    'dn9rte02': {
      'es': '9',
      'en': '',
    },
    'c68l22zk': {
      'es': '10',
      'en': '',
    },
    'aq105h3u': {
      'es': '11',
      'en': '',
    },
    'mfdoqrwn': {
      'es': '12',
      'en': '',
    },
    'djed2d8d': {
      'es': '13',
      'en': '',
    },
    's60vnbdg': {
      'es': '14',
      'en': '',
    },
    'qeivl7l6': {
      'es': '15',
      'en': '',
    },
    '4jcd1i1l': {
      'es': '16',
      'en': '',
    },
    'htjq8qw3': {
      'es': '17',
      'en': '',
    },
    'm8jrn23g': {
      'es': '18',
      'en': '',
    },
    'u91vmdf9': {
      'es': '19',
      'en': '',
    },
    'oq8fvxza': {
      'es': '20',
      'en': '',
    },
    '5w2e5jd1': {
      'es': '21',
      'en': '',
    },
    'byv38v6k': {
      'es': '22',
      'en': '',
    },
    'b5hdmb4s': {
      'es': '23',
      'en': '',
    },
    '5r1d8z0i': {
      'es': '24',
      'en': '',
    },
    'jexkliv3': {
      'es': '25',
      'en': '',
    },
    'sghs0nj7': {
      'es': '26',
      'en': '',
    },
    'jwoolcik': {
      'es': '27',
      'en': '',
    },
    '00aqgqfo': {
      'es': '28',
      'en': '',
    },
    'e5houzr5': {
      'es': '29',
      'en': '',
    },
    'h92mrkaf': {
      'es': '30',
      'en': '',
    },
    'qfu9eg3m': {
      'es': '31',
      'en': '',
    },
    'btqilkp1': {
      'es': 'Mes',
      'en': '',
    },
    '91sdb138': {
      'es': 'Search...',
      'en': '',
    },
    'z2040izi': {
      'es': 'Enero',
      'en': '',
    },
    'ru9lkpel': {
      'es': 'Febrero',
      'en': '',
    },
    'jozmep1b': {
      'es': 'Marzo',
      'en': '',
    },
    'zjnzjzgp': {
      'es': 'Abril',
      'en': '',
    },
    'hlwg4qdz': {
      'es': 'Mayo',
      'en': '',
    },
    'eutp4m1l': {
      'es': 'Junio',
      'en': '',
    },
    'mw7frxzs': {
      'es': 'Julio',
      'en': '',
    },
    's87xyian': {
      'es': 'Agosto',
      'en': '',
    },
    'chndphj0': {
      'es': 'Septiembre',
      'en': '',
    },
    'w9qlcg6t': {
      'es': 'Octubre',
      'en': '',
    },
    'q9lj1p1y': {
      'es': 'Noviembre',
      'en': '',
    },
    'o8lczoni': {
      'es': 'Diciembre',
      'en': '',
    },
    'bb8qfdp0': {
      'es': 'Describe el problema...',
      'en': '',
    },
    'me7a27v3': {
      'es': 'Presupuesto',
      'en': '',
    },
    '0s5ux49t': {
      'es': 'Home',
      'en': '',
    },
  },
  // C5_ConfiguracionT
  {
    'zy5hazvs': {
      'es': 'General',
      'en': '',
    },
    'o0pv6iwd': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'ge2yw7w9': {
      'es': 'Cambiar Contraseña',
      'en': '',
    },
    '2tucdtli': {
      'es': 'Notificaciones',
      'en': '',
    },
    '7xhgnut9': {
      'es': 'Lenguage',
      'en': '',
    },
    '07p0quvc': {
      'es': 'Preferencias',
      'en': '',
    },
    'teqfxt5n': {
      'es': 'Politicas y legales',
      'en': '',
    },
    '8thsba7u': {
      'es': 'Ayuda y soporte',
      'en': '',
    },
    'bsscyzsc': {
      'es': 'Cerrar sesion',
      'en': '',
    },
    '0wail4q7': {
      'es': 'Configuracion',
      'en': '',
    },
    't4dcg77h': {
      'es': 'Setting',
      'en': '',
    },
  },
  // B9_ConfiguracionF
  {
    'pc8r3p6g': {
      'es': 'General',
      'en': '',
    },
    'hjrvpgof': {
      'es': 'Editar Perfil',
      'en': '',
    },
    'noxpuqq4': {
      'es': 'Cambiar Contraseña',
      'en': '',
    },
    'uvgispcd': {
      'es': 'Notificaciones',
      'en': '',
    },
    'sr6kcghu': {
      'es': 'Lenguage',
      'en': '',
    },
    '1dmpzheg': {
      'es': 'Preferencias',
      'en': '',
    },
    'sqxv8f6x': {
      'es': 'Politicas y legales',
      'en': '',
    },
    '0teclkw0': {
      'es': 'Ayuda y soporte',
      'en': '',
    },
    'stu65vyz': {
      'es': 'Cerrar sesion',
      'en': '',
    },
    'v86rtjvr': {
      'es': 'Configuracion',
      'en': '',
    },
    'use6nxwb': {
      'es': 'Setting',
      'en': '',
    },
  },
  // C6_PerfilT
  {
    '2zcqbfp0': {
      'es': 'Subir foto',
      'en': '',
    },
    '81z0nb9j': {
      'es': 'Nombre de Usuario',
      'en': '',
    },
    'dvzug068': {
      'es': 'Email ',
      'en': '',
    },
    '1kg4s646': {
      'es': 'Ingresa tu email',
      'en': '',
    },
    'l5vtn7ph': {
      'es': 'Numero',
      'en': '',
    },
    'om2najeg': {
      'es': 'Ingresa tu numero',
      'en': '',
    },
    's17bfdky': {
      'es': 'Lenguage',
      'en': '',
    },
    'ihgf48w3': {
      'es': 'Select...',
      'en': '',
    },
    'kem34t6a': {
      'es': 'Search...',
      'en': '',
    },
    '749v4z0l': {
      'es': 'Español',
      'en': '',
    },
    'uurvut66': {
      'es': 'Ingles',
      'en': '',
    },
    'w4r6v05j': {
      'es': 'Guardar Cambios',
      'en': '',
    },
    't5wcr9kn': {
      'es': 'Perfil',
      'en': '',
    },
    'mede365e': {
      'es': 'Home',
      'en': '',
    },
  },
  // B10_PerfilF
  {
    'q1rtkgex': {
      'es': 'Subir foto',
      'en': '',
    },
    'wdl1ex7b': {
      'es': 'Nombre de Usuario',
      'en': '',
    },
    'h1y3v1iz': {
      'es': 'Email ',
      'en': '',
    },
    '3oy33gg5': {
      'es': 'Ingresa tu email',
      'en': '',
    },
    'pt2lzpre': {
      'es': 'Numero',
      'en': '',
    },
    '3eiztba7': {
      'es': 'Ingresa tu numero',
      'en': '',
    },
    'zpkvlzaq': {
      'es': 'Lenguage',
      'en': '',
    },
    '4gcc9ux9': {
      'es': 'Select...',
      'en': '',
    },
    'wgb7e02g': {
      'es': 'Search...',
      'en': '',
    },
    '4a8oh8sr': {
      'es': 'Español',
      'en': '',
    },
    'oqqlo1l2': {
      'es': 'Ingles',
      'en': '',
    },
    'x8f4lolp': {
      'es': 'Guardar Cambios',
      'en': '',
    },
    'a2a0opr7': {
      'es': 'Perfil',
      'en': '',
    },
    'appfrf6b': {
      'es': 'Home',
      'en': '',
    },
  },
  // B11_CambiarContrasenaF
  {
    'i1g8ccb3': {
      'es': 'Nueva contraseña',
      'en': '',
    },
    'y6438qu8': {
      'es': 'Ingresa la nueva contraseña',
      'en': '',
    },
    'jv4rzlyt': {
      'es': 'Confirmar contraseña',
      'en': '',
    },
    'u5t850f8': {
      'es': 'Confirma tu nueva contraseña',
      'en': '',
    },
    'xohghu7t': {
      'es': 'Cambiar ahora',
      'en': '',
    },
    'rg7209jg': {
      'es': 'Cambia de contraseña',
      'en': '',
    },
    '89eq83fe': {
      'es': 'Home',
      'en': '',
    },
  },
  // C7_CambiarContrasenaT
  {
    '6wjeitbh': {
      'es': 'Nueva contraseña',
      'en': '',
    },
    '8s3nswdg': {
      'es': 'Ingresa la nueva contraseña',
      'en': '',
    },
    's9q0jk6u': {
      'es': 'Confirmar contraseña',
      'en': '',
    },
    'waf2ejts': {
      'es': 'Confirma tu nueva contraseña',
      'en': '',
    },
    '7anp7qw3': {
      'es': 'Cambiar ahora',
      'en': '',
    },
    'fgfy0zkh': {
      'es': 'Cambia de contraseña',
      'en': '',
    },
    'rg31aicz': {
      'es': 'Home',
      'en': '',
    },
  },
  // C8_ReportarT
  {
    'hog21ceq': {
      'es': 'Presupuesto',
      'en': '',
    },
    '3eedp345': {
      'es': 'Email:',
      'en': '',
    },
    'o0rzd3ez': {
      'es': '...',
      'en': '',
    },
    'd8zmr84l': {
      'es': 'Reportar',
      'en': '',
    },
    'zaeoe30v': {
      'es': 'Reporte el problema',
      'en': '',
    },
    'kv0qdn83': {
      'es': 'Que tipo de problema es',
      'en': '',
    },
    'kq3ppasr': {
      'es': 'Search...',
      'en': '',
    },
    'ay4i6ttf': {
      'es': 'El trabajo esta mal hecho/no terminado',
      'en': '',
    },
    'jvtovk16': {
      'es': 'La conducta del trabajador',
      'en': '',
    },
    'c41lle2b': {
      'es': 'Otro',
      'en': '',
    },
    '8igflwg6': {
      'es': 'Order-Id',
      'en': '',
    },
    'xngexjns': {
      'es': 'Describelo',
      'en': '',
    },
    '1yzrddkw': {
      'es': 'Dia de inicio:',
      'en': '',
    },
    'cz8qb5gv': {
      'es': 'Hora',
      'en': '',
    },
    'w5j3hw50': {
      'es': 'Search...',
      'en': '',
    },
    'hfcw1p16': {
      'es': '08',
      'en': '',
    },
    '0rimd3ih': {
      'es': '09',
      'en': '',
    },
    'n54kgbxo': {
      'es': '10',
      'en': '',
    },
    'zbzuq84u': {
      'es': '11',
      'en': '',
    },
    'uzl8xiai': {
      'es': '12',
      'en': '',
    },
    'kwti7bdx': {
      'es': '13',
      'en': '',
    },
    'zm42yl4b': {
      'es': '14',
      'en': '',
    },
    'rwqswx87': {
      'es': '15',
      'en': '',
    },
    'xlqmjmgh': {
      'es': '16',
      'en': '',
    },
    '1bdmx8qp': {
      'es': '17',
      'en': '',
    },
    '4ilv5eww': {
      'es': '18',
      'en': '',
    },
    '9itdzvg0': {
      'es': '19',
      'en': '',
    },
    '81zmezf2': {
      'es': '20',
      'en': '',
    },
    'mnsera66': {
      'es': 'Dia',
      'en': '',
    },
    'du6odv1c': {
      'es': 'Search...',
      'en': '',
    },
    'wsphi5a6': {
      'es': '1',
      'en': '',
    },
    'v05ieqhw': {
      'es': '2',
      'en': '',
    },
    '33uo3he1': {
      'es': '3',
      'en': '',
    },
    '6pkxx4fy': {
      'es': '4',
      'en': '',
    },
    'jget8pfx': {
      'es': '5',
      'en': '',
    },
    'bclkdij1': {
      'es': '6',
      'en': '',
    },
    'pt44nfth': {
      'es': '7',
      'en': '',
    },
    'x5lqhd85': {
      'es': '8',
      'en': '',
    },
    '1b5maahi': {
      'es': '9',
      'en': '',
    },
    'awp2b7b2': {
      'es': '10',
      'en': '',
    },
    'g0v5ta8f': {
      'es': '11',
      'en': '',
    },
    '2ro6samo': {
      'es': '12',
      'en': '',
    },
    '8er6n57c': {
      'es': '13',
      'en': '',
    },
    'jdp0gs5y': {
      'es': '14',
      'en': '',
    },
    'h1wqojes': {
      'es': '15',
      'en': '',
    },
    'b4798q42': {
      'es': '16',
      'en': '',
    },
    'iy1onv92': {
      'es': '17',
      'en': '',
    },
    'fqr5kjvd': {
      'es': '18',
      'en': '',
    },
    'fb8ab0v7': {
      'es': '19',
      'en': '',
    },
    'gd1q3x6k': {
      'es': '20',
      'en': '',
    },
    'k73as99m': {
      'es': '21',
      'en': '',
    },
    'd9ttck2w': {
      'es': '22',
      'en': '',
    },
    'rs9medqs': {
      'es': '23',
      'en': '',
    },
    'koqqu0na': {
      'es': '24',
      'en': '',
    },
    '7l3tnl8y': {
      'es': '25',
      'en': '',
    },
    't16d6131': {
      'es': '26',
      'en': '',
    },
    'eqsrpavl': {
      'es': '27',
      'en': '',
    },
    'exobtt4v': {
      'es': '28',
      'en': '',
    },
    '35fb4xv5': {
      'es': '29',
      'en': '',
    },
    'unhu57sy': {
      'es': '30',
      'en': '',
    },
    's2ap7eit': {
      'es': '31',
      'en': '',
    },
    'kkirolsk': {
      'es': 'Mes',
      'en': '',
    },
    '2b7w0rwz': {
      'es': 'Search...',
      'en': '',
    },
    'e33j03zn': {
      'es': 'Enero',
      'en': '',
    },
    'tznvjkkj': {
      'es': 'Febrero',
      'en': '',
    },
    'hdo08fp4': {
      'es': 'Marzo',
      'en': '',
    },
    'kkjmy3yo': {
      'es': 'Abril',
      'en': '',
    },
    'bg5wrpyt': {
      'es': 'Mayo',
      'en': '',
    },
    '4qdojzhi': {
      'es': 'Junio',
      'en': '',
    },
    'srn9fv8n': {
      'es': 'Julio',
      'en': '',
    },
    'pksjiy8y': {
      'es': 'Agosto',
      'en': '',
    },
    'f5wr4us4': {
      'es': 'Septiembre',
      'en': '',
    },
    'ndfh8nme': {
      'es': 'Octubre',
      'en': '',
    },
    '8u02ci5g': {
      'es': 'Noviembre',
      'en': '',
    },
    '5dqdasm1': {
      'es': 'Diciembre',
      'en': '',
    },
    '5ffun5i9': {
      'es': 'Dia de finalizacion:',
      'en': '',
    },
    'hx2dvpqi': {
      'es': 'Hora',
      'en': '',
    },
    '212kw3q7': {
      'es': 'Search...',
      'en': '',
    },
    '21806xr2': {
      'es': '08',
      'en': '',
    },
    'rh35183y': {
      'es': '09',
      'en': '',
    },
    'adj5yocm': {
      'es': '10',
      'en': '',
    },
    'mya26wdz': {
      'es': '11',
      'en': '',
    },
    '0d0adbe1': {
      'es': '12',
      'en': '',
    },
    'xuqfhwxv': {
      'es': '13',
      'en': '',
    },
    'srscutec': {
      'es': '14',
      'en': '',
    },
    '6lei1c8p': {
      'es': '15',
      'en': '',
    },
    'awo6d2em': {
      'es': '16',
      'en': '',
    },
    'n82bqwvm': {
      'es': '17',
      'en': '',
    },
    '6c7y3usz': {
      'es': '18',
      'en': '',
    },
    'h7rkgiwe': {
      'es': '19',
      'en': '',
    },
    'jr4g1u4a': {
      'es': '20',
      'en': '',
    },
    'sht36312': {
      'es': 'Dia',
      'en': '',
    },
    'ayh789g5': {
      'es': 'Search...',
      'en': '',
    },
    '19mfonnm': {
      'es': '1',
      'en': '',
    },
    'rt8bd4gf': {
      'es': '2',
      'en': '',
    },
    'xau5wssg': {
      'es': '3',
      'en': '',
    },
    '34i3hhzq': {
      'es': '4',
      'en': '',
    },
    'mzs2ju37': {
      'es': '5',
      'en': '',
    },
    'jxnwa56j': {
      'es': '6',
      'en': '',
    },
    'n6iyxcc5': {
      'es': '7',
      'en': '',
    },
    'rgv3r2nx': {
      'es': '8',
      'en': '',
    },
    '6tvg2iez': {
      'es': '9',
      'en': '',
    },
    '0tn66lg6': {
      'es': '10',
      'en': '',
    },
    'ib2gt619': {
      'es': '11',
      'en': '',
    },
    'k7nex4a6': {
      'es': '12',
      'en': '',
    },
    'ltw079hj': {
      'es': '13',
      'en': '',
    },
    '4upkfaxj': {
      'es': '14',
      'en': '',
    },
    'nmt7q47s': {
      'es': '15',
      'en': '',
    },
    'dxw74dby': {
      'es': '16',
      'en': '',
    },
    'fw89cw87': {
      'es': '17',
      'en': '',
    },
    'zur2w5q5': {
      'es': '18',
      'en': '',
    },
    'vnqk4wad': {
      'es': '19',
      'en': '',
    },
    'osl1vlqc': {
      'es': '20',
      'en': '',
    },
    'rdljkkss': {
      'es': '21',
      'en': '',
    },
    'nj6eoy9z': {
      'es': '22',
      'en': '',
    },
    '5dmogrt0': {
      'es': '23',
      'en': '',
    },
    'v47pbpvl': {
      'es': '24',
      'en': '',
    },
    'lusrsghn': {
      'es': '25',
      'en': '',
    },
    '6rg7fdoc': {
      'es': '26',
      'en': '',
    },
    'a0s2rgrx': {
      'es': '27',
      'en': '',
    },
    'xu7i2mk8': {
      'es': '28',
      'en': '',
    },
    '74f3idi0': {
      'es': '29',
      'en': '',
    },
    'lp7hsb73': {
      'es': '30',
      'en': '',
    },
    'visvxe29': {
      'es': '31',
      'en': '',
    },
    '384xgpx0': {
      'es': 'Mes',
      'en': '',
    },
    'trhc9may': {
      'es': 'Search...',
      'en': '',
    },
    'dpgocuvh': {
      'es': 'Enero',
      'en': '',
    },
    '43d0a42i': {
      'es': 'Febrero',
      'en': '',
    },
    'tcb8j2jv': {
      'es': 'Marzo',
      'en': '',
    },
    '7xzfnjzj': {
      'es': 'Abril',
      'en': '',
    },
    'grj8tyvp': {
      'es': 'Mayo',
      'en': '',
    },
    'r3mn26g8': {
      'es': 'Junio',
      'en': '',
    },
    'z1h1hm8x': {
      'es': 'Julio',
      'en': '',
    },
    'c2o0uo60': {
      'es': 'Agosto',
      'en': '',
    },
    '03vgclmx': {
      'es': 'Septiembre',
      'en': '',
    },
    'cop966wu': {
      'es': 'Octubre',
      'en': '',
    },
    'hooi4y98': {
      'es': 'Noviembre',
      'en': '',
    },
    'l54uwf19': {
      'es': 'Diciembre',
      'en': '',
    },
    'd52yzwoe': {
      'es': 'Describe el problema...',
      'en': '',
    },
    'fvsuasx7': {
      'es': 'Order-Id',
      'en': '',
    },
    'vv7dvocq': {
      'es': 'Home',
      'en': '',
    },
  },
  // A3-5_registerSuccess_modal
  {
    'vkxriblo': {
      'es': 'Registro Exitoso',
      'en': 'Registration Successful',
    },
    'h2xdozlk': {
      'es':
          '¡Felicitaciones! su cuenta ya creada.\nInicie sesión para obtener una experiencia increíble.',
      'en':
          'Congratulations! Your account is now created.\nSign in for an amazing experience.',
    },
    't4tt10im': {
      'es': 'Ir a inicio',
      'en': 'Go to home',
    },
  },
  // A3-6_OlvideContrasea
  {
    '68da8o48': {
      'es': 'Olvide mi contraseña',
      'en': 'I forgot my password',
    },
    'laq1e1na': {
      'es': 'Ingresa tu Email o Numero de telefono',
      'en': 'Enter your email or phone number',
    },
    '4wi8kjyp': {
      'es': ' Email o Numero de telefono',
      'en': 'Email or Phone Number',
    },
    '4ligppz0': {
      'es': 'Enviar Codigo',
      'en': 'Send Code',
    },
  },
  // A7-5_Ubicacion
  {
    'wss38bpn': {
      'es': '¿Estás seguro de que deseas activar tu ubicación?',
      'en': 'Are you sure you want to activate your location?',
    },
    '29xlhpns': {
      'es': 'Cancelar',
      'en': 'Cancel',
    },
    'zuga39cj': {
      'es': 'Si, permitir',
      'en': 'Yes, allow',
    },
  },
  // A7_CambiarMetodoPago
  {
    'vdt5chjy': {
      'es': 'Metodo de pago',
      'en': '',
    },
    '4ujur370': {
      'es': 'Añadir metodo de pago',
      'en': '',
    },
    'yx6c24gu': {
      'es': 'Subministrar metodo de pago',
      'en': '',
    },
  },
  // A7_PedidoExitoso
  {
    'ai8qoftl': {
      'es': 'Orden hecha exitosamente',
      'en': '',
    },
    '8w3ex41n': {
      'es': 'El presupuestador esta en camino, llegara en breves!',
      'en': '',
    },
    'znwujg1g': {
      'es': 'Seguimiento de pedidos',
      'en': '',
    },
  },
  // A15_CerrarSesion
  {
    '38q11wq9': {
      'es': 'Estas seguro que queres cerrar sesion?',
      'en': '',
    },
    'mpj8eknt': {
      'es': 'Cancelar',
      'en': '',
    },
    'p19zdwc8': {
      'es': 'Cerrar Sesion',
      'en': '',
    },
  },
  // B1-5_Postulacionexitosa
  {
    '9rnr09t3': {
      'es': 'Solicitud hecha exitosamente',
      'en': '',
    },
    'kbl23s1r': {
      'es':
          'Nuestro equipo se pondra en contacto en breves por whatsapp para acordar una entrevista por videollamada. ',
      'en': '',
    },
  },
  // presu
  {
    '007te46b': {
      'es': 'Tipo de servicio',
      'en': '',
    },
    'eqt6v0gl': {
      'es': 'Search...',
      'en': '',
    },
    '5hjkwkhk': {
      'es': 'ALBAÑIL',
      'en': '',
    },
    'pzjrlmqh': {
      'es': 'PLOMERO',
      'en': '',
    },
    '0urxejvk': {
      'es': 'GASISTA',
      'en': '',
    },
    '1ucfdkgj': {
      'es': 'ELECTRICISTA',
      'en': '',
    },
    'zavqnwcv': {
      'es': 'JARDINERIA Y PAISAJISMO',
      'en': '',
    },
    'ue1wiu6d': {
      'es': 'TECHISTA',
      'en': '',
    },
    'kur7k55q': {
      'es': 'PINTOR',
      'en': '',
    },
    '3pwjhrjp': {
      'es': 'TECNICO DE AIRE',
      'en': '',
    },
    'xops7m7s': {
      'es': 'CARPINTERO',
      'en': '',
    },
    'c3ae1uk6': {
      'es': 'CONSTRUCCIÓN Y ARQUITECTURA',
      'en': '',
    },
    '5scyf7s2': {
      'es': 'DECORACION',
      'en': '',
    },
    'eqx0u22b': {
      'es': 'TECNICO EN ELECTRODOMESTICOS',
      'en': '',
    },
    '0t221d5u': {
      'es': 'PEQUEÑOS ARREGLOS',
      'en': '',
    },
    'qmv5zpug': {
      'es': 'Tipo de trabajo',
      'en': '',
    },
    'u41k7wza': {
      'es': 'Search...',
      'en': '',
    },
    'z31k1m0l': {
      'es': 'Option 1',
      'en': '',
    },
    '4ofwyeme': {
      'es': 'Cantidad',
      'en': '',
    },
    '4w5lt4r9': {
      'es': 'Cantidad de dias',
      'en': '',
    },
  },
  // C4_PresupuestoExitoso
  {
    'xeg8pkei': {
      'es': 'Presupuesto hecho exitosamente',
      'en': '',
    },
    'r5902319': {
      'es': 'El presupuesto se le envio al client!',
      'en': '',
    },
    '5b7grjfc': {
      'es': 'Seguir presupuestando',
      'en': '',
    },
  },
  // B5_AceptarTrabajo
  {
    'w08giuea': {
      'es': 'Condiciones',
      'en': '',
    },
    'oy2cw817': {
      'es':
          '-Cuplir con los tiempos estimados del trabajo\n-Respetar la conducta requerida a la hora de prestar el servicio\n-No usar las instalaciones de donde se preste el servicio\n-Limpiar las instalaciones al finalizar\n-\n',
      'en': '',
    },
    'vsf2yw9f': {
      'es': 'Termino y condiciones',
      'en': '',
    },
    'hpyvwm5w': {
      'es': 'Aceptar servicio',
      'en': '',
    },
  },
  // A9-5_Pagar
  {
    'vved3zbs': {
      'es': 'Metodo de pago',
      'en': '',
    },
    '9yjil4gn': {
      'es': 'Termino y condiciones',
      'en': '',
    },
    'vl987uj2': {
      'es': 'Pagar',
      'en': '',
    },
  },
  // A9-1_RechazarPresupuesto
  {
    'mfi4kk4g': {
      'es': '¿Estás seguro de rechazar el presupuesto?',
      'en': '',
    },
    'iva4wpkm': {
      'es': 'Rechazar',
      'en': '',
    },
    'wpa7hwuq': {
      'es': 'Cancelar',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'b3u7as3r': {
      'es': 'Create Account',
      'en': 'Create Account',
    },
    'ctqamqlc': {
      'es': 'Create your username',
      'en': 'Create your username',
    },
    'umpm3yh5': {
      'es': 'Sign Up with Google',
      'en': 'Sign Up with Google',
    },
    'u17s3o3i': {
      'es': 'Let\'s find the food you like',
      'en': 'Let\'s find the food you like',
    },
    'm470nw6c': {
      'es': 'San Diego, CA',
      'en': 'San Diego, CA',
    },
    'tkq1nhez': {
      'es': 'Recommended',
      'en': 'Recommended',
    },
    'amak33fx': {
      'es': 'Cancel',
      'en': 'Cancel',
    },
    '5hctr45y': {
      'es': 'Add to Cart',
      'en': 'Add to Cart',
    },
    'fazi37bo': {
      'es': 'Get Discount',
      'en': 'Get Discount',
    },
    '6on3f8zv': {
      'es': 'Enter voucher code',
      'en': 'Enter voucher code',
    },
    'vc3k7k6z': {
      'es': 'Hamburgers',
      'en': 'Hamburgers',
    },
    'cvmlykt8': {
      'es': 'On Progress',
      'en': 'On Progress',
    },
    'ogz0ss6o': {
      'es': 'Edit Profile',
      'en': 'Edit Profile',
    },
    'emrgmgmz': {
      'es': '',
      'en': '',
    },
    'c2se9qqc': {
      'es': '',
      'en': '',
    },
    'cpbcsw9m': {
      'es': '',
      'en': '',
    },
    'zi2yt9e7': {
      'es': '',
      'en': '',
    },
    'vnau18bv': {
      'es': '',
      'en': '',
    },
    'lktg3dy4': {
      'es': '',
      'en': '',
    },
    'fjabeg9r': {
      'es': '',
      'en': '',
    },
    '7yw004o2': {
      'es': '',
      'en': '',
    },
    'xsjq375t': {
      'es': '',
      'en': '',
    },
    'xiyzhulx': {
      'es': '',
      'en': '',
    },
    'm3u1mw7e': {
      'es': '',
      'en': '',
    },
    'pknqxi1n': {
      'es': '',
      'en': '',
    },
    'fuajpyfp': {
      'es': '',
      'en': '',
    },
    'dvzeat75': {
      'es': '',
      'en': '',
    },
    '4bdekwbm': {
      'es': '',
      'en': '',
    },
    'rvm9rdle': {
      'es': '',
      'en': '',
    },
    '3uxb43tw': {
      'es': '',
      'en': '',
    },
    'g8ay9flm': {
      'es': '',
      'en': '',
    },
    '0raeaqd3': {
      'es': '',
      'en': '',
    },
    'j3d762mc': {
      'es': '',
      'en': '',
    },
    'jzepjy1z': {
      'es': '',
      'en': '',
    },
    'dlctomaa': {
      'es': '',
      'en': '',
    },
    'fdy7k4vs': {
      'es': '',
      'en': '',
    },
    'o37sr5xj': {
      'es': '',
      'en': '',
    },
    'v8s1znh7': {
      'es': '',
      'en': '',
    },
    'jg3a7edz': {
      'es': '',
      'en': '',
    },
    'pcwstkno': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
