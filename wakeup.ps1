<#
Made by NIKFED2000
This program can handle the daily routine
of powering on a large fleet of computers
on a local network by using the devices' MAC addresses.
#>
$MacList = @(
    "Input your mac (one or several) here"
)

$UDPClient = New-Object System.Net.Sockets.UdpClient
$UDPClient.Connect(([System.Net.IPAddress]::Broadcast), 9)

foreach ($MacAddress in $MacList) {
    try {
        $MacBytes = $MacAddress.Trim() -split '[:-]' | ForEach-Object { [Convert]::ToByte($_, 16) }
        $Packet = [Byte[]](,0xFF * 6) + ($MacBytes * 16)
        [void]$UDPClient.Send($Packet, $Packet.Length)
    }
    catch {}
}

$UDPClient.Close()
