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
    param (
        [string]$filename
    )
    $screenWidth = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize.Width
    $screenHeight = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize.Height
    $bitmap = New-Object System.Drawing.Bitmap $screenWidth, $screenHeight
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.CopyFromScreen(0, 0, 0, 0, $bitmap.Size)
    $bitmap.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)
    $graphics.Dispose()
    $bitmap.Dispose()
}

# === Mouse hareketleri + click ===
Move-Click 541 742
Start-Sleep -Seconds 2
Move-Click 443 748
Start-Sleep -Seconds 5
#tarayıcılar açıldı edge butona bastı
Move-Click 235 615
Move-Click 541 747
Start-Sleep -Seconds 4
Move-Click 887 661
Start-Sleep -Seconds 1    
Move-Click 504 677
Start-Sleep -Seconds 1    
Move-Click 675 675
Start-Sleep -Seconds 1
## açıldı
Move-Click 450 471
Start-Sleep -Seconds 1
#edge g
Move-Click 444 744
Start-Sleep -Seconds 1
Move-Click 100 595
Start-Sleep -Seconds 1
Move-Click 541 742
Start-Sleep -Seconds 1
#edge g
Move-Click 608 128
Start-Sleep -Seconds 1
Write-Text "SaveYourTime limit time soon"
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 1
#edge g
Move-Click 444 744
Start-Sleep -Seconds 1
Move-Click 100 605
Start-Sleep -Seconds 1
Move-Click 541 742
Start-Sleep -Seconds 1
#edge g
Move-Click 439 333
#chrome sayfasına girdik indirme kaldı
#edge g
Start-Sleep -Seconds 1
Move-Click 444 744
Start-Sleep -Seconds 2
Move-Click 100 610
Start-Sleep -Seconds 1
Move-Click 541 742
Start-Sleep -Seconds 1
#edge g
Move-Click 925 700
Start-Sleep -Seconds 1
Move-Click 921 264
Start-Sleep -Seconds 1
Move-Click 820 252
Start-Sleep -Seconds 3
Move-Click 578 254
# indirdi diğeri
Start-Sleep -Seconds 3
Move-Click 176 29
Start-Sleep -Seconds 1
Move-Click 316 131
Start-Sleep -Seconds 1
Write-Text "QuickPaste Upload files by Paste or Drop – fast and easy."
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 5
Take-Screenshot -filename "screenshot1.png"
# === Başlangıç
#Write-Text "SaveYourTime limit time soon"
#[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Move-Click 444 744
Start-Sleep -Seconds 1
Move-Click 100 640
Start-Sleep -Seconds 1
Move-Click 100 640
Start-Sleep -Seconds 1
#edge açıldı
Move-Click 257 52
Start-Sleep -Seconds 1
Write-Text "https://chromewebstore.google.com/"
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 3
Take-Screenshot -filename "screenshot2.png"
