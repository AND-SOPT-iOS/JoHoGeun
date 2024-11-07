//
//  UserService.swift
//  35-Seminar
//
//  Created by 조호근 on 11/2/24.
//

import Foundation
import Alamofire

/// 클래스는 라우터 별로 나눠줄 수 있음!
/// 라우터란 URL의 분기점. 이 클래스의 분기점은 /user 임
class UserService {

  /// 등록 API 콜이 일어나는 메소드
  /// 파라미터는 Request Body에 필요한 것들
  func register(
    username: String,
    password: String,
    hobby: String,
    completion: @escaping (Result<Bool, NetworkError>) -> Void
  ) {

    /// baseURL + /user = http://211.188.53.75:8080/user
    let url = Environment.baseURL + "/user"

    /// 파라미터는 Request Body,
    /// HTTP 요청에서 전송되는 데이터를 일반적으로 "parameters" 또는 "params"라고 부름.
    /// GET 요청의 쿼리 파라미터나 POST 요청의 바디 데이터 모두 "parameters"로 통일해서 부름
    let parameters = RegisterRequest(
      username: username,
      password: password,
      hobby: hobby
    )

    /// Request시 url, method, parameters, 인코딩 방식을 파라미터로 넘겨주어야 함.
    AF.request(
      url,
      method: .post,
      parameters: parameters,
      encoder: JSONParameterEncoder.default
    )
    .validate()
    .response { [weak self] response in

      /// 다양한 정보가 넘어오게 되는데, 우리에게 중요한 것은 보통 statusCode와 data임
      /// self를 해준 이유는 클래스 내의 다른 함수에 접근해야 하고 response가 escaping closure이기 때문
      guard let statusCode = response.response?.statusCode,
            let data = response.data,
            let self
      else {
        completion(.failure(.unknownError))
        return
      }

      /// public let result: Result<Success, Failure>
      /// Alamofire의 data response에는 result 프로퍼티가 존재하는데, 해당 프로퍼티는 Result<Success, Failure> 타입임!
      /// 이 말은, 타입이 다른 함수에서 리턴되어 넘어갈 때, success로 넘어갈 수 있고 failure로 넘어갈 수 있다는 것
      /// 그리고 그 안에는 우리가 원하는 결과값들이 존재한다.
      /// Result<Bool, NetworkError>
      /// Success 하면 Bool 값을, Failure 하면 NetworkError를 리턴하겠다는 뜻
      /// Success에는 원하는 타입이 올 수 있고, Failure에는 Error 프로토콜이 채택된 것이 리턴될 수 있도록 되어야 함
      switch response.result {
      case .success:
        /// 네트워크 요청이 성공적으로 진행되었을 때, escaping closure을 실행하고 bool값을 success로 넘김.
        completion(.success(true))
      case .failure:
        /// 네트워크 요청이 실패했을 때, 어떤 이유인지 파악하여 escaping closure을 실행하고 파악된 error를 넘김
        let error = self.handleStatusCode(statusCode, data: data)
        completion(.failure(error))
      }
    }
  }

  /// 서버의 명세서 기반으로 에러 처리를 진행해줌
  func handleStatusCode(
    _ statusCode: Int,
    data: Data
  ) -> NetworkError {
    let errorCode = decodeError(data: data)
    switch (statusCode, errorCode) {
    case (400, "00"):
      return .invalidRequest
    case (400, "01"):
      return .expressionError
    case (404, ""):
      return .invalidURL
    case (409, "00"):
      return .duplicateError
    case (500, ""):
      return .serverError
    default:
      return .unknownError
    }
  }

  func decodeError(data: Data) -> String {
    guard let errorResponse = try? JSONDecoder().decode(
      ErrorResponse.self,
      from: data
    ) else { return "" }
    return errorResponse.code
  }
}
