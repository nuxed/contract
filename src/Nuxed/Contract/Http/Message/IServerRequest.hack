namespace Nuxed\Contract\Http\Message;

use namespace Nuxed\Contract\Http\{Flash, Server, Session};

/**
 * Representation of an incoming, server-side HTTP request.
 *
 * Per the HTTP specification, this interface includes properties for
 * each of the following:
 *
 * - Protocol version
 * - HTTP method
 * - URI
 * - Headers
 * - Message body
 * - Session
 * - Session Flash
 *
 * Additionally, it encapsulates all data as it has arrived to the
 * application from the CGI and/or Hack environment, including:
 *
 * - Any cookies provided
 * - Query string arguments
 * - Upload files, if any
 * - Deserialized body parameters
 *
 * Server parameter values MUST be treated as immutable, as they represent application
 * state at the time of request; as such, no methods are provided to allow
 * modification of those values.
 *
 * Additionally, this interface recognizes the utility of introspecting a
 * request to derive and match additional parameters (e.g., via URI path
 * matching, decrypting cookie values, deserializing non-form-encoded body
 * content, matching authorization headers to users, etc). These parameters
 * are stored in an "attributes" property.
 *
 * Requests are considered immutable; all methods that might change state MUST
 * be implemented such that they retain the internal state of the current
 * message and return an instance that contains the changed state.
 */
interface IServerRequest extends IRequest {
  /**
   * Retrieve server parameters.
   *
   * Retrieves data related to the incoming request environment.
   */
  public function getServerParams(): KeyedContainer<string, string>;

  /**
   * Retrieve cookies.
   *
   * Retrieves cookies sent by the client to the server.
   */
  public function getCookieParams(): KeyedContainer<string, string>;

  /**
   * Return an instance with the specified cookies.
   *
   * This method MUST NOT update the related Cookie header of the request
   * instance, nor related values in the server params.
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that has the
   * updated cookie values.
   */
  public function withCookieParams(
    KeyedContainer<string, string> $cookies,
  ): this;

  /**
   * Retrieve query string arguments.
   *
   * Retrieves the deserialized query string arguments, if any.
   *
   * Note: the query params might not be in sync with the URI or server
   * params. If you need to ensure you are only getting the original
   * values, you may need to parse the query string from `getUri()->getQuery()`
   */
  public function getQueryParams(): KeyedContainer<string, string>;

  /**
   * Return an instance with the specified query string arguments.
   *
   * These values SHOULD remain immutable over the course of the incoming
   * request. They MAY be injected during instantiation, or MAY be derived
   * from some other value such as the URI.
   *
   * Setting query string arguments MUST NOT change the URI stored by the
   * request, nor the values in the server params.
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that has the
   * updated query string arguments.
   */
  public function withQueryParams(KeyedContainer<string, string> $query): this;

  /**
   * Retrieve normalized file upload data.
   *
   * These values MAY be prepared from the message body during
   * instantiation, or MAY be injected via withUploadedFiles().
   */
  public function getUploadedFiles(): KeyedContainer<string, IUploadedFile>;

  /**
   * Create a new instance with the specified uploaded files.
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that has the
   * updated body parameters.
   *
   * @throws Exception\IException if an invalid structure is provided.
   */
  public function withUploadedFiles(
    KeyedContainer<string, IUploadedFile> $uploadedFiles,
  ): this;

  /**
   * Retrieve any parameters provided in the request body.
   *
   * If the request Content-Type is either application/x-www-form-urlencoded
   * or multipart/form-data, and the request method is POST, this method MUST
   * return the contents of the form submitted.
   *
   * Otherwise, this method may return any results of deserializing
   * the request body content; as parsing returns structured content, the
   * potential types MUST be a keyed container only. A null value indicates
   * the absence of body content.
   */
  public function getParsedBody(): ?KeyedContainer<string, string>;

  /**
   * Return an instance with the specified body parameters.
   *
   * These MAY be injected during instantiation.
   *
   * If the request Content-Type is either application/x-www-form-urlencoded
   * or multipart/form-data, and the request method is POST, use this method
   * ONLY to inject the contents of the submitted form.
   *
   * The data IS NOT REQUIRED to come from a submitted form, but MUST be the results of
   * deserializing the request body content. Deserialization/parsing returns
   * structured data, and, as such, this method ONLY accepts keyed containers,
   * or a null value if nothing was available to parse.
   *
   * As an example, if content negotiation determines that the request data
   * is a JSON payload, this method could be used to create a request
   * instance with the deserialized parameters.
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that has the
   * updated body parameters.
   *
   * @throws Exception\IException if an unsupported argument type is provided.
   */
  public function withParsedBody(
    ?KeyedContainer<string, string> $parsedBody,
  ): this;

  /**
   * Retrieve attributes derived from the request.
   *
   * The request "attributes" may be used to allow injection of any
   * parameters derived from the request: e.g., the results of path
   * match operations; the results of decrypting cookies; the results of
   * deserializing non-form-encoded message bodies; etc. Attributes
   * will be application and request specific, and CAN be mutable.
   */
  public function getAttributes(): KeyedContainer<string, dynamic>;

  /**
   * Retrieve a single derived request attribute.
   *
   * Retrieves a single derived request attribute as described in
   * getAttributes(). If the attribute has not been previously set, returns
   * the default value as provided.
   *
   * This method obviates the need for a hasAttribute() method, as it allows
   * specifying a default value to return if the attribute is not found.
   *
   * @see getAttributes()
   */
  public function getAttribute(
    string $attribute,
    mixed $default = null,
  ): dynamic;

  /**
   * Return an instance with the specified derived request attribute.
   *
   * This method allows setting a single derived request attribute as
   * described in getAttributes().
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that has the
   * updated attribute.
   *
   * @see getAttributes()
   */
  public function withAttribute(string $attribute, mixed $value): this;

  /**
   * Return an instance that removes the specified derived request attribute.
   *
   * This method allows removing a single derived request attribute as
   * described in getAttributes().
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that removes
   * the attribute.
   *
   * @see getAttributes()
   */
  public function withoutAttribute(string $attribute): this;

  /**
   * Return the http principal, which represent a user authenticated by HTTP Basic or
   * Digest authentication. A null value indicates the absence of a user authentication.
   */
  public function getPrincipal(): ?Server\IHttpPrincipal;

  /**
   * Return an instance with the specified http principal implementation.
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that has the
   * http principal instance.
   */
  public function withPrincipal(Server\IHttpPrincipal $principal): this;

  /**
   * Return an instance with the specified session implementation.
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that has the
   * session instance.
   */
  public function withSession(Session\ISession $session): this;

  /**

   * Whether the request contains a Session object.
   *
   * This method does not give any information about the state of the session object,
   * like whether the session is started or not. It is just a way to check if this request
   * is associated with a session instance.
   *
   * @see withSession()
   * @see getSession()
   */
  public function hasSession(): bool;

  /**
   * Gets the body of the message.
   *
   * @see hasSession()
   * @see withSession()
   */
  public function getSession(): Session\ISession;

  /**
   * Return an instance with the specified flash implementation.
   *
   * This method MUST be implemented in such a way as to retain the
   * immutability of the message, and MUST return an instance that has the
   * flash instance.
   */
  public function withFlash(Flash\IFlashMessages $flash): this;

  /**
   * Whether the request contains a flash object.
   *
   * @see withFlash()
   * @see getFlash()
   */
  public function hasFlash(): bool;

  /**
   * Gets the body of the message.
   *
   * @see hasFlash()
   * @see withFlash()
   */
  public function getFlash(): Flash\IFlashMessages;
}
