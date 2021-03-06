namespace Nuxed\Contract\Translation;

interface ITranslator {
  /**
   * Translates the given message.
   *
   * @param string                                    $id
   *        The message id
   *
   * @param KeyedContainer<string, string|int|float>  $parameters
   *        A container of parameters for the message
   *
   * @param string|null                               $domain
   *        The domain for the message or null to use the default
   *
   * @param string|null                               $locale
   *        The locale or null to use the default
   *
   * @return string The translated string
   *
   * @throws Exception\InvalidArgumentException If the locale contains invalid
   * characters
   */
  public function trans(
    string $id,
    KeyedContainer<string, mixed> $parameters = dict[],
    ?string $domain = null,
    ?string $locale = null,
  ): Awaitable<string>;
}
