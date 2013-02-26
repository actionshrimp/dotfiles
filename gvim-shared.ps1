Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class ProfileCalls
    {
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool SetForegroundWindow(IntPtr hWnd);
    }
"@

if ($args) {
    & 'E:\Program Files (x86)\Vim\vim73\gvim.exe' --servername GVIM --remote-tab-silent $args 
} else {
    try
    {
        $p = (Get-Process gvim -ErrorAction 'Stop')
        if ($p.GetType().ToString() -ne "System.Diagnostics.Process")
        {
            $p = $p[0]
        }
        & 'E:\Program Files (x86)\Vim\vim73\gvim.exe' --remote-send "<Esc>:tabe<CR>"
        $h = ($p).MainWindowHandle
        [void] [ProfileCalls]::SetForegroundWindow($h)
    } catch {
        & 'E:\Program Files (x86)\Vim\vim73\gvim.exe'
    }
}
