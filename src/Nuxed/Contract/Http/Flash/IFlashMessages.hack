namespace Nuxed\Contract\Http\Flash;

use namespace Nuxed\Contract\Http\Session;

interface IFlashMessages {
  /**
   * Create an instance from a session container.
   */
  public static function create(
    Session\ISession $session
  ): this;

  /**
   * Set a flash value with the given key.
   */
  public function flash(string $name, dynamic $value, int $hops = 1): void;

  /**
   * Set a flash value with the given key, but allow access during this request.
   */
  public function now(string $name, dynamic $value, int $hops = 1): void;

  /**
  * Retrieve a flash value.
  */
  public function get(string $name, mixed $default = null): dynamic;

  /**
   * Retrieve all flash items.
   */
  public function items(): KeyedContainer<string, dynamic>;

  /**
   * Clear all flash values.
   */
  public function clear(): void;

  /**
   * Prolongs any current flash messages for one more hop.
   */
  public function prolong(): void;
}
