using System.Diagnostics;
using System.Runtime.InteropServices;

// "Nx IDE.exe": знайти Nx.exe поруч і запустити `Nx.exe ide [аргументи]`
// без вікна консолі. Сам запускач одразу завершується.
var dir = AppContext.BaseDirectory;
var nx = Path.Combine(dir, OperatingSystem.IsWindows() ? "Nx.exe" : "Nx");
if (!File.Exists(nx))
{
    Fail($"Не знайдено {nx}.\nПеревстанови Nx IDE.");
    return 1;
}
var psi = new ProcessStartInfo(nx)
{
    UseShellExecute = false,
    CreateNoWindow = true,
    WorkingDirectory = dir,
};
psi.ArgumentList.Add("ide");
foreach (var a in args) psi.ArgumentList.Add(a);
try
{
    Process.Start(psi);
    return 0;
}
catch (Exception e)
{
    Fail("Не вдалося запустити Nx IDE:\n" + e.Message);
    return 1;
}

static void Fail(string text)
{
    // без WinForms (NativeAOT): звичайне вікно повідомлення Windows
    if (OperatingSystem.IsWindows()) MessageBoxW(IntPtr.Zero, text, "Nx IDE", 0x10);
    else Console.Error.WriteLine(text);
}

[DllImport("user32.dll", CharSet = CharSet.Unicode)]
static extern int MessageBoxW(IntPtr hWnd, string text, string caption, uint type);
