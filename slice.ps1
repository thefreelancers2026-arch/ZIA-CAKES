Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile('d:\ZIA\assets\grid.jpg.png')
$bmp = New-Object System.Drawing.Bitmap($img)

function Crop-Image ($outName, $x, $y, $w, $h) {
    $rect = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
    $cropped = $bmp.Clone($rect, $bmp.PixelFormat)
    $cropped.Save("d:\ZIA\assets\$outName", [System.Drawing.Imaging.ImageFormat]::Jpeg)
    $cropped.Dispose()
}

Crop-Image "cat_cupcakes.jpg" 0 0 938 768
Crop-Image "cat_kids.jpg" 938 0 938 768
Crop-Image "cat_tea.jpg" 1878 0 938 768
Crop-Image "cat_corporate.jpg" 1878 768 938 768

$bmp.Dispose()
$img.Dispose()
