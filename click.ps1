Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Move-Click {
    param (
        [int]$x,
        [int]$y
    )
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($x, $y)
    Add-Type -TypeDefinition @"
        using System;
        using System.Runtime.InteropServices;
        public class Mouse {
            [DllImport("user32.dll")]
            public static extern void mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);
            public const int MOUSEEVENTF_LEFTDOWN = 0x02;
            public const int MOUSEEVENTF_LEFTUP = 0x04;
        }
"@
    [Mouse]::mouse_event(0x02, 0, 0, 0, 0)
    Start-Sleep -Milliseconds 50
    [Mouse]::mouse_event(0x04, 0, 0, 0, 0)
}

function Write-Text {
    param (
        [string]$text
    )
    [System.Windows.Forms.SendKeys]::SendWait($text)
}

function Take-Screenshot {
    $screenWidth = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize.Width
    $screenHeight = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize.Height

    $bitmap = New-Object System.Drawing.Bitmap $screenWidth, $screenHeight
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen(0, 0, 0, 0, $bitmap.Size)
    $bitmap.Save("screenshot.png", [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bitmap.Dispose()
}

# === Mouse hareketleri + click ===
Move-Click 541 742
Start-Sleep -Seconds 2

Move-Click 443 748
Start-Sleep -Seconds 1

Write-Text "SaveYourTime limit time soon"
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 1

# === Screenshot al ===
Take-Screenshot
