namespace Nuxed\Contract\EventDispatcher\EventListener;

use namespace Nuxed\Contract\EventDispatcher\Event;

/**
 * Defines a listener for an event.
 */
interface IEventListener<T as Event\IEvent> {
  /**
   * Process the given event, and return it.
   */
  public function process(T $event): Awaitable<T>;
}
