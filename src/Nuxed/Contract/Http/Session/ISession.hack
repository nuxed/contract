namespace Nuxed\Contract\Http\Session;

interface ISession {
  /**
   * Retrieve the session identifier.
   */
  public function getId(): string;

  /**
   * Retrieve a value from the session.
   *
   * @param mixed $default Default value to return if $name does not exist.
   */
  public function get(string $name, mixed $default = null): dynamic;

  /**
   * Whether or not the container has the given key.
   */
  public function contains(string $name): bool;

  /**
   * Store a value in the session.
   *
   * Values MUST be serializable in any format; we recommend ensuring the
   * values are JSON serializable for greatest portability.
   */
  public function put(string $name, mixed $value): void;

  /**
   * Store a value in the session if the key does not exist.
   */
  public function add(string $name, mixed $value): void;

  /**
   * Increment the value of an item in the session.
   */
  public function increment(string $key, num $value = 1): void;

  /**
   * Decrement the value of an item in the session.
   */
  public function decrement(string $key, num $value = 1): void;

  /**
   * Get an item from the session, or execute the given Closure and store the result.
   */
  public function remember<T>(string $key, (function(): T) $callback): T;

  /**
   * Remove a value from the session.
   */
  public function forget(string $name): void;

  /**
   * Clear all values.
   */
  public function clear(): void;

  /**
   * Deletes the current session data from the session and
   * deletes the session cookie. This is used if you want to ensure
   * that the previous session data can't be accessed again from the
   * user's browser.
   */
  public function flush(): void;

  /**
   * Method to determine if the session was flushed.
   */
  public function flushed(): bool;

  /**
   * Does the session contain changes? If not, the middleware handling
   * session persistence may not need to do more work.
   */
  public function changed(): bool;

  /**
   * Regenerate the session.
   *
   * This can be done to prevent session fixation. When executed, it SHOULD
   * return a new instance; that instance should always return true for
   * isRegenerated().
   */
  public function regenerate(): this;

  /**
   * Method to determine if the session was regenerated; should return
   * true if the instance was produced via regenerate().
   */
  public function regenerated(): bool;

  /**
   * Sets the expiration time for the session.
   *
   * The session will expire after that many seconds
   * of inactivity.
   *
   * for example, calling
   * <code>
   *     $session->exipre(300);
   * </code>
   * would make the session expire in 5 minutes of inactivity.
   */
  public function expire(int $duration): void;

  /*
   * Determine how long the session cookie should live.
   *
   * Generally, this will return the value provided to exipre().
   *
   * If that method has not been called, the value can return one of the
   * following:
   *
   * - 0 or a negative value, to indicate the cookie should be treated as a
   *   session cookie, and expire when the window is closed. This should be
   *   the default behavior.
   * - If expire() was provided during session creation or anytime later,
   *   the persistence engine should pull the TTL value from the session itself
   *   and return it here.
   */
  public function age(): int;

  /**
   * Retrieve all session items.
   */
  public function items(): KeyedContainer<string, dynamic>;
}
