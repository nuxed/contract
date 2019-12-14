namespace Nuxed\Contract\Log;

/**
 * Describes log levels.
 */
enum LogLevel: string {
  Emergency = 'emergency';
  Alert = 'alert';
  Critical = 'critical';
  Error = 'error';
  Warning = 'warning';
  Notice = 'notice';
  Info = 'info';
  Debug = 'debug';
}
