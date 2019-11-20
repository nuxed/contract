namespace Nuxed\Contract\Http\Server;

interface IServer {
  /**
   * Sets the Authenticator for this server.
   */
  public function setAuthenticator(
    ?Authenticator\IAuthenticator $authenticator,
  ): void;

  /**
   * Sets the handler for this server.
   */
  public function setHandler(IHandler $handler): void;

  /**
   * Sets the middleware stack for this server.
   */
  public function setMiddlewareStack(IMiddlewareStack $middleware): void;

  /**
   * Binds this server to the given address and port number.
   */
  public function bind(string $address, int $port = 8080): void;

  /**
   * returns the address this server is listening on.
   */
  public function getAddress(): string;

  /**
   * Starts the server in the background.
   */
  public function start(): Awaitable<void>;

  /**
   * Stops this server by closing the listening socket and disallowing any new requests
   * from being processed.
   */
  public function stop(int $deply = 0): Awaitable<void>;
}
