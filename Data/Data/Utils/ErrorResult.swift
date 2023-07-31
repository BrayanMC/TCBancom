//
//  ErrorResult.swift
//  Data
//
//  Created by Brayan Munoz Campos on 31/07/23.
//

public struct ErrorCodeGeneral {
    public static let NetworkError = 0
    public static let DefaultError = 1
    public static let BadRequestError = 2
    public static let ServerError = 3
    public static let SessionExpired = 5
    public static let TimeOutError = 1000
}

public enum ErrorMessage: String {
    case NetworkConnectionError = "Tu conexión a internet está fallando,\npor favor intenta de nuevo."
    case DefaultError = "Lo sentimos, por favor vuelve a intentar."
    case ServerError = "¡Lo sentimos, algo inesperado ha sucedido por favor inténtalo nuevamente!"
    case BadRequestError = "¡Lo sentimos algo inesperado ha sucedido por favor vuelva a intentarlo en unos momentos!"
    case SessionExpired = "Usted superó el tiempo límite en el app, por su seguridad se procedió a cerrar su sesión"
}

public enum ErrorTitle: String {
    case DefaultError = "Parece que algo salió mal"
    case ServerError
    case BadRequestError
    case NetworkConnectionError = "Revisa tu conexión a internet"
    case SessionExpired
    
    var description: String {
        switch self {
        case .ServerError, .BadRequestError, .SessionExpired:
            return "¡Algo ocurrió!"
        default:
            return rawValue
        }
    }
}

public class ErrorResult: Error {
    
    public var messageError: String? //title
    public var titleError: String?
    public var body: String? = nil
    public var code: Int?

    public init(code: Int){
        self.code = code
    }

    public init(messageError: String?) {
        if let message = messageError {
             self.messageError = message
        } else {
            self.messageError = ErrorMessage.DefaultError.rawValue
        }
     }

    public init(title: String?, message: String?) {
        self.messageError = title
        self.body = message
    }

    public init(messageError: String?, codeError: Int?) {
        if let message = messageError {
            self.messageError = message
        } else {
            self.messageError = ErrorMessage.DefaultError.rawValue
        }

        if let code = codeError {
            self.code = code
        }
        self.titleError = ""
    }

    public init(messageError: String?, codeError: Int?, titleError: String?) {
        if let message = messageError {
            self.messageError = message
        } else {
            self.messageError = ErrorMessage.DefaultError.rawValue
        }

        if let code = codeError {
            self.code = code
        }

        if let title = titleError {
            self.titleError = title
        } else {
            self.titleError = ""
        }
    }
}

var networkConnectionError: ErrorResult = ErrorResult(
    messageError: ErrorMessage.NetworkConnectionError.rawValue,
    codeError: ErrorCodeGeneral.NetworkError,
    titleError: ErrorTitle.NetworkConnectionError.description
)
var defaultError: ErrorResult = ErrorResult(
    messageError: ErrorMessage.DefaultError.rawValue,
    codeError: ErrorCodeGeneral.DefaultError,
    titleError: ErrorTitle.DefaultError.description
)
var serverError: ErrorResult = ErrorResult(
    messageError: ErrorMessage.ServerError.rawValue,
    codeError: ErrorCodeGeneral.ServerError,
    titleError: ErrorTitle.ServerError.description
)
var badRequestError: ErrorResult = ErrorResult(
    messageError: ErrorMessage.BadRequestError.rawValue,
    codeError: ErrorCodeGeneral.BadRequestError,
    titleError: ErrorTitle.BadRequestError.description
)
var expirationError: ErrorResult = ErrorResult(
    messageError: ErrorMessage.SessionExpired.rawValue,
    codeError: ErrorCodeGeneral.SessionExpired,
    titleError: ErrorTitle.SessionExpired.description
)
