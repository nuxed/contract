namespace Nuxed\Contract\Http\Message;

/**
 * Defines constants for common HTTP status code.
 *
 * @see https://tools.ietf.org/html/rfc2295#section-8.1
 * @see https://tools.ietf.org/html/rfc2324#section-2.3
 * @see https://tools.ietf.org/html/rfc2518#section-9.7
 * @see https://tools.ietf.org/html/rfc2774#section-7
 * @see https://tools.ietf.org/html/rfc3229#section-10.4
 * @see https://tools.ietf.org/html/rfc4918#section-11
 * @see https://tools.ietf.org/html/rfc5842#section-7.1
 * @see https://tools.ietf.org/html/rfc5842#section-7.2
 * @see https://tools.ietf.org/html/rfc6585#section-3
 * @see https://tools.ietf.org/html/rfc6585#section-4
 * @see https://tools.ietf.org/html/rfc6585#section-5
 * @see https://tools.ietf.org/html/rfc6585#section-6
 * @see https://tools.ietf.org/html/rfc7231#section-6
 * @see https://tools.ietf.org/html/rfc7238#section-3
 * @see https://tools.ietf.org/html/rfc7725#section-3
 * @see https://tools.ietf.org/html/rfc7540#section-9.1.2
 * @see https://tools.ietf.org/html/rfc8297#section-2
 * @see https://tools.ietf.org/html/rfc8470#section-7
 */
enum StatusCode: int as int {
  // Informational 1xx
  Continue = 100;
  SwitchingProtocols = 101;
  Processing = 102;
  EarlyHints = 103;
  // Successful 2xx
  Ok = 200;
  Created = 201;
  Accepted = 202;
  NonAuthoritativeInformation = 203;
  NoContent = 204;
  ResetContent = 205;
  PartialContent = 206;
  MultiStatus = 207;
  AlreadyReported = 208;
  ImUsed = 226;
  // Redirection 3xx
  MultipleChoices = 300;
  MovedPermanently = 301;
  Found = 302;
  SeeOther = 303;
  NotModified = 304;
  UseProxy = 305;
  Reserved = 306;
  TemporaryRedirect = 307;
  PermanentRedirect = 308;
  // Client Errors 4xx
  BadRequest = 400;
  Unauthorized = 401;
  PaymentRequired = 402;
  Forbidden = 403;
  NotFound = 404;
  MethodNotAllowed = 405;
  NotAcceptable = 406;
  ProxyAuthenticationRequired = 407;
  RequestTimeout = 408;
  Conflict = 409;
  Gone = 410;
  LengthRequired = 411;
  PreconditionFailed = 412;
  PayloadTooLarge = 413;
  UriTooLong = 414;
  UnsupportedMediaType = 415;
  RangeNotSatisfiable = 416;
  ExpectationFailed = 417;
  ImATeapot = 418;
  MisdirectedRequest = 421;
  UnprocessableEntity = 422;
  Locked = 423;
  FailedDependency = 424;
  TooEarly = 425;
  UpgradeRequired = 426;
  PreconditionRequired = 428;
  TooManyRequests = 429;
  RequestHeaderFieldsTooLarge = 431;
  UnavailableForLegalReasons = 451;
  // Server Errors 5xx
  InternalServerError = 500;
  NotImplemented = 501;
  BadGateway = 502;
  ServiceUnavailable = 503;
  GatewayTimeout = 504;
  VersionNotSupported = 505;
  VariantAlsoNegotiates = 506;
  InsufficientStorage = 507;
  LoopDetected = 508;
  NotExtended = 510;
  NetworkAuthenticationRequired = 511;
}
