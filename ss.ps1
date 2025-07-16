Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$screenWidth = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize.Width
$screenHeight = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize.Height

$bitmap = New-Object System.Drawing.Bitmap $screenWidth, $screenHeight
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.CopyFromScreen(0, 0, 0, 0, $bitmap.Size)

$filename = "screenshot.png"
$bitmap.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)

$graphics.Dispose()
$bitmap.Dispose()
