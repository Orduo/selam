$filePath = "C:\cloudflared.txt"
$password = "GucluBirSifre123!"

$content = Get-Content -Path $filePath -Raw

$keyString = $password.PadRight(32)
$key = [System.Text.Encoding]::UTF8.GetBytes($keyString)[0..31]

$iv = [byte[]](0..15)

$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key
$aes.IV = $iv
$aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
$aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7

$encryptor = $aes.CreateEncryptor()
$plainBytes = [System.Text.Encoding]::UTF8.GetBytes($content)
$encryptedBytes = $encryptor.TransformFinalBlock($plainBytes, 0, $plainBytes.Length)
$encoded = [Convert]::ToBase64String($encryptedBytes)

Write-Host "Şifreli Base64 Metin:" 
Write-Host $encoded
