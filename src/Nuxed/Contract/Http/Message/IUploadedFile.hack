namespace Nuxed\Contract\Http\Message;

use namespace HH\Lib\Experimental\File;

interface IUploadedFile {
  public function getHandle(): File\ReadHandle;

  public function move(string $targetPath): Awaitable<void>;

  public function getError(): UploadedFileError;

  public function getClientFilename(): ?string;

  public function getClientMediaType(): ?string;
}
